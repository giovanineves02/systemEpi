<template>
<Header_Menu />
  <div class="page-container">


    <section class="top-bar">
      <h1>Cadastro de EPI</h1>

    </section>

    <main class="content">
      <div class="actions">
        <button class="primary-btn" @click="openForm">Cadastrar EPI</button>
        <button class="primary-btn" @click="loadEpis">Atualizar Lista</button>
      </div>

      <div v-if="message" class="message">{{ message }}</div>

      <section class="form-card" v-if="showForm">
        <h2>Novo EPI</h2>

        <div class="form-grid">
          <div class="filter-group">
            <label>Nome</label>
            <input v-model="epiForm.nome" placeholder="Nome do EPI" />
          </div>

          <div class="filter-group">
            <label>Categoria</label>
            <select v-model="epiForm.categoria">
              <option value="">Selecione uma categoria</option>
              <option value="Proteção Respiratória">Proteção Respiratória</option>
              <option value="Proteção Auditiva">Proteção Auditiva</option>
              <option value="Proteção Visual">Proteção Visual</option>
              <option value="Proteção Corporal">Proteção Corporal</option>
              <option value="Proteção de Mãos">Proteção de Mãos</option>
              <option value="Proteção de Pés">Proteção de Pés</option>
            </select>
          </div>

          <div class="filter-group">
            <label>Número CA</label>
            <input v-model="epiForm.numero_ca" placeholder="Número do CA" />
          </div>

          <div class="filter-group">
            <label>Fabricante</label>
            <input v-model="epiForm.fabricante" placeholder="Nome do fabricante" />
          </div>

          <div class="filter-group">
            <label>Data de Validade</label>
            <input v-model="epiForm.dt_validade" type="date" />
          </div>
        </div>

        <div class="actions">
          <button class="primary-btn" @click="saveEpi" :disabled="loading">
            {{ loading ? 'Salvando...' : 'Salvar' }}
          </button>
          <button class="primary-btn secondary" @click="cancelForm" type="button">Cancelar</button>
        </div>
      </section>

      <div class="filters">
        <div class="filter-group">
          <label>Buscar</label>
          <input v-model="searchTerm" placeholder="Filtrar pelo nome..." />
        </div>

        <div class="filter-group small">
          <label>Categoria</label>
          <select v-model="categoriaFilter">
            <option value="all">Todas</option>
            <option value="Proteção Respiratória">Proteção Respiratória</option>
            <option value="Proteção Auditiva">Proteção Auditiva</option>
            <option value="Proteção Visual">Proteção Visual</option>
            <option value="Proteção Corporal">Proteção Corporal</option>
            <option value="Proteção de Mãos">Proteção de Mãos</option>
            <option value="Proteção de Pés">Proteção de Pés</option>
          </select>
        </div>
      </div>

      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>Nome</th>
              <th>Categoria</th>
              <th>Número CA</th>
              <th>Fabricante</th>
              <th>Data de Validade</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="epi in filteredEpis" :key="epi.id">
              <td>{{ epi.nome }}</td>
              <td>{{ epi.categoria }}</td>
              <td>{{ epi.numero_ca }}</td>
              <td>{{ epi.fabricante }}</td>
              <td>{{ formatDate(epi.dt_validade) }}</td>
              <td class="epi-actions">
                <button class="small-btn" @click="deleteEpi(epi.id)">Remover</button>
              </td>
            </tr>
            <tr v-if="filteredEpis.length === 0">
              <td colspan="6" class="empty-state">Nenhum EPI encontrado.</td>
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
const categoriaFilter = ref('all')
const epis = ref([])

const epiForm = reactive({
  nome: '',
  categoria: '',
  numero_ca: '',
  fabricante: '',
  dt_validade: ''
})

const filteredEpis = computed(() => {
  return epis.value.filter((epi) => {
    const epiName = epi.nome || ''
    const matchesName = epiName.toLowerCase().includes(searchTerm.value.toLowerCase())
    const matchesCategoria = categoriaFilter.value === 'all' || epi.categoria === categoriaFilter.value
    return matchesName && matchesCategoria
  })
})

