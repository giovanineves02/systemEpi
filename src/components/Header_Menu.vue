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

    </header>

    <!-- SIDEBAR -->
    <aside class="sidebar" :class="{ open: menuOpen }">
      <p>Dashboard</p>
      <p>Relatórios</p>
      <p>Configurações</p>
    </aside>

  </div>
</template>

<script setup>
import { ref } from 'vue'

const menuOpen = ref(false)

function toggleMenu() {
  menuOpen.value = !menuOpen.value
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
  gap: 20px;
  background: #FFCC00;
  padding: 0 20px;
  height: 70px;
}

/* LOGO */
.logo-container {
  display: flex;
  align-items: center;
  gap: 10px;
}

.logo-icon img {
  width: 50px;
}

.logo-text {
  font-weight: bold;
  font-size: 18px;
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
  width: 250px;
  height: 100%;
  background: #1a1a1a;
  color: white;
  padding: 20px;
  transition: 0.3s;
  z-index: 1000;
}

.sidebar.open {
  left: 0;
}

.sidebar p {
  margin-bottom: 15px;
  cursor: pointer;
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