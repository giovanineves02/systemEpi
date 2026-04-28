<template>
<Header_Menu />
  <div class="page-container">


    <section class="top-bar">
      <h1>Cadastro de Funcionário</h1>

    </section>

    <main class="content">
      <div class="actions">
        <button class="primary-btn" @click="openForm">Cadastrar Funcionário</button>
        <button class="primary-btn" @click="loadEmployees">Atualizar Lista</button>
      </div>

      <div v-if="message" class="message">{{ message }}</div>

      <section class="form-card" v-if="showForm">
        <h2>Novo Funcionário</h2>

        <div class="form-grid">
          <div class="filter-group">
            <label>Nome</label>
            <input v-model="employeeForm.nome" placeholder="Nome completo" />
          </div>

          <div class="filter-group">
            <label>Documento</label>
            <input v-model="employeeForm.documento" placeholder="CPF ou RG" />
          </div>

          <div class="filter-group">
            <label>Cargo</label>
            <input v-model="employeeForm.cargo" placeholder="Cargo" />
          </div>

          <div class="filter-group">
            <label>Setor</label>
            <select v-model="employeeForm.setorId">
              <option value="">Selecione um setor</option>
              <option v-for="sector in sectors" :key="sector.id_setor" :value="sector.id_setor">{{ sector.nome_setor }}</option>
            </select>
          </div>

          <div class="filter-group small">
            <label>Turno</label>
            <select v-model="employeeForm.turno">
              <option v-for="turn in turnoOptions" :key="turn" :value="turn">{{ turn }}</option>
            </select>
          </div>

          <div class="filter-group small">
            <label>Status</label>
            <select v-model="employeeForm.status">
              <option value="ativo">Ativo</option>
              <option value="inativo">Inativo</option>
            </select>
          </div>
        </div>

        <div class="actions">
          <button class="primary-btn" @click="saveEmployee" :disabled="loading">
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
          <label>Status</label>
          <select v-model="statusFilter">
            <option value="all">Todos</option>
            <option value="ativo">Ativos</option>
            <option value="inativo">Inativos</option>
          </select>
        </div>

        <button class="primary-btn export-btn" @click="loadSectors">Atualizar Setores</button>
      </div>

      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>Nome</th>
              <th>Documento</th>
              <th>Cargo</th>
              <th>Setor</th>
              <th>Turno</th>
              <th>Status</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="employee in filteredEmployees" :key="employee.id">
              <td>{{ employee.name }}</td>
              <td>{{ employee.document }}</td>
              <td>{{ employee.position }}</td>
              <td>{{ getSectorName(employee.setor_id) }}</td>
              <td>{{ employee.shift }}</td>
              <td>
                <span :class="['status-chip', employee.status === 'ativo' ? 'active' : 'inactive']">
                  {{ employee.status === 'ativo' ? 'Ativo' : 'Inativo' }}
                </span>
              </td>
              <td class="employee-actions">
                <button class="small-btn" @click="deleteEmployee(employee.id)">Remover</button>
              </td>
            </tr>
            <tr v-if="filteredEmployees.length === 0">
              <td colspan="7" class="empty-state">Nenhum funcionário encontrado.</td>
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
const statusFilter = ref('all')
const employees = ref([])
const sectors = ref([])

const turnoOptions = ['Primeiro', 'Segundo', 'Terceiro']

const employeeForm = reactive({
  nome: '',
  documento: '',
  cargo: '',
  setorId: '',
  turno: 'Primeiro',
  status: 'ativo'
})

const filteredEmployees = computed(() => {
  return employees.value.filter((employee) => {
    const employeeName = employee.name || employee.nome || ''
    const matchesName = employeeName.toLowerCase().includes(searchTerm.value.toLowerCase())
    const matchesStatus = statusFilter.value === 'all' || employee.status === statusFilter.value
    return matchesName && matchesStatus
  })
})

