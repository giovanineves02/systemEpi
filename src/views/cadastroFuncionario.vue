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
            <option value="Ativo">Ativos</option>
            <option value="Inativo">Inativos</option>
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
            <tr v-for="employee in filteredEmployees" :key="employee.id_funcionario">
              <td>{{ employee.nome }}</td>
              <td>{{ employee.cpf }}</td>
              <td>{{ employee.cargo }}</td>
              <td>{{ getSectorName(employee.id_setor) }}</td>
              <td>{{ employee.turno }}</td>
              <td>
                <span :class="['status-chip', employee.status ? 'active' : 'inactive']">
                  {{ employee.status ? 'Ativo' : 'Inativo' }}
                </span>
              </td>
              <td class="employee-actions">
                <button class="small-btn" @click="deleteEmployee(employee.id_funcionario)">Remover</button>
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
    const employeeName = employee.nome || ''
    const matchesName = employeeName.toLowerCase().includes(searchTerm.value.toLowerCase())
    const matchesStatus =
      statusFilter.value === 'all' ||
      (statusFilter.value === 'Ativo' && employee.status === true) ||
      (statusFilter.value === 'Inativo' && employee.status === false)
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
  const { data, error } = await supabase.from('setor').select('*').order('nome_setor')
  if (error) {
    message.value = 'Erro ao carregar setores.'
    return
  }
  sectors.value = data || []
}

async function loadEmployees() {
  const { data, error } = await supabase.from('funcionario').select('*').order('nome')
  if (error) {
    message.value = 'Erro ao carregar funcionários.'
    employees.value = []
    return
  }
  employees.value = data || []
}

async function saveEmployee() {
  if (!employeeForm.nome || !employeeForm.documento || !employeeForm.cargo || !employeeForm.setorId) {
    message.value = 'Preencha todos os campos obrigatórios.'
    return
  }

  loading.value = true
  const payload = {
    nome: employeeForm.nome,
    cpf: employeeForm.documento,
    cargo: employeeForm.cargo,
    id_setor: employeeForm.setorId,
    turno: employeeForm.turno,
    status: employeeForm.status === 'ativo'
  }

  const { error } = await supabase.from('funcionario').insert([payload])
  loading.value = false

  if (error) {
    message.value = 'Erro ao salvar funcionário.'
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

  const { error } = await supabase.from('funcionario').delete().eq('id_funcionario', id)
  if (error) {
    message.value = 'Erro ao remover funcionário.'
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
  padding-bottom: 20px;
  margin-bottom: 30px;
}

.top-bar h1 {
  font-size: 32px;
  font-weight: 700;
  color: var(--text-primary);
  margin: 0;
}

.content {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
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
  transition: all 0.2s ease;
  text-transform: uppercase;
  font-size: 13px;
  letter-spacing: 0.5px;
}

.primary-btn:hover {
  background: var(--primary-dark);
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(255, 204, 0, 0.2);
}

.primary-btn:disabled {
  background: #ccc;
  cursor: not-allowed;
}

.primary-btn.secondary {
  background: var(--text-secondary);
  color: white;
}

.message {
  width: 100%;
  padding: 15px;
  margin-bottom: 30px;
  border-radius: var(--radius-md);
  background: #e6fffa;
  color: #2c7a7b;
  border: 1px solid #b2f5ea;
}

.form-card {
  background: var(--background-light);
  padding: 30px;
  border-radius: var(--radius-lg);
  border: 1px solid #eee;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
  margin-bottom: 40px;
  width: 100%;
}

.form-card h2 {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 20px;
}

.form-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
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

.filter-group input,
.filter-group select {
  padding: 10px;
  border: 2px solid #eee;
  border-radius: var(--radius-md);
  background: #fff;
  transition: border-color 0.2s;
}

.filter-group input:focus,
.filter-group select:focus {
  outline: none;
  border-color: var(--primary);
}

.filters {
  display: flex;
  gap: 20px;
  margin-bottom: 25px;
  align-items: flex-end;
  width: 100%;
}

.export-btn {
  margin-left: auto;
}

.table-container {
  background: var(--background-light);
  border-radius: var(--radius-lg);
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  overflow: hidden;
  width: 100%;
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

tbody tr:hover {
  background: rgba(255, 204, 0, 0.03);
}

.status-chip {
  padding: 4px 10px;
  border-radius: 20px;
  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
}

.status-chip.active {
  background: #c6f6d5;
  color: #22543d;
}

.status-chip.inactive {
  background: #fed7d7;
  color: #822727;
}

.small-btn {
  background: transparent;
  color: #e53e3e;
  border: 1px solid #e53e3e;
  padding: 5px 10px;
  border-radius: 6px;
  cursor: pointer;
  font-size: 12px;
  transition: 0.2s;
}

.small-btn:hover {
  background: #e53e3e;
  color: #fff;
}

@media (max-width: 768px) {
  .filters {
    flex-direction: column;
    align-items: stretch;
  }
  .export-btn {
    margin-left: 0;
  }
}
</style>