function resetForm() {
  epiForm.nome = ''
  epiForm.categoria = ''
  epiForm.numero_ca = ''
  epiForm.fabricante = ''
  epiForm.dt_validade = ''
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

function formatDate(dateString) {
  if (!dateString) return ''
  const date = new Date(dateString)
  return date.toLocaleDateString('pt-BR')
}

async function loadEpis() {
  console.log('Loading EPIs...')
  const { data, error } = await supabase.from('epi').select('*').order('nome')
  
  if (error) {
    console.error('Error loading EPIs:', error)
    message.value = 'Erro ao carregar EPIs.'
    epis.value = []
    return
  }
  
  console.log('EPIs loaded:', data)
  epis.value = data || []
}

async function saveEpi() {
  console.log('Form values:', epiForm)

  if (!epiForm.nome || !epiForm.categoria || !epiForm.numero_ca || !epiForm.fabricante || !epiForm.dt_validade) {
    message.value = 'Preencha todos os campos obrigatórios.'
    return
  }

  loading.value = true
  const payload = {
    nome: epiForm.nome,
    categoria: epiForm.categoria,
    numero_ca: epiForm.numero_ca,
    fabricante: epiForm.fabricante,
    dt_validade: epiForm.dt_validade
  }

  console.log('Saving EPI with data:', payload)

  const { error } = await supabase.from('epi').insert([payload])
  loading.value = false

  if (error) {
    message.value = 'Erro ao salvar EPI.'
    console.error('Error saving EPI:', error)
    return
  }

  message.value = 'EPI cadastrado com sucesso.'
  loadEpis()
  resetForm()
  showForm.value = false
}

async function deleteEpi(id) {
  const confirmed = window.confirm('Deseja remover este EPI?')
  if (!confirmed) return

  console.log('Deleting EPI with id:', id)

  const { error } = await supabase.from('epi').delete().eq('id', id)
  if (error) {
    message.value = 'Erro ao remover EPI.'
    console.error('Error deleting EPI:', error)
    return
  }

  message.value = 'EPI removido.'
  loadEpis()
}

onMounted(async () => {
  await loadEpis()
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
  font-size: 28px;
  font-weight: 600;
  color: #333;
}

.content {
  max-width: 1400px;
  margin: 0 auto;
}

.actions {
  display: flex;
  gap: 12px;
  margin-bottom: 20px;
}

.primary-btn {
  background: #FDD017;
  color: rgb(0, 0, 0);
  border: none;
  padding: 10px 20px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 500;
  transition: background 0.2s;
}

.primary-btn:hover {
  background: #FDD017;
}

.primary-btn:disabled {
  background: #ccc;
  cursor: not-allowed;
}

.primary-btn.secondary {
  background: #6c757d;
}

.primary-btn.secondary:hover {
  background: #545b62;
}

.message {
  padding: 12px;
  margin-bottom: 20px;
  border-radius: 6px;
  font-weight: 500;
}

.message {
  background: #d4edda;
  color: #155724;
  border: 1px solid #c3e6cb;
}

.form-card {
  background: white;
  padding: 24px;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  margin-bottom: 30px;
}

.form-card h2 {
  font-size: 20px;
  margin-bottom: 20px;
  color: #333;
}

.form-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 16px;
  margin-bottom: 24px;
}

.filter-group {
  display: flex;
  flex-direction: column;
}

.filter-group.small {
  max-width: 200px;
}

.filter-group label {
  font-size: 14px;
  font-weight: 500;
  margin-bottom: 6px;
  color: #555;
}

.filter-group input,
.filter-group select {
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 14px;
  transition: border-color 0.2s;
}

.filter-group input:focus,
.filter-group select:focus {
  outline: none;
  border-color: #007bff;
}

.filters {
  display: flex;
  gap: 16px;
  margin-bottom: 20px;
  align-items: end;
}

.export-btn {
  margin-left: auto;
}

.table-container {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

table {
  width: 100%;
  border-collapse: collapse;
}

thead {
  background: #f8f9fa;
}

th,
td {
  padding: 12px 16px;
  text-align: left;
  border-bottom: 1px solid #e9ecef;
}

th {
  font-weight: 600;
  color: #495057;
}

tbody tr:hover {
  background: #f8f9fa;
}

.status-chip {
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: 500;
}

.status-chip.active {
  background: #d4edda;
  color: #155724;
}

.status-chip.inactive {
  background: #f8d7da;
  color: #721c24;
}

.epi-actions {
  display: flex;
  gap: 8px;
}

.small-btn {
  background: #dc3545;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 4px;
  cursor: pointer;
  font-size: 12px;
  transition: background 0.2s;
}

.small-btn:hover {
  background: #c82333;
}

.empty-state {
  text-align: center;
  color: #6c757d;
  font-style: italic;
  padding: 40px;
}
</style>