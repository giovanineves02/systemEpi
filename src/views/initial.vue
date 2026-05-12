<template>
  <Header_Menu />
  <div class="page-container">
    <section class="top-bar">
      <h1 class="title">Indicadores</h1>
    </section>

    <main class="content">
      <div class="cards-grid">
        <div class="metrics-card card-yellow">
          <div class="card-icon"></div>
          <div class="card-info">
            <p>Inventário Total</p>
            <h2>{{ metrics.totalItems }}</h2>
            <small>EPIs Cadastrados</small>
          </div>
        </div>

        <div class="metrics-card card-red">
          <div class="card-icon"></div>
          <div class="card-info">
            <p>Vencidos / Críticos</p>
            <h2>{{ metrics.expiredEPIs }}</h2>
            <small>Atenção necessária</small>
          </div>
        </div>

        <div class="metrics-card card-green">
          <div class="card-icon"></div>
          <div class="card-info">
            <p>Entregas Realizadas</p>
            <h2>{{ metrics.totalDeliveries }}</h2>
            <small>No período selecionado</small>
          </div>
        </div>
      </div>

      <div class="filters-bar">
        <div class="filter-group">
          <label>Buscar EPI</label>
          <input v-model="searchTerm" placeholder="Nome ou CA..." />
        </div>

        <div class="filter-group">
          <label>Data Início</label>
          <input type="date" v-model="dateStart" @change="loadData" />
        </div>

        <div class="filter-group">
          <label>Data Fim</label>
          <input type="date" v-model="dateEnd" @change="loadData" />
        </div>

        <button class="primary-btn" @click="loadData">Atualizar</button>
      </div>

      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>Nome do EPI</th>
              <th>Número CA</th>
              <th>Fabricante</th>
              <th>Vencimento</th>
              <th>Qtd em Estoque</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="epi in filteredData" :key="epi.id">
              <td><strong>{{ epi.nome }}</strong></td>
              <td>{{ epi.numero_ca }}</td>
              <td>{{ epi.fabricante }}</td>
              <td>{{ formatDate(epi.dt_validade) }}</td>
              <td>{{ epi.quantidade }}</td>
              <td>
                <span :class="['status-chip', getStatusClass(epi.dt_validade)]">
                  {{ getStatusText(epi.dt_validade) }}
                </span>
              </td>
            </tr>
            <tr v-if="filteredData.length === 0">
              <td colspan="6" class="empty-state">Nenhum registro encontrado para este filtro.</td>
            </tr>
          </tbody>
        </table>
        <div class="table-footer">
          Mostrando {{ filteredData.length }} registros de EPIs no sistema.
        </div>
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { supabase } from '../composables/useSupabase'
import Header_Menu from '../components/Header_Menu.vue'

const searchTerm = ref('')
const dateStart = ref('')
const dateEnd = ref('')
const epis = ref([])
const metrics = ref({
  totalItems: 0,
  expiredEPIs: 0,
  totalDeliveries: 0
})

// Lógica de Filtro
const filteredData = computed(() => {
  return epis.value.filter(item => {
    const nameMatch = item.nome?.toLowerCase().includes(searchTerm.value.toLowerCase())
    const caMatch = item.numero_ca?.toString().includes(searchTerm.value)
    return nameMatch || caMatch
  })
})

// Formatação de Data
function formatDate(dateString) {
  if (!dateString) return '-'
  const [year, month, day] = dateString.split('-')
  return `${day}/${month}/${year}`
}

// Lógica de Status (Cores)
function getStatusClass(dateString) {
  if (!dateString) return 'valid'
  const today = new Date()
  const expiryDate = new Date(dateString)
  const diffDays = (expiryDate - today) / (1000 * 60 * 60 * 24)

  if (diffDays < 0) return 'inactive' // Vencido
  if (diffDays < 30) return 'warning' // A vencer (30 dias)
  return 'active'
}

