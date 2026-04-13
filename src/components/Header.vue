<template>
  <header class="header">
    <div class="logo-container">
      <div class="logo-icon">
<img src="../assets/logo.png" alt="Logo Aqui">
      </div>
      <h2 class="logo-text">SAFETY STOCK EPI</h2>
    </div>
    <div class="Funcionalidades">
     <div class="Funcionalidades">
        <h2>Funcionalidades </h2>
      </div>
      <div class="Sobre">
        <h2>Sobre </h2>
      </div>
      <div class="contato">
        <h2>Contato</h2>
      </div>

      <div class="user-container">
        <router-link to="/Logintati" class="user-icon">
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
</script>

<style scoped>
* {
  box-sizing: border-box;                                                        /* inclui padding e border na largura total */
  margin: 0;                                                                      /* remove margens padrão */
  padding: 0;                                                                     /* remove espaçamento interno padrão */
}                                                                  /* CSS só vale neste componente */
.header {
  display: flex;
  justify-content: space-between;
  background-color: #FFCC00;
  padding: 20px 45px;
  height: 6rem;
  
}

.logo-container {
  display: flex;
  flex-direction: column;
  gap: 5px;
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
  width: 4rem;
  height: 4rem;
  object-fit: contain;
}

.logo-text {
  font-size: 1.2rem;  
  font-weight: bold;
  margin-right: 16px;
  color: black;
  text-align: center;
}

.Funcionalidades {
  display: flex;
  gap: 5rem;
  align-items: center;
   font-size: 1rem;
   color: black;
}

.contato {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 5px;
  font-size: 1rem;
}

.Sobre {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 5px;
   font-size: 1rem;
}

.user-container {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.user-icon {
  background-color: #000000;
  width: 8rem;
  height: 3rem;
  border-radius: 5%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.5rem;
  cursor: pointer;
  text-decoration: none;
  color: white
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


