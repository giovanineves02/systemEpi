import{ createRouter, createWebHistory } from'vue-router'
import Home from'../views/Home.vue'
//import Landing from'../views/Landing.vue'
import Login from'../views/Login.vue'
const routes = [
{ path: '/', component: Home },
//{ path: '/Landing', component: Landing },
{ path: '/login', component: Login }
]
const router = createRouter({
history: createWebHistory(),
routes
})
export default router