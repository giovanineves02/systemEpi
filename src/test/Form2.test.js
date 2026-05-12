// mount monta a página Vue no teste
import { mount } from '@vue/test-utils'
// describe, it e expect vêm do Vitest
import { describe, it, expect } from 'vitest'
// Página que será testada
import Form2 from '../views/Form2.vue'
// Grupo de testes da tela
describe('Form2', () => {
// Teste específico: cadastro sem nome
it('deve mostrar erro quando o nome não for preenchido', async () => {
// Monta a tela como se estivesse aberta no navegador
const wrapper = mount(Form2)
// Simula o envio do formulário vazio
// Correto: trigger('submit')
await wrapper.find('form').trigger('submit')
// Verifica se a mensagem apareceu na tela
expect(wrapper.text()).toContain(
'O nome do funcionário é obrigatório.'
)
})
})