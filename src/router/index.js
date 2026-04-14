import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
//import Landing from '../views/Landing.vue'

import Login2 from '../views/login2.vue'
import Initial from '../views/initial.vue'

const routes = [
  { path: '/', component: Home },
  //{ path: '/Landing', component: Landing },
  { path: '/login2', component: Login2 },
  { path: '/initial', component: Initial }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router