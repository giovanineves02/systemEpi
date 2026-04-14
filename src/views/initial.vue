<template>
  <div class="app">

    <!-- HEADER -->
<Header_Menu />  

    <!-- CONTEÚDO -->
    <main class="container">

      <!-- TÍTULO -->
      <div>
        <h2 class="title">RELATÓRIOS</h2>
        <div class="title-underline"></div>
      </div>

      <!-- CARDS -->
      <div class="cards">

        <div class="card yellow">
          <p>Inventário</p>
          <h2>R$ {{ formatCurrency(metrics.totalInventory) }}</h2>
          <small>Total em Inventário</small>

          <div class="divider"></div>

          <h3>{{ metrics.totalItems }}</h3>
          <small>TOTAL de Itens</small>
        </div>

        <div class="card green">
          <p>Descarte</p>
          <h2>R$ {{ formatCurrency(metrics.totalDiscount) }}</h2>
          <small>Desconto no Período</small>

          <div class="divider"></div>

          <h3>{{ metrics.discarded }}</h3>
          <small>Descartados</small>
        </div>

        <div class="card alert">
          <p>ATENÇÃO</p>
          <h2>{{ metrics.expiredEPIs }}</h2>
          <small>EPIs Vencidos</small>

          <div class="divider"></div>

          <h3>{{ metrics.toExpire }}</h3>
          <small>A Vencer</small>
        </div>

      </div>

      <!-- FILTROS -->
      <div class="filters">
        <input v-model="searchTerm" placeholder="Filtrar..." />

        <select v-model="dateFilter">
          <option value="all">Todos</option>
          <option value="month">Mês</option>
          <option value="year">Ano</option>
        </select>
      </div>

      <!-- TABELA -->
      <div class="table-container">
        <table>
          <thead>
            <tr>
              <th>Nome</th>
              <th>CA</th>
              <th>Vencimento</th>
              <th>Qtd</th>
              <th>Status</th>
            </tr>
          </thead>

          <tbody>
            <tr v-for="item in filteredData" :key="item.id">
              <td>{{ item.name }}</td>
              <td>{{ item.ca }}</td>
              <td>{{ item.expiration }}</td>
              <td>{{ item.quantity }}</td>
              <td>
                <span :class="['status', item.status]">
                  {{ getStatusText(item.status) }}
                </span>
              </td>
            </tr>
          </tbody>
        </table>

        <div class="table-footer">
          Mostrando {{ filteredData.length }} registros
        </div>
      </div>

    </main>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import Header_Menu from '../components/Header_Menu.vue'

const menuOpen = ref(false)
const dateFilter = ref('all')
const searchTerm = ref('')

const metrics = {
  totalInventory: 151598.26,
  totalDiscount: 51115.23,
  totalItems: 1000,
  discarded: 25,
  expiredEPIs: 112,
  toExpire: 25
}

const tableData = ref([
  { id: 1, name: 'Óculos de Solda', ca: '22', expiration: '22/04/2026', quantity: 25, status: 'valid' },
  { id: 2, name: 'Sapato Elétrico', ca: '12', expiration: '20/02/2026', quantity: 5, status: 'valid' },
  { id: 3, name: 'Protetor Auricular', ca: '18', expiration: '15/01/2026', quantity: 12, status: 'expired' }
])

const filteredData = computed(() =>
  tableData.value.filter(item =>
    item.name.toLowerCase().includes(searchTerm.value.toLowerCase())
  )
)

function formatCurrency(value) {
  return value.toLocaleString('pt-BR', { minimumFractionDigits: 2 })
}

function getStatusText(status) {
  return {
    valid: 'Válido',
    expiring: 'A vencer',
    expired: 'Vencido'
  }[status]
}
</script>

<style>

/* BASE */
body {
  margin: 0;
  font-family: 'Barlow', sans-serif;
  background: #f3f3f3;
}

/* HEADER */
.header {
  background: linear-gradient(90deg, #fdd017, #e6c200);
  height: 60px;
  display: flex;
  align-items: center;
  padding: 0 20px;
  justify-content: space-between;
}

.header h1 {
  font-family: 'Bebas Neue', sans-serif;
}

/* CONTAINER */
.container {
  padding: 20px;
  max-width: 1400px;
  margin: auto;
}

/* TITLE */
.title {
  font-family: 'Bebas Neue';
  font-size: 48px;
}

.title-underline {
  width: 80px;
  height: 4px;
  background: #fdd017;
  margin-bottom: 20px;
}

/* CARDS */
.cards {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 15px;
  margin-bottom: 20px;
}

.card {
  background: #e9e9e9;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.card.yellow { border-left: 4px solid #fdd017; }
.card.green { border-left: 4px solid #22c55e; }

.card.alert {
  background: linear-gradient(135deg, #ef4444, #dc2626);
  color: white;
}

.divider {
  height: 1px;
  background: #ccc;
  margin: 10px 0;
}

/* FILTERS */
.filters {
  display: flex;
  gap: 10px;
  margin-bottom: 15px;
  flex-wrap: wrap;
}

input, select {
  padding: 8px;
  border: 1px solid #ccc;
}

/* TABLE */
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

th, td {
  padding: 10px;
  text-align: left;
}

tr {
  border-bottom: 1px solid #ddd;
}

/* STATUS */
.status {
  padding: 4px 10px;
  border-radius: 20px;
  font-size: 12px;
}

.status.valid {
  background: rgba(34,197,94,0.1);
  color: green;
}

.status.expiring {
  background: rgba(245,158,11,0.1);
  color: orange;
}

.status.expired {
  background: rgba(239,68,68,0.1);
  color: red;
}

/* FOOTER */
.table-footer {
  padding: 10px;
  font-size: 13px;
}

/* RESPONSIVO */
@media (max-width: 1024px) {
  .cards {
    grid-template-columns: 1fr 1fr;
  }
}

@media (max-width: 600px) {
  .cards {
    grid-template-columns: 1fr;
  }

  .title {
    font-size: 32px;
  }

  .header h1 {
    font-size: 16px;
  }
}
</style>