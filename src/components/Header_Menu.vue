<template>
  <div>

    <header class="header">

      <button
        class="hamburger"
        :class="{ active: menuOpen }"
        @click="toggleMenu"
      >
        <span></span>
        <span></span>
        <span></span>
      </button>

      <div class="logo-container">
        <div class="logo-icon">
          <img src="../assets/logo.png" alt="Logo">
        </div>

        <h2 class="logo-text">SAFETY STOCK EPI</h2>
      </div>

      <div class="user-menu" v-if="session">
        <button @click="toggleProfileModal" class="user-icon">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path
              d="M12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12Z"
              stroke="black"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />

            <path
              d="M20.59 22C20.59 18.13 16.74 15 12 15C7.26 15 3.41 18.13 3.41 22"
              stroke="black"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>
        </button>
      </div>

    </header>

    <aside class="sidebar" :class="{ open: menuOpen }">

      <router-link to="/initial" class="menu-link">
        Relatórios
      </router-link>

      <router-link to="/cadastroFuncionario" class="menu-link">
        Cadastro Funcionário
      </router-link>

      <router-link to="/cadastroEpi" class="menu-link">
        Cadastro EPI
      </router-link>

      <router-link to="/cadastroEntrega" class="menu-link">
        Cadastro Entrega
      </router-link>

    </aside>

    <div
      v-if="profileModal"
      class="modal-overlay"
      @click="closeProfileModal"
    >

      <div
        class="profile-modal"
        @click.stop
      >

        <div class="profile-avatar">

          <svg width="55" height="55" viewBox="0 0 24 24" fill="none">

            <path
              d="M12 12C14.7614 12 17 9.76142 17 7C17 4.23858 14.7614 2 12 2C9.23858 2 7 4.23858 7 7C7 9.76142 9.23858 12 12 12Z"
              stroke="#6B7280"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />

            <path
              d="M20.59 22C20.59 18.13 16.74 15 12 15C7.26 15 3.41 18.13 3.41 22"
              stroke="#6B7280"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />

          </svg>

        </div>

        <h2 class="user-name">
          {{ userName }}
        </h2>

        <p class="user-email">
          {{ session?.user?.email }}
        </p>

        <div class="input-group">

          <label>Senha Atual</label>

          <div class="password-input">

            <input
              :type="showCurrentPassword ? 'text' : 'password'"
              v-model="currentPassword"
              placeholder="Digite sua senha atual"
            >

            <button @click="showCurrentPassword = !showCurrentPassword">
              👁
            </button>

          </div>

        </div>

        <div class="input-group">

          <label>Nova Senha</label>

          <div class="password-input">

            <input
              :type="showNewPassword ? 'text' : 'password'"
              v-model="newPassword"
              placeholder="Digite sua nova senha"
            >

            <button @click="showNewPassword = !showNewPassword">
              👁
            </button>

          </div>

        </div>

        <div class="input-group">

          <label>Confirmar Nova Senha</label>

          <div class="password-input">

            <input
              :type="showConfirmPassword ? 'text' : 'password'"
              v-model="confirmPassword"
              placeholder="Confirme sua nova senha"
            >

            <button @click="showConfirmPassword = !showConfirmPassword">
              👁
            </button>

          </div>

        </div>

        <button
          class="save-btn"
          @click="updatePassword"
        >
          Salvar Alterações
        </button>

        <button
          class="logout-btn-modal"
          @click="logout"
        >
          Sair
        </button>

      </div>

    </div>

  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { useSupabase } from '../composables/useSupabase.js'

const { session, supabase } = useSupabase()

const router = useRouter()

const menuOpen = ref(false)
const profileModal = ref(false)

const currentPassword = ref('')
const newPassword = ref('')
const confirmPassword = ref('')

const showCurrentPassword = ref(false)
const showNewPassword = ref(false)
const showConfirmPassword = ref(false)

const userName = computed(() => {

  const email = session?.value?.user?.email || ''

  if (!email) return 'Usuário'

  return email
    .split('@')[0]
    .replace('.', ' ')

})

function toggleMenu() {
  menuOpen.value = !menuOpen.value
}

function toggleProfileModal() {
  profileModal.value = !profileModal.value
}

function closeProfileModal() {
  profileModal.value = false
}

