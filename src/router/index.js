import{ createRouter, createWebHistory } from'vue-router'
import Home from'../views/Home.vue'
//import Landing from'../views/Landing.vue'
<<<<<<< HEAD

import Login2 from'../views/login2.vue'
import Initial from'../views/initial.vue'
const routes = [
{ path: '/', component: Home },
//{ path: '/Landing', component: Landing },
{ path: '/login2', component: Login2 },
{ path: '/initial', component: Initial }
=======
import Login from'../views/Login.vue'
import Logintati from'../views/Logintati.vue'
const routes = [
{ path: '/', component: Home },
//{ path: '/Landing', component: Landing },
{ path: '/login', component: Login },
{ path: '/logintati', component: Logintati }
>>>>>>> e8f01bac7a13db57410011e7f936ab03787949ae
]
const router = createRouter({
history: createWebHistory(),
routes
})
export default router