function getStatusText(dateString) {
  const status = getStatusClass(dateString)
  if (status === 'inactive') return 'Vencido'
  if (status === 'warning') return 'A vencer'
  return 'Regular'
}

// Busca de Dados Integrada
async function loadData() {
  // 1. Buscar EPIs e métricas de estoque
  const { data: epiData } = await supabase.from('epi').select('*').order('nome')
  epis.value = epiData || []
  
  metrics.value.totalItems = epis.value.reduce((acc, curr) => acc + (curr.quantidade || 0), 0)
  
  // Contar vencidos
  const today = new Date()
  metrics.value.expiredEPIs = epis.value.filter(e => new Date(e.dt_validade) < today).length

  // 2. Buscar Entregas com filtro de período
  let deliveryQuery = supabase.from('entrega').select('id_entrega', { count: 'exact' })
  
  if (dateStart.value) deliveryQuery = deliveryQuery.gte('dt_entrega', dateStart.value)
  if (dateEnd.value) deliveryQuery = deliveryQuery.lte('dt_entrega', dateEnd.value)
  
  const { count } = await deliveryQuery
  metrics.value.totalDeliveries = count || 0
}

onMounted(loadData)
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
}

.top-bar {
  width: 100%;
  max-width: 1200px;
  margin-bottom: 30px;
}

.title {
  font-size: 32px;
  font-weight: 800;
  color: var(--text-primary);
  text-transform: uppercase;
}

.content {
  width: 100%;
  max-width: 1200px;
}

/* CARDS ESTRUTURADOS */
.cards-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
  margin-bottom: 40px;
}

.metrics-card {
  background: var(--background-light);
  padding: 25px;
  border-radius: var(--radius-lg);
  display: flex;
  align-items: center;
  gap: 20px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.05);
  border: 1px solid #eee;
}

.card-yellow { border-bottom: 5px solid var(--primary); }
.card-red { border-bottom: 5px solid #ef4444; }
.card-green { border-bottom: 5px solid #22c55e; }

.card-icon {
  font-size: 40px;
}

.card-info p {
  font-size: 14px;
  font-weight: 600;
  color: var(--text-secondary);
  margin: 0;
}

.card-info h2 {
  font-size: 28px;
  margin: 5px 0;
}

/* FILTROS */
.filters-bar {
  display: flex;
  background: var(--background-light);
  padding: 20px;
  border-radius: var(--radius-md);
  gap: 20px;
  align-items: flex-end;
  margin-bottom: 30px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.03);
}

.filter-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
  flex: 1;
}

.filter-group label {
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
}

.filter-group input {
  padding: 10px;
  border: 1px solid var(--border-color);
  border-radius: 6px;
}

.primary-btn {
  background: var(--primary);
  border: none;
  padding: 12px 25px;
  border-radius: 6px;
  font-weight: 700;
  cursor: pointer;
}

/* TABELA */
.table-container {
  background: var(--background-light);
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: 0 4px 15px rgba(0,0,0,0.05);
}

table {
  width: 100%;
  border-collapse: collapse;
}

thead {
  background: var(--primary);
}

th {
  padding: 15px;
  text-align: left;
  font-size: 12px;
  text-transform: uppercase;
}

td {
  padding: 15px;
  border-bottom: 1px solid #eee;
  font-size: 14px;
}

.status-chip {
  padding: 4px 12px;
  border-radius: 20px;
  font-size: 11px;
  font-weight: 700;
  text-transform: uppercase;
}

.active { background: #c6f6d5; color: #22543d; }
.warning { background: #fefcbf; color: #744210; }
.inactive { background: #fed7d7; color: #822727; }

.table-footer {
  padding: 15px;
  font-size: 12px;
  color: var(--text-secondary);
  background: #fcfcfc;
}

@media (max-width: 768px) {
  .filters-bar { flex-direction: column; align-items: stretch; }
  .cards-grid { grid-template-columns: 1fr; }
}
</style>