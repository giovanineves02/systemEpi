import{ createRouter, createWebHistory } from'vue-router'
import Home from'../views/home.vue'
import Landing from'/./views/Landing.vue'
import Login from'../views/Login.vue'
constroutes = [
{ path: '/ Home', component: Home },
{ path: '/ Landing', component: Landing },
{ path: '/ Login', component: Login }
]
constrouter = createRouter({
history: createWebHistory(),
routes
})
exportdefaultrouter