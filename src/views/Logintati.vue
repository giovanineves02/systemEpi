<template>
<form @submit.prevent="handleLogin">
<label for="email">E-mail</label>
<input
id="email"
v-model="email"
type="email"
placeholder="seu@email.com"
/>
<label for="password">Senha</label>
<input
id="password"
v-model="password"
type="password"
placeholder="Digite sua senha"
/>
<button :disabled="loading">
{{ loading ? 'Carregando...' :
'Entrar' }}
</button>
<p v-if="errorMessage">
{{ errorMessage }}
</p>
<router-link to="/register">
    Não tem conta? Cadastre-se
</router-link>
</form>
</template>

<script setup>
// Importa ref para criar variáveis reativas
import { ref } from 'vue'
// Importa o router para mudar de tela
import { useRouter } from 'vue-router'
// Importa o cliente do Supabase
import { supabase } from '../composables/useSupabase'
// Cria acesso ao router
const router = useRouter()
// Guarda o email digitado
const email = ref('')
// Guarda a senha digitada
const password = ref('')
// Controla o estado de carregamento do botão
const loading = ref(false)
// Guarda a mensagem de erro
const errorMessage = ref('')
// Função chamada quando o formulário for enviado
const handleLogin = async () => {
// Limpa a mensagem de erro antiga
errorMessage.value = ''
// Ativa o loading
loading.value = true
try {
// Tenta fazer login no Supabase
const { error } = await
supabase.auth.signInWithPassword({
email: email.value,
password: password.value
})
// Se vier erro do Supabase, manda para o catch
if (error) throw error
// Se deu certo, vai para a tela
principal
router.push('/dashboard')
} catch (error) {
// Mostra erro para o usuário
errorMessage.value = 'E-mail ou senha incorretos'
} finally {
// Desliga o loading sempre no final
loading.value = false
}
}
</script>
<style scoped>
form{
display:flex;
flex-direction:column;
gap:10px;
max-width:320px;
margin:auto;
}
label{
font-weight:bold;
}
input,button{
padding:10px;
border-radius:8px;
border:1px solid #ccc;
}
button{
background:#667eea;
color:#fff;
border:none;
}
a{
color:#667eea;
text-decoration:none;
}
</style>