async function updatePassword() {

  if (newPassword.value !== confirmPassword.value) {
    alert('As senhas não coincidem')
    return
  }

  const { error } = await supabase.auth.updateUser({
    password: newPassword.value
  })

  if (error) {
    alert(error.message)
    return
  }

  alert('Senha atualizada com sucesso')

  currentPassword.value = ''
  newPassword.value = ''
  confirmPassword.value = ''
}

async function logout() {
  await supabase.auth.signOut()
  router.push('/login2')
}
</script>

<style scoped>

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.header {
  position: sticky;
  top: 0;
  z-index: 1001;

  display: flex;
  align-items: center;
  gap: 10px;

  background: #FFCC00;

  padding: 0 20px;

  height: 70px;

  justify-content: space-between;
}

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

.user-menu {
  position: relative;
}

.user-icon {
  background: none;
  border: none;
  cursor: pointer;

  padding: 5px;

  display: flex;
  align-items: center;
  justify-content: center;
}

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

.hamburger.active span:nth-child(1) {
  transform: rotate(45deg) translate(5px, 5px);
}

.hamburger.active span:nth-child(2) {
  opacity: 0;
}

.hamburger.active span:nth-child(3) {
  transform: rotate(-45deg) translate(6px, -6px);
}

.sidebar {
  position: fixed;

  top: 0;
  left: -250px;

  width: 260px;
  height: 100vh;

  background: #111111;
  color: white;

  padding: 24px;

  transition: left 0.3s ease;

  z-index: 1000;

  box-shadow: 4px 0 20px rgba(0, 0, 0, 0.35);

  overflow-y: auto;
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

  transition:
    background 0.2s ease,
    transform 0.2s ease;
}

.menu-link:hover,
.menu-link.router-link-active {
  background: rgba(255, 255, 255, 0.1);
  transform: translateX(2px);
}

.modal-overlay {
  position: absolute;

  top: 78px;
  right: 20px;

  z-index: 9999;
}

.profile-modal {
  width: 360px;

  background: #F5F5F5;

  border-radius: 18px;

  padding: 22px;

  box-shadow: 0 10px 30px rgba(0,0,0,0.18);

  animation: fadeIn 0.2s ease;
}

.profile-avatar {
  width: 75px;
  height: 75px;

  background: #E5E7EB;

  border-radius: 50%;

  margin: 0 auto 14px;

  display: flex;
  align-items: center;
  justify-content: center;
}

.user-name {
  text-align: center;

  font-size: 22px;

  margin-bottom: 4px;

  font-weight: 700;

  text-transform: capitalize;
}

.user-email {
  text-align: center;

  font-size: 13px;

  color: #666;

  margin-bottom: 22px;

  word-break: break-word;
}

.input-group {
  margin-bottom: 16px;
}

.input-group label {
  display: block;

  margin-bottom: 7px;

  font-weight: 600;

  font-size: 14px;
}

.password-input {
  position: relative;
}

.password-input input {
  width: 100%;
  height: 44px;

  border-radius: 12px;

  border: 1px solid #D1D5DB;

  padding: 0 44px 0 14px;

  font-size: 14px;

  background: white;

  outline: none;

  transition: border 0.2s ease;
}

.password-input input:focus {
  border-color: #FFCC00;
}

.password-input button {
  position: absolute;

  right: 14px;
  top: 50%;

  transform: translateY(-50%);

  border: none;

  background: none;

  cursor: pointer;

  font-size: 15px;
}

.save-btn {
  width: 100%;
  height: 46px;

  border: none;

  border-radius: 12px;

  background: #FFC400;

  font-size: 16px;
  font-weight: 700;

  cursor: pointer;

  margin-top: 6px;

  transition: 0.2s;
}

.save-btn:hover {
  filter: brightness(0.95);
}

.logout-btn-modal {
  width: 100%;
  height: 46px;

  border: none;

  border-radius: 12px;

  background: #E63946;

  color: white;

  font-size: 16px;
  font-weight: 700;

  cursor: pointer;

  margin-top: 12px;

  transition: 0.2s;
}

.logout-btn-modal:hover {
  filter: brightness(0.95);
}

@keyframes fadeIn {

  from {
    opacity: 0;
    transform: translateY(-10px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }

}

@media (max-width: 600px) {

  .logo-text {
    font-size: 14px;
  }

  .logo-icon img {
    width: 40px;
  }

  .modal-overlay {
    top: 74px;
    right: 10px;
  }

  .profile-modal {
    width: 94vw;
    padding: 18px;
  }

}

</style>