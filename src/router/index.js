import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
//import Landing from '../views/Landing.vue'

import Login2 from '../views/login2.vue'
import Initial from '../views/initial.vue'
import CadastroFuncionario from '../views/cadastroFuncionario.vue'
import CadastroEpi from '../views/cadastroEpi.vue'
import CadastroEntrega from '../views/cadastroEntrega.vue'
import { session, loadingSession } from '../composables/useSupabase'

const routes = [
  { path: '/', component: Home, meta: { requiresAuth: false } },
  //{ path: '/Landing', component: Landing },
  { path: '/login2', component: Login2, meta: { requiresAuth: false } },
  { path: '/initial', component: Initial, meta: { requiresAuth: true } },
  { path: '/cadastroFuncionario', component: CadastroFuncionario, meta: { requiresAuth: true } },
  { path: '/cadastroEpi', component: CadastroEpi, meta: { requiresAuth: true } },
  { path: '/cadastroEntrega', component: CadastroEntrega, meta: { requiresAuth: true } }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// Guardião de rota para proteger rotas privadas
router.beforeEach(async (to, from, next) => {
  // Aguarda o carregamento da sessão se ainda está carregando
  let attempts = 0
  while (loadingSession.value && attempts < 100) {
    await new Promise(resolve => setTimeout(resolve, 50))
    attempts++
  }
  
  // Verifica se a rota requer autenticação
  if (to.meta.requiresAuth) {
    if (!session.value) {
      // Redireciona para login se não estiver autenticado
      next({ path: '/login2', replace: true })
      return
    }
  }
  
  // Se está na página de login e já autenticado, redireciona para initial
  if (to.path === '/login2' && session.value) {
    next({ path: '/initial', replace: true })
    return
  }
  
  next()
})

export default router