function resetForm() {
  employeeForm.nome = ''
  employeeForm.documento = ''
  employeeForm.cargo = ''
  employeeForm.setorId = ''
  employeeForm.turno = 'Primeiro'
  employeeForm.status = 'ativo'
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

function getSectorName(sectorId) {
  const sector = sectors.value.find((item) => item.id_setor === sectorId)
  return sector ? sector.nome_setor : 'Não definido'
}

async function loadSectors() {
  console.log('Loading sectors...')
  // Try different possible table names
  const possibleTableNames = ['setor', 'setores', 'sectors', 'department', 'departments']

  for (const tableName of possibleTableNames) {
    console.log(`Trying table: ${tableName}`)
    const { data, error } = await supabase.from(tableName).select('*').limit(1)
    if (!error) {
      console.log(`Table ${tableName} exists. Structure:`, data)
      // Found the table, now load all data
      const { data: allData, error: allError } = await supabase.from(tableName).select('*').order('nome_setor')
      if (!allError) {
        console.log(`Loaded data from ${tableName}:`, allData)
        sectors.value = allData || []
        return
      }
    } else {
      console.log(`Table ${tableName} error:`, error.message)
    }
  }

  message.value = 'Erro ao carregar setores. Nenhuma tabela de setores encontrada.'
}

async function loadEmployees() {
  console.log('Loading employees...')
  // The employees table needs to be created first
  // For now, show a message
  message.value = 'Tabela de funcionários não encontrada. Execute o SQL do arquivo supabase_tables.sql no Supabase para criar as tabelas.'
  employees.value = []
}

async function saveEmployee() {
  console.log('Form values:', employeeForm)
  console.log('Sectors:', sectors.value)

  if (!employeeForm.nome || !employeeForm.documento || !employeeForm.cargo || !employeeForm.setorId) {
    message.value = 'Preencha todos os campos obrigatórios.'
    return
  }

  loading.value = true
  const payload = {
    name: employeeForm.nome,
    document: employeeForm.documento,
    position: employeeForm.cargo,
    setor_id: employeeForm.setorId,
    shift: employeeForm.turno,
    status: employeeForm.status
  }

  console.log('Saving employee with data:', payload)

  const { error } = await supabase.from('employees').insert([payload])
  loading.value = false

  if (error) {
    message.value = 'Erro ao salvar funcionário.'
    console.error('Error saving employee:', error)
    return
  }

  message.value = 'Funcionário cadastrado com sucesso.'
  loadEmployees()
  resetForm()
  showForm.value = false
}

async function deleteEmployee(id) {
  const confirmed = window.confirm('Deseja remover este funcionário?')
  if (!confirmed) return

  console.log('Deleting employee with id:', id)

  const { error } = await supabase.from('employees').delete().eq('id', id)
  if (error) {
    message.value = 'Erro ao remover funcionário.'
    console.error('Error deleting employee:', error)
    return
  }

  message.value = 'Funcionário removido.'
  loadEmployees()
}

onMounted(async () => {
  await Promise.all([loadSectors(), loadEmployees()])
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

/* TÍTULO */
.title {
  font-family: 'Bebas Neue', sans-serif;
  font-size: 48px;
  margin-bottom: 5px;
}



/* BOTÕES */
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

/* FORM */
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

.filter-group input,
.filter-group select {
  padding: 10px;
  border: 1px solid #ccc;
  background: white;
}

/* FILTROS */
.filters {
  display: flex;
  gap: 15px;
  margin-bottom: 20px;
  flex-wrap: wrap;
}

/* MENSAGEM */
.message {
  margin-bottom: 20px;
  padding: 12px;
  background: #fff8d6;
  border-left: 4px solid #fdd017;
}

/* TABELA */
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

/* STATUS */
.status-chip {
  padding: 5px 12px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: bold;
}

.status-chip.active {
  background: rgba(34,197,94,0.1);
  color: green;
}

.status-chip.inactive {
  background: rgba(239,68,68,0.1);
  color: red;
}

/* BOTÃO AÇÃO */
.small-btn {
  background: #222;
  color: white;
  border: none;
  padding: 8px 14px;
  cursor: pointer;
}

/* EMPTY */
.empty-state {
  text-align: center;
  padding: 25px;
  color: #666;
}

/* RESPONSIVO */
@media (max-width: 1024px) {
  .form-grid {
    grid-template-columns: 1fr 1fr;
  }
}

@media (max-width: 768px) {
  .form-grid {
    grid-template-columns: 1fr;
  }

  .title {
    font-size: 34px;
  }

  .actions,
  .filters {
    flex-direction: column;
  }
}
</style>