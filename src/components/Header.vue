<template>
  <header class="header">
    <div class="logo-container">
      <div class="logo-icon">
        <img 
          :src="logo"
          alt="Imagem logo"
          class="icon-placeholder"
        />
      </div>
      <h2 class="logo-text">SAFETY STOCK EPI</h2>
    </div>
    <div class="right-options">
     <div class="Funcionalidades">
        <h3>Funcionalidades </h3>
      </div>
      <div class="Sobre">
        <h3>Sobre </h3>
      </div>
      <div class="contato">
        <h3>contato</h3>
      </div>

      <div class="user-container">
        <router-link to="/login" class="user-icon">
          <span class="icon-placeholder">Login</span>
        </router-link>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'Header'
};
import logo from '../assets/logo.png';
</script>

<style scoped>
.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #383e49;
  padding: 15px 50px;
  color: #ffffff;
}

.logo-container {
  display: flex;
  align-items: center;
  gap: 15px;
}

.logo-icon {
  border-radius: 50%;
  width: 40px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center; 
}

.logo-icon img {
  width: 250%;
  height: 250%;
}

.logo-text {
  font-size: 1.5rem;
  font-weight: bold;
  margin: 0;
}

.right-options {
  display: flex;
  gap: 1rem;
  align-items: center;
}

.contato {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 5px;
}

.Sobre {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 5px;
}

.user-container {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.user-icon {
  background-color: #c0b1b1;
  width: 90px;
  height: 40px;
  border-radius: 5%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.2rem;
  cursor: pointer;
  text-decoration: none;
}



.tooltip {
  position: absolute;
  top: 55px;
  background-color: #f05432;
  color: white;
  padding: 8px 12px;
  border-radius: 4px;
  font-weight: bold;
  font-size: 0.9rem;
  white-space: nowrap;
}

.tooltip::after {
  content: "";
  position: absolute;
  bottom: 100%; 
  left: 50%;
  margin-left: -6px;
  border-width: 6px;
  border-style: solid;
  border-color: transparent transparent #f05432 transparent;
  

}
</style>


