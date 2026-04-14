<template>
  <section class="login-page">

    <!-- FAIXA DE FUNDO -->
    <div class="separacao"></div>

    <!-- CARD -->
    <div class="login-card">

      <!-- CORTE DIAGONAL -->
      <div class="separacao2"></div>

      <div class="login-content">

        <!-- ESQUERDA -->
        <div class="login-left">
          <h1>Faça seu Login</h1>

          <form class="login-form" @submit.prevent="handleLogin">

            <input
              type="email"
              v-model="email"
              placeholder="Digite seu e-mail"
              required
            />

            <input
              type="password"
              v-model="password"
              placeholder="Digite sua senha"
              required
            />

            <button :disabled="loading">
              {{ loading ? 'Carregando...' : 'Login' }}
            </button>

            <p class="error" v-if="errorMessage">
              {{ errorMessage }}
            </p>

            <a href="#" class="link">Esqueceu sua senha?</a>
            <router-link to="/initial" class="link">
              Não tem uma conta?
            </router-link>

          </form>
        </div>

        <!-- DIREITA (IMAGEM) -->
        <div class="login-right">
          <img src="../assets/logo_login.png" alt="Imagem EPI" />
        </div>

      </div>

    </div>

  </section>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { supabase } from '../composables/useSupabase'

const router = useRouter()

const email = ref('')
const password = ref('')
const loading = ref(false)
const errorMessage = ref('')

const handleLogin = async () => {
  errorMessage.value = ''
  loading.value = true

  try {
    const { error } = await supabase.auth.signInWithPassword({
      email: email.value,
      password: password.value
    })

    if (error) throw error

    router.push('/initial')

  } catch (error) {
    errorMessage.value = 'E-mail ou senha incorretos'
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>

/* BASE */
.login-page {
  height: 100vh;
  background: #FFFDF2;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  overflow: hidden;
}

/* FAIXA FUNDO */
.separacao {
  position: absolute;
  width: 150%;
  height: 200px;
  background: black;
  transform: rotate(-25deg);
  top: 40%;
  z-index: 1;
}

/* CARD */
.login-card {
  width: 1000px;
  background: white;
  border-radius: 16px;
  box-shadow: 0 20px 50px rgba(0,0,0,0.15);
  padding: 40px;
  position: relative;
  z-index: 10;
  overflow: hidden;
}

/* CORTE DIAGONAL */
.separacao2 {
  position: absolute;
  top: 0;
  left: 45%;
  width: 300px;
  height: 120%;
  background: white;

  transform: skewX(-20deg);
  transform-origin: top;

  z-index: 20;

  /* sombra suave (efeito premium) */
  box-shadow: -10px 0 30px rgba(0,0,0,0.1);
}

/* CONTEÚDO */
.login-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 40px;
}

/* ESQUERDA */
.login-left {
  width: 45%;
  z-index: 30;
}

.login-left h1 {
  font-size: 2rem;
  margin-bottom: 20px;
}

/* FORM */
.login-form {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.login-form input {
  padding: 12px;
  border-radius: 10px;
  border: 1px solid #ccc;
  background: #f5f5f5;
}

/* BOTÃO */
.login-form button {
  padding: 12px;
  background: black;
  color: white;
  border: none;
  border-radius: 20px;
  font-weight: bold;
  cursor: pointer;
  transition: 0.3s;
}

.login-form button:hover {
  background: #FFCC00;
  color: black;
}

/* LINKS */
.link {
  font-size: 0.8rem;
  color: #333;
  text-decoration: none;
}

/* ERRO */
.error {
  color: red;
  font-size: 0.85rem;
}

/* DIREITA */
.login-right {
  width: 50%;
  z-index: 10;
}

.login-right img {
  width: 100%;
  border-radius: 16px;
}

/* RESPONSIVO */
@media (max-width: 900px) {
  .login-content {
    flex-direction: column;
  }

  .login-left {
    width: 100%;
  }

  .login-right {
    width: 100%;
  }

  .separacao2 {
    display: none; /* remove corte no mobile */
  }

  .login-card {
    width: 90%;
  }
}

</style>