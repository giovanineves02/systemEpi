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
            <input v-model.number="deliveryForm.quantidade" type="number" min="1" />
          </div>

          <div class="filter-group">
            <label>Data de Devolução</label>
            <input v-model="deliveryForm.dt_devolucao" type="date" />
          </div>

          <div class="filter-group">
            <label>Assinatura</label>
            <div class="checkbox-container">
              <input type="checkbox" id="signed" v-model="deliveryForm.assinatura" />
              <label for="signed">Recebimento confirmado</label>
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
              <td><strong>{{ getEmployeeName(delivery.id_funcionario) }}</strong></td>
              <td>{{ getEpiName(delivery.id_epi) }}</td>
              <td>{{ formatDate(delivery.dt_entrega) }}</td>
              <td>{{ formatDate(delivery.dt_devolucao) }}</td>
              <td>
                <span :class="['status-chip', delivery.assinatura ? 'active' : 'inactive']">
                  {{ delivery.assinatura ? 'Sim' : 'Não' }}
                </span>
              </td>
              <td class="obs-cell">{{ delivery.observacao || '-' }}</td>
              <td class="delivery-actions">
                <button class="small-btn" @click="deleteDelivery(delivery.id_entrega)">Remover</button>
              </td>
            </tr>
            <tr v-if="filteredDeliveries.length === 0">
              <td colspan="7" class="empty-state">Nenhuma entrega encontrada.</td>
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
  Object.assign(deliveryForm, {
    id_funcionario: '',
    id_epi: '',
    id_estoque: null,
    dt_entrega: '',
    quantidade: 1,
    dt_devolucao: '',
    observacao: '',
    assinatura: false
  })
}

function openForm() {
  showForm.value = true
  message.value = ''
  resetForm()
}

function cancelForm() {
  showForm.value = false
  message.value = ''
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
  if (!dateString) return '-'
  const [year, month, day] = dateString.split('-')
  return `${day}/${month}/${year}`
}

async function loadEmployees() {
  const { data } = await supabase.from('funcionario').select('*').order('nome')
  employees.value = data || []
}

async function loadEpis() {
  const { data } = await supabase.from('epi').select('*').order('nome')
  epis.value = data || []
}

async function loadDeliveries() {
  const { data } = await supabase.from('entrega').select('*').order('dt_entrega', { ascending: false })
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
  const { error } = await supabase.from('entrega').insert([deliveryForm])
  loading.value = false

  if (error) {
    message.value = 'Erro ao salvar entrega.'
    return
  }

  message.value = 'Entrega cadastrada com sucesso.'
  await loadDeliveries()
  showForm.value = false
}

async function deleteDelivery(id) {
  if (!window.confirm('Deseja remover esta entrega?')) return
  const { error } = await supabase.from('entrega').delete().eq('id_entrega', id)
  if (error) {
    message.value = 'Erro ao remover.'
    return
  }
  await loadDeliveries()
}

onMounted(loadAll)
</script>

<style scoped>
:deep(:root), .page-container {
  --primary: #FFCC00;
  --primary-dark: #e6b800;
  --background: #f4f4f4;
  --background-light: #FFFDF2;
  --text-primary: #1a1a1a;
  --text-secondary: #4a4a4a;
  --border-color: #ddd;
  --radius-md: 8px;
  --radius-lg: 12px;
}

.page-container {
  min-height: 100vh;
  background: var(--background);
  padding: 40px 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  color: var(--text-primary);
}

.top-bar {
  width: 100%;
  max-width: 1200px;
  margin-bottom: 30px;
}

.top-bar h1 {
  font-size: 32px;
  font-weight: 700;
}

.content {
  width: 100%;
  max-width: 1200px;
}

.actions {
  display: flex;
  gap: 15px;
  margin-bottom: 30px;
}

.primary-btn {
  background: var(--primary);
  color: #000;
  border: none;
  padding: 12px 24px;
  border-radius: var(--radius-md);
  cursor: pointer;
  font-weight: 700;
  text-transform: uppercase;
  font-size: 13px;
  transition: all 0.2s;
}

.primary-btn:hover:not(:disabled) {
  background: var(--primary-dark);
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(255, 204, 0, 0.2);
}

.primary-btn.secondary {
  background: var(--text-secondary);
  color: white;
}

.message {
  width: 100%;
  padding: 15px;
  margin-bottom: 20px;
  background: #e6fffa;
  color: #2c7a7b;
  border: 1px solid #b2f5ea;
  border-radius: var(--radius-md);
}

.form-card {
  background: var(--background-light);
  padding: 30px;
  border-radius: var(--radius-lg);
  border: 1px solid #eee;
  margin-bottom: 40px;
}

.form-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.full-width {
  grid-column: 1 / -1;
}

.filter-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.filter-group label {
  font-size: 13px;
  font-weight: 600;
}

.checkbox-container {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 10px 0;
}

.filter-group input, .filter-group select, .filter-group textarea {
  padding: 10px;
  border: 2px solid #eee;
  border-radius: var(--radius-md);
  background: #fff;
}

.filter-group textarea {
  min-height: 80px;
  resize: vertical;
}

.filters {
  display: flex;
  gap: 20px;
  margin-bottom: 25px;
}

.table-container {
  background: var(--background-light);
  border-radius: var(--radius-lg);
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  overflow-x: auto;
}

table {
  width: 100%;
  border-collapse: collapse;
}

thead {
  background: var(--primary);
}

th {
  padding: 15px 20px;
  text-align: left;
  font-size: 12px;
  text-transform: uppercase;
  color: #000;
}

td {
  padding: 15px 20px;
  border-bottom: 1px solid var(--border-color);
  font-size: 14px;
}

.obs-cell {
  max-width: 200px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.status-chip {
  padding: 4px 10px;
  border-radius: 20px;
  font-size: 11px;
  font-weight: 700;
}

.status-chip.active { background: #c6f6d5; color: #22543d; }
.status-chip.inactive { background: #fed7d7; color: #822727; }

.small-btn {
  background: transparent;
  color: #e53e3e;
  border: 1px solid #e53e3e;
  padding: 5px 10px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
}

.small-btn:hover { background: #e53e3e; color: #fff; }

.empty-state { text-align: center; padding: 40px; color: var(--text-secondary); }

@media (max-width: 768px) {
  .filters { flex-direction: column; align-items: stretch; }
  .form-grid { grid-template-columns: 1fr; }
}
</style>