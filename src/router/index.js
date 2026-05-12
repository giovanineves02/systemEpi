import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
//import Landing from '../views/Landing.vue'

import Login2 from '../views/login2.vue'
import Initial from '../views/initial.vue'
import CadastroFuncionario from '../views/cadastroFuncionario.vue'
import CadastroEpi from '../views/cadastroEpi.vue'
import CadastroEntrega from '../views/cadastroEntrega.vue'

const routes = [
  { path: '/', component: Home },
  //{ path: '/Landing', component: Landing },
  { path: '/login2', component: Login2 },
  { path: '/initial', component: Initial },
  { path: '/cadastroFuncionario', component: CadastroFuncionario },
  { path: '/cadastroEpi', component: CadastroEpi },
  { path: '/cadastroEntrega', component: CadastroEntrega }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router