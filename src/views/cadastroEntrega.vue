<template>
<Header_Menu />
  <div class="page-container">

    <section class="top-bar">
      <h1>Cadastro de Entrega</h1>
    </section>

    <main class="content">
      <div class="actions">
        <button class="primary-btn" @click="openForm">Nova Entrega</button>
        <button class="primary-btn" @click="loadAll">Atualizar Lista</button>
      </div>

      <div v-if="message" class="message">{{ message }}</div>

      <section class="form-card" v-if="showForm">
        <h2>Dados da Entrega</h2>

        <div class="form-grid">
          <div class="filter-group">
            <label>Funcionário</label>
            <select v-model="deliveryForm.id_funcionario">
              <option value="">Selecione um funcionário</option>
              <option v-for="employee in employees" :key="employee.id_funcionario" :value="employee.id_funcionario">
                {{ employee.nome }} ({{ employee.cpf }})
              </option>
            </select>
          </div>

          <div class="filter-group">
            <label>EPI</label>
            <select v-model="deliveryForm.id_epi">
              <option value="">Selecione um EPI</option>
              <option v-for="epi in epis" :key="epi.id_epi" :value="epi.id_epi">
                {{ epi.nome }} - {{ epi.categoria }}
              </option>
            </select>
          </div>

          <div class="filter-group">
            <label>Data de Entrega</label>
            <input v-model="deliveryForm.dt_entrega" type="date" />
          </div>

          <div class="filter-group">
            <label>Quantidade</label>
            <input v-model.number="deliveryForm.quantidade" type="number" min="1" placeholder="Quantidade" />
          </div>

          <div class="filter-group">
            <label>Data de Devolução</label>
            <input v-model="deliveryForm.dt_devolucao" type="date" />
          </div>

          <div class="filter-group">
            <label>Assinatura</label>
            <div class="checkbox-group">
              <label>
                <input type="checkbox" v-model="deliveryForm.assinatura" /> Recebimento confirmado
              </label>
            </div>
          </div>

          <div class="filter-group full-width">
            <label>Observação</label>
            <textarea v-model="deliveryForm.observacao" placeholder="Observações adicionais"></textarea>
          </div>
        </div>

        <div class="actions">
          <button class="primary-btn" @click="saveDelivery" :disabled="loading">
            {{ loading ? 'Salvando...' : 'Salvar' }}
          </button>
          <button class="primary-btn secondary" @click="cancelForm" type="button">Cancelar</button>
        </div>
      </section>

      <div class="filters">
        <div class="filter-group">
          <label>Buscar</label>
          <input v-model="searchTerm" placeholder="Filtrar por funcionário ou EPI..." />
        </div>
      </div>

      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>Funcionário</th>
              <th>EPI</th>
              <th>Entrega</th>
              <th>Devolução</th>
              <th>Assinatura</th>
              <th>Observação</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="delivery in filteredDeliveries" :key="delivery.id_entrega">
              <td>{{ getEmployeeName(delivery.id_funcionario) }}</td>
              <td>{{ getEpiName(delivery.id_epi) }}</td>
              <td>{{ formatDate(delivery.dt_entrega) }}</td>
              <td>{{ formatDate(delivery.dt_devolucao) }}</td>
              <td>{{ delivery.assinatura ? 'Sim' : 'Não' }}</td>
              <td>{{ delivery.observacao || '-' }}</td>
              <td class="delivery-actions">
                <button class="small-btn" @click="deleteDelivery(delivery.id_entrega)">Remover</button>
              </td>
            </tr>
            <tr v-if="filteredDeliveries.length === 0">
              <td colspan="8" class="empty-state">Nenhuma entrega encontrada.</td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { supabase } from '../composables/useSupabase'
import Header_Menu from '../components/Header_Menu.vue'

const showForm = ref(false)
const loading = ref(false)
const message = ref('')
const searchTerm = ref('')
const employees = ref([])
const epis = ref([])
const deliveries = ref([])

const deliveryForm = reactive({
  id_funcionario: '',
  id_epi: '',
  id_estoque: null,
  dt_entrega: '',
  quantidade: 1,
  dt_devolucao: '',
  observacao: '',
  assinatura: false
})

const filteredDeliveries = computed(() => {
  return deliveries.value.filter((delivery) => {
    const employeeName = getEmployeeName(delivery.id_funcionario).toLowerCase()
    const epiName = getEpiName(delivery.id_epi).toLowerCase()
    const query = searchTerm.value.toLowerCase()
    return employeeName.includes(query) || epiName.includes(query)
  })
})

function resetForm() {
  deliveryForm.id_funcionario = ''
  deliveryForm.id_epi = ''
  deliveryForm.id_estoque = null
  deliveryForm.dt_entrega = ''
  deliveryForm.quantidade = 1
  deliveryForm.dt_devolucao = ''
  deliveryForm.observacao = ''
  deliveryForm.assinatura = false
}

function openForm() {
  showForm.value = true
  message.value = ''
  resetForm()
}

function cancelForm() {
  showForm.value = false
  message.value = ''
  resetForm()
}

function getEmployeeName(id) {
  const employee = employees.value.find((item) => item.id_funcionario === id)
  return employee ? employee.nome : 'Não definido'
}

function getEpiName(id) {
  const epi = epis.value.find((item) => item.id_epi === id)
  return epi ? epi.nome : 'Não definido'
}

