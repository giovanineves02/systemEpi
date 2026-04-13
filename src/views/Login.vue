<template>

  <section class="login-page">
        <div class="separacao">
    </div>
    <div class="login-card">
      <h1>Seja bem-vindo!</h1>
      <p>Faça login para acessar seu sistema de gestão de EPI.</p>
      <form class="login-form" @submit.prevent="entrar">
        <label>
          E-mail
          <input type="email" v-model="email" required placeholder="seu@exemplo.com" />
        </label>
        <label>
          Senha
          <input type="password" v-model="senha" required placeholder="••••••••" />
        </label>
        <button type="submit">Entrar
        </button>
        <div class="home__hero-imagem">                                             <!-- lado direito: imagem ilustrativa -->
        <img                                                                       
          src="../assets/logo_login.png"                                               
          alt="Ilustração de gestão de EPI"                                        
          class="home__hero-img"                                                   
        />                                                                         <!-- tag img não tem fechamento -->
      </div>
              <div class="separacao2">
    </div> 
      </form>

    </div>
  </section>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const email = ref('');
const senha = ref('');

const entrar = async () => {
  // Validação básica
  if (!email.value || !senha.value) {
    alert('Por favor, preencha todos os campos');
    return;
  }
  
  // Aqui você pode adicionar a lógica de autenticação com Supabase
  // Por enquanto, redireciona para o logintati
  router.push('/logintati');
};
</script>

<style scoped>

.login-page {
  max-width: auto;                                                               /* largura máxima da página */
  margin: auto;    
  height: 38rem;                                                              /* centraliza na tela */
  padding: 2rem;     
  background-color: #FFFDF2;    
  position: relative;
    overflow: hidden;
}

.login-card {
  width: 60rem;
  height: 25rem;
  background: #ffffff;
  border: 1px solid #e0e7ff;
  border-radius: 16px;
  box-shadow: 0 16px 40px rgba(0, 0, 0, 0.12);
  padding: 2rem;
  text-align: left;
  margin-top: 5rem;
 margin-left: 10rem;
  position: relative;
  z-index: 30;
      overflow: hidden;

}

.login-card h1 {
  margin-bottom: 0.5rem;
  color: #000000;
    z-index: 30;

}

.login-card p {
  margin-bottom: 1.5rem;
  color: #000000;
    z-index: 30;

}

.login-form {
  display: flex;
  flex-direction: column;
  width: 30rem;
  gap: 1rem;
    z-index: 30;

}

.login-form label {
  display: flex;
  flex-direction: column;
  text-align: left;
  font-weight: 600;
  color: #000000;
  font-size: 0.95rem;
    z-index: 30;

}

.login-form input {
  margin-top: 0.5rem;
  padding: 0.85rem 0.75rem;
  border: 1px solid #cbd5e1;
  border-radius: 8px;
  font-size: 0.95rem;
  color: #000000;
  z-index: 30;
}

.login-form button {
  margin-top: 0.5rem;
  padding: 0.85rem;
  font-size: 1rem;
  font-weight: 700;
  border: none;
  border-radius: 8px;
  color: white;
  background: #000000;
  cursor: pointer;
  transition: transform 0.2s ease, background 0.2s ease;
  z-index: 30;
}

.login-form button:hover {
  background: #FFCC00;
  transform: translateY(-1px);
}

.login-card h1 {
  font-size: 2.5rem;
  color: #000000;
  margin-bottom: 0.5rem;
  z-index: 30;
}

.home__hero-img {
  width: 25rem;
  height: 25rem;
  margin-top: -23.5rem;
  margin-left: 35rem;
  z-index: 8;
}

.separacao {

  position: absolute;
  top: 50%;
  left: 50%;
  width: 150%;
  height: 180px;
  background: black;
  transform: translate(-50%, -50%) rotate(-25deg);
  transform-origin: center;


}

.separacao2 {

  position: absolute;
  top: 50%;
  left: 50%;
  width: 50rem;
  height: 10rem;
  background: rgb(255, 255, 255);
  transform: translate(-50%, -0%) rotate(70deg);
  transform-origin: center;
  z-index: 20;
  margin-left: 10rem;


}


</style>




