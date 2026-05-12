<template>
  <div>

    <!-- HEADER -->
    <header class="header">

      <!-- HAMBURGER -->
      <button 
        class="hamburger" 
        :class="{ active: menuOpen }"
        @click="toggleMenu"
      >
        <span></span>
        <span></span>
        <span></span>
      </button>

      <!-- LOGO -->
      <div class="logo-container">
        <div class="logo-icon">
          <img src="../assets/logo.png" alt="Logo">
        </div>
        <h2 class="logo-text">SAFETY STOCK EPI</h2>
      </div>

      <!-- USER MENU -->
      <div class="user-menu" v-if="session">
        <button @click="toggleUserMenu" class="user-icon">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12Z" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M20.59 22C20.59 18.13 16.74 15 12 15C7.26 15 3.41 18.13 3.41 22" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </button>
        <div v-if="userMenuOpen" class="user-dropdown">
          <p>{{ session.user.email }}</p>
          <button @click="logout" class="logout-btn">Sair</button>
        </div>
      </div>

    </header>

    <!-- SIDEBAR -->
    <aside class="sidebar" :class="{ open: menuOpen }" @click.stop="toggleMenu">
      <router-link to="/initial" class="menu-link">Relatórios</router-link>
      <router-link to="/cadastroFuncionario" class="menu-link">Cadastro Funcionário</router-link>
      <router-link to="/cadastroEpi" class="menu-link">Cadastro EPI</router-link>
      <router-link to="/cadastroEntrega" class="menu-link">Cadastro Entrega</router-link>
    </aside>

  </div>
</template>

<script setup>
import { ref } from 'vue'
import { RouterLink, useRouter } from 'vue-router'
import { useSupabase } from '../composables/useSupabase.js'

const { session, supabase } = useSupabase()
const router = useRouter()

const menuOpen = ref(false)
const userMenuOpen = ref(false)

function toggleMenu() {
  menuOpen.value = !menuOpen.value
}

function toggleUserMenu() {
  userMenuOpen.value = !userMenuOpen.value
}

async function logout() {
  await supabase.auth.signOut()
  userMenuOpen.value = false
  router.push('/login2')
}
</script>

<style scoped>

/* RESET */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

/* HEADER */
.header {
  display: flex;
  align-items: center;
  gap: 10px;
  background: #FFCC00;
  padding: 0 20px;
  height: 70px;
  justify-content: space-between;
}

/* LOGO */
.logo-container {
  display: flex;
  align-items: center;
  gap: 10px;
  margin-right: auto;
}

.logo-icon img {
  width: 50px;
}

.logo-text {
  font-weight: bold;
  font-size: 18px;
}

/* USER MENU */
.user-menu {
  position: relative;
}

.user-icon {
  background: none;
  border: none;
  cursor: pointer;
  padding: 5px;
}

.user-dropdown {
  position: absolute;
  top: 100%;
  right: 0;
  background: white;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 10px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.2);
  z-index: 10;
}

.user-dropdown p {
  margin: 0 0 10px 0;
  font-size: 14px;
}

.logout-btn {
  background: #dc3545;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 4px;
  cursor: pointer;
}

.logout-btn:hover {
  background: #c82333;
}

/* HAMBURGER */
.hamburger {
  width: 30px;
  height: 22px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  cursor: pointer;
  background: none;
  border: none;
}

.hamburger span {
  height: 3px;
  width: 100%;
  background: black;
  border-radius: 2px;
  transition: 0.3s;
}

/* ANIMAÇÃO */
.hamburger.active span:nth-child(1) {
  transform: rotate(45deg) translate(5px, 5px);
}

.hamburger.active span:nth-child(2) {
  opacity: 0;
}

.hamburger.active span:nth-child(3) {
  transform: rotate(-45deg) translate(6px, -6px);
}

/* SIDEBAR */
.sidebar {
  position: fixed;
  top: 0;
  left: -250px;
  width: 260px;
  height: 100%;
  background: #111111;
  color: white;
  padding: 24px;
  transition: left 0.3s ease;
  z-index: 1000;
  box-shadow: 4px 0 20px rgba(0, 0, 0, 0.35);
}

.sidebar.open {
  left: 0;
}

.menu-link {
  display: block;
  color: white;
  text-decoration: none;
  font-weight: 600;
  margin-bottom: 18px;
  padding: 10px 14px;
  border-radius: 12px;
  transition: background 0.2s ease, transform 0.2s ease;
}

.menu-link:hover,
.menu-link.router-link-active {
  background: rgba(255, 255, 255, 0.1);
  transform: translateX(2px);
}

.sidebar p {
  display: none;
}

/* RESPONSIVO */
@media (max-width: 600px) {
  .logo-text {
    font-size: 14px;
  }

  .logo-icon img {
    width: 40px;
  }
}

</style>