function formatDate(dateString) {
  if (!dateString) return ''
  const date = new Date(dateString)
  return date.toLocaleDateString('pt-BR')
}

async function loadEmployees() {
  const { data, error } = await supabase.from('funcionario').select('*').order('nome')
  if (error) {
    console.error('Error loading employees:', error)
    message.value = 'Erro ao carregar funcionários.'
    employees.value = []
    return
  }
  employees.value = data || []
}

async function loadEpis() {
  const { data, error } = await supabase.from('epi').select('*').order('nome')
  if (error) {
    console.error('Error loading EPIs:', error)
    message.value = 'Erro ao carregar EPIs.'
    epis.value = []
    return
  }
  epis.value = data || []
}

async function loadDeliveries() {
  const { data, error } = await supabase.from('entrega').select('*').order('dt_entrega', { ascending: false })
  if (error) {
    console.error('Error loading deliveries:', error)
    message.value = 'Erro ao carregar entregas.'
    deliveries.value = []
    return
  }
  deliveries.value = data || []
}

async function loadAll() {
  await Promise.all([loadEmployees(), loadEpis(), loadDeliveries()])
}

async function saveDelivery() {
  if (!deliveryForm.id_funcionario || !deliveryForm.id_epi || !deliveryForm.dt_entrega) {
    message.value = 'Preencha funcionário, EPI e data de entrega.'
    return
  }

  loading.value = true
  const payload = {
    id_funcionario: deliveryForm.id_funcionario,
    id_epi: deliveryForm.id_epi,
    id_estoque: deliveryForm.id_estoque || null,
    dt_entrega: deliveryForm.dt_entrega,
    dt_devolucao: deliveryForm.dt_devolucao || null,
    observacao: deliveryForm.observacao || null,
    assinatura: deliveryForm.assinatura
  }

  const { error } = await supabase.from('entrega').insert([payload])
  loading.value = false

  if (error) {
    console.error('Error saving delivery:', error)
    message.value = 'Erro ao salvar entrega.'
    return
  }

  message.value = 'Entrega cadastrada com sucesso.'
  await loadDeliveries()
  resetForm()
  showForm.value = false
}

async function deleteDelivery(id) {
  const confirmed = window.confirm('Deseja remover esta entrega?')
  if (!confirmed) return

  const { error } = await supabase.from('entrega').delete().eq('id_entrega', id)
  if (error) {
    console.error('Error deleting delivery:', error)
    message.value = 'Erro ao remover entrega.'
    return
  }

  message.value = 'Entrega removida.'
  await loadDeliveries()
}

onMounted(async () => {
  await loadAll()
})
</script>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Barlow', sans-serif;
}

.page-container {
  min-height: 100vh;
  background: #f3f3f3;
  padding: 20px 30px 40px 300px;
}

.top-bar {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 16px;
  padding-bottom: 10px;
  margin: 0 auto 20px;
  max-width: 1400px;
}

.top-bar h1 {
  font-family: 'Bebas Neue', sans-serif;
  font-size: 48px;
  margin: 0;
}

.content {
  padding: 20px 0 0;
  max-width: 1400px;
  margin: 0 auto;
}

.actions {
  display: flex;
  gap: 15px;
  margin-bottom: 25px;
  flex-wrap: wrap;
}

.primary-btn {
  background: #fdd017;
  color: black;
  border: none;
  padding: 12px 25px;
  font-weight: bold;
  cursor: pointer;
  border-radius: 4px;
}

.primary-btn.secondary {
  background: #666;
  color: white;
}

.form-card {
  background: #e9e9e9;
  padding: 25px;
  margin-bottom: 25px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.08);
}

.form-card h2 {
  font-family: 'Bebas Neue';
  font-size: 28px;
  margin-bottom: 20px;
}

.form-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  margin-bottom: 20px;
}

.filter-group {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.filter-group.full-width {
  grid-column: 1 / -1;
}

.filter-group input,
.filter-group select,
.filter-group textarea {
  padding: 10px;
  border: 1px solid #ccc;
  background: white;
}

.filter-group textarea {
  min-height: 100px;
  resize: vertical;
}

.checkbox-group {
  display: flex;
  align-items: center;
  gap: 10px;
}

.filters {
  display: flex;
  gap: 15px;
  margin-bottom: 20px;
  flex-wrap: wrap;
}

.message {
  margin-bottom: 20px;
  padding: 12px;
  background: #fff8d6;
  border-left: 4px solid #fdd017;
}

.table-container {
  background: #e9e9e9;
  overflow-x: auto;
}

table {
  width: 100%;
  border-collapse: collapse;
}

thead {
  background: #fdd017;
}

th,
td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #d5d5d5;
}

tbody tr:hover {
  background: #f5f5f5;
}

.small-btn {
  background: #222;
  color: white;
  border: none;
  padding: 8px 14px;
  cursor: pointer;
}

.empty-state {
  text-align: center;
  padding: 25px;
  color: #666;
}

@media (max-width: 1024px) {
  .form-grid {
    grid-template-columns: 1fr 1fr;
  }
}

@media (max-width: 768px) {
  .form-grid {
    grid-template-columns: 1fr;
  }

  .top-bar h1 {
    font-size: 34px;
  }

  .actions,
  .filters {
    flex-direction: column;
  }
}
</style>
