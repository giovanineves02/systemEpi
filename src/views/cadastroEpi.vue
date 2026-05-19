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
            <input v-model="epiForm.nome" placeholder="Ex: Capacete de Segurança" />
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
            <input v-model="epiForm.numero_ca" placeholder="Ex: 12345" />
          </div>

          <div class="filter-group">
            <label>Quantidade</label>
            <input v-model.number="epiForm.quantidade" type="number" min="1" />
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
            <option v-for="cat in categorias" :key="cat" :value="cat">{{ cat }}</option>
          </select>
        </div>
      </div>

      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>Nome</th>
              <th>Categoria</th>
              <th>Qtd</th>
              <th>CA</th>
              <th>Fabricante</th>
              <th>Validade</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="epi in filteredEpis" :key="epi.id_epi">
              <td><strong>{{ epi.nome }}</strong></td>
              <td>{{ epi.categoria }}</td>
              <td>{{ epi.quantidade }}</td>
              <td>{{ epi.numero_ca }}</td>
              <td>{{ epi.fabricante }}</td>
              <td>{{ formatDate(epi.dt_validade) }}</td>
              <td class="epi-actions">
                <button class="small-btn" @click="deleteEpi(epi.id_epi)">Remover</button>
              </td>
            </tr>
            <tr v-if="filteredEpis.length === 0">
              <td colspan="7" class="empty-state">Nenhum EPI encontrado.</td>
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

const categorias = [
  'Proteção Respiratória',
  'Proteção Auditiva',
  'Proteção Visual',
  'Proteção Corporal',
  'Proteção de Mãos',
  'Proteção de Pés'
]

const epiForm = reactive({
  nome: '',
  categoria: '',
  numero_ca: '',
  quantidade: 1,
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
  Object.assign(epiForm, {
    nome: '',
    categoria: '',
    numero_ca: '',
    quantidade: 1,
    fabricante: '',
    dt_validade: ''
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

function formatDate(dateString) {
  if (!dateString) return ''
  const [year, month, day] = dateString.split('-')
  return `${day}/${month}/${year}`
}

async function loadEpis() {
  const { data, error } = await supabase.from('epi', { schema: 'gestao_epis' }).select('*').order('nome')
  if (error) {
    message.value = 'Erro ao carregar EPIs.'
    return
  }
  epis.value = data || []
}

async function saveEpi() {
  if (!epiForm.nome || !epiForm.categoria || !epiForm.numero_ca || !epiForm.dt_validade) {
    message.value = 'Preencha os campos obrigatórios.'
    return
  }

  loading.value = true
  const { error } = await supabase.from('epi', { schema: 'gestao_epis' }).insert([epiForm])
  loading.value = false

  if (error) {
    message.value = 'Erro ao salvar EPI.'
    return
  }

  message.value = 'EPI cadastrado com sucesso!'
  loadEpis()
  showForm.value = false
}

async function deleteEpi(id) {
  if (!window.confirm('Deseja remover este EPI?')) return
  const { error } = await supabase.from('epi', { schema: 'gestao_epis' }).delete().eq('id_epi', id)
  if (error) {
    message.value = 'Erro ao remover.'
    return
  }
  loadEpis()
}

onMounted(loadEpis)
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
  font-family: "Inter", "Segoe UI", Arial, Helvetica, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
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
  font-size: 30px;
  font-weight: 600;
  letter-spacing: 0.3px;
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
  font-weight: 600;
  letter-spacing: 0.5px;
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
  color: var(--text-secondary);
}

.filter-group input,
.filter-group select {
  padding: 10px;
  border: 2px solid #eee;
  border-radius: var(--radius-md);
  background: #fff;
  font-family: inherit;
  font-size: 14px;
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
}

.table-container {
  background: var(--background-light);
  border-radius: var(--radius-lg);
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  overflow: hidden;
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
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.5px;
  text-transform: uppercase;
  color: #000;
}

td {
  padding: 15px 20px;
  border-bottom: 1px solid var(--border-color);
  font-size: 14px;
  color: #222;
}

td strong {
  font-weight: 600;
}

tbody tr:hover {
  background: rgba(255, 204, 0, 0.03);
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

.empty-state {
  text-align: center;
  padding: 40px;
  color: var(--text-secondary);
}

@media (max-width: 768px) {
  .filters {
    flex-direction: column;
    align-items: stretch;
  }
}
</style>