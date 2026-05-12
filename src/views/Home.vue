<template>                                                                         <!-- bloco obrigatório que envolve o HTML do componente Vue -->
<Header />            
  <div class="home">                                                               <!-- div principal que centraliza o conteúdo -->

    <!-- ========== HERO ========== -->

    <section class="home__menu">                                                   <!-- seção com título, texto e imagem -->

      <div class="home__menu-texto">                                                                                     <!-- lado esquerdo: título principal da página -->
        <h1>Sistema de Controle de EPIs<br> para Instituições de Ensino</h1> 
        <p>Gerencie entregas, validade e rastreabilidade de <br>equipamentos de proteção individual de forma <br> simples e eficiente</p>   <!-- texto de apresentação -->
        <router-link to="/login" class="start_now">
           <button class="button_Comece_agora">Comece agora</button>
        </router-link>
      </div>                                                               <!-- fecha o bloco de texto -->

      <div class="home__hero-imagem">                                             <!-- lado direito: imagem ilustrativa -->
        <img                                                                       
          src="../assets/landing.png"                                               
          alt="Ilustração de gestão de EPI"                                        
          class="home__hero-img"                                                   
        />                                                                         <!-- tag img não tem fechamento -->
      </div>                                                                       <!-- fecha o bloco de imagem -->

    </section>                                                                     <!-- fecha a seção hero -->

    <div class="section__divider"></div>

    <section class="home__cards">                                                  <!-- seção com os 4 cards de números -->

      <div class="card">                                                           <!-- card: plano inicial -->
                    
        <span class="card__numero1">Inicial</span>                                     <!-- plano em destaque -->
        <div class="card__preco">
          <span class="card__valor1">R$50</span>
          <span class="card__valor4">/mês</span>
        </div>
       <span class="card__label1">- Lançamento de EPI</span>
        <span class="card__label2">- Notificação de vencimento</span>
        <span class="card__label3">- Lançamento de fornecedores</span> 
         <button class="button_solicitar_orcamento1">Comece agora</button>                                          <!-- preço do plano -->
      </div>                                                                       <!-- fecha o card -->

      <div class="card2">                                                           <!-- card: plano inicial -->
                    
        <span class="card__numero2">Intermediário</span>                                     <!-- plano em destaque -->
        <div class="card__preco">
          <span class="card__valor1">R$150</span>
          <span class="card__valor4">/mês</span>
        </div>
       <span class="card__label1">- Lançamento de EPI</span>
        <span class="card__label2">- Notificação de vencimento</span>
        <span class="card__label3">- Lançamento de fornecedores</span>    
        <span class="card__label3">- API de Integração</span>    
        <button class="button_solicitar_orcamento2">Comece agora</button>                                 
      </div>                                                                          <!-- fecha o card -->

      <div class="card3">                                                           <!-- card: plano inicial -->
                    
        <span class="card__numero3">Avançado</span>                                     <!-- plano em destaque -->
        <div class="card__preco">
          <span class="card__valor1">R$300</span>
          <span class="card__valor4">/mês</span>
        </div>
       <span class="card__label1">- Lançamento de EPI</span>
        <span class="card__label2">- Notificação de vencimento</span>
        <span class="card__label3">- Lançamento de fornecedores</span>    
        <span class="card__label3">- API de Integração</span>       
        <span class="card__label3">- 16h Treinamento Próprio</span>   
        <button class="button_solicitar_orcamento3">Comece agora</button>                                  
      </div>                                                                     <!-- fecha o card -->
    </section>       
    
    <div class="section__divider"></div>

    <section class="Cards_funcionalidades">
      <div class="first_card_funcionalidades">
        <h1>SISTEMA NA PRÁTICA!</h1>
      </div>

      <div class="funcionalidades_grid">
        <div class="card_funcionalidade">
          <div class="icon_funcionalidade">📦</div>
          <h3>Controle de Estoque</h3>
          <p>Gerenciamento completo de EPIs com rastreamento de entrada, saída e disponibilidade em tempo real</p>
        </div>

        <div class="card_funcionalidade">
          <div class="icon_funcionalidade">⏰</div>
          <h3>Notificação de Vencimento</h3>
          <p>Alertas automáticos para EPIs próximos do vencimento, garantindo segurança e conformidade</p>
        </div>

        <div class="card_funcionalidade">
          <div class="icon_funcionalidade">👥</div>
          <h3>Gestão de Usuários</h3>
          <p>Controle de permissões e perfis de acesso para diferentes tipos de usuários do sistema</p>
        </div>

        <div class="card_funcionalidade">
          <div class="icon_funcionalidade">📊</div>
          <h3>Relatórios e Análises</h3>
          <p>Gráficos e relatórios detalhados sobre uso, consumo e padrões de EPIs na instituição</p>
        </div>

        <div class="card_funcionalidade">
          <div class="icon_funcionalidade">🏢</div>
          <h3>Gestão de Fornecedores</h3>
          <p>Cadastro e rastreamento de fornecedores, histórico de compras e avaliação de performance</p>
        </div>

        <div class="card_funcionalidade">
          <div class="icon_funcionalidade">📱</div>
          <h3>API de Integração</h3>
          <p>Integração com seus sistemas existentes através de API robusta e documentada</p>
        </div>
      </div>
    </section>
                                                               

  </div>                                                                           <!-- fecha a div principal -->
<Footer />
</template>          

<script setup>
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';
</script>


<style scoped>   
* {
  box-sizing: border-box;                                                        
  margin: 0;                                                                     
  padding: 0;                                                                    
}                                                                  

/* estilo do <div class="home"> */
.home {
  max-width: auto;
  margin: auto;
  padding: var(--spacing-2xl);
  background-color: var(--background-light);
}

/* estilo do <section class="home__hero"> */
.home__hero {
  display: flex;                                                                   /* texto e imagem lado a lado */
  align-items: center;                                                             /* centraliza verticalmente */
  gap: 2rem;                                                                       /* espaço entre texto e imagem */
  margin-bottom: 3rem;                                                             /* espaço abaixo da seção */
}

.home__menu {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 0;
  margin-bottom: var(--spacing-3xl);
  margin-left: calc(-50vw + 50%);
  position: relative;
  background-color: var(--background-light);
}

.home__hero-texto { flex: 1; }                                                    /* ocupa metade do espaço */
.home__hero-imagem { 
  width: 80%;
  display: flex;
  justify-content: center;
}

/* estilo do <h1> dentro de .home__menu-texto */
.home__menu-texto h1 {
  font-size: 3rem;
  font-family: var(--font-family-heading);
  font-weight: var(--font-weight-bold);
  color: var(--text-primary);
  margin-bottom: var(--spacing-2xl);
}

/* estilo do <p> dentro de .home__menu-texto */
.home__menu-texto p {
  font-size: 1.5rem;
  color: var(--text-secondary);
  line-height: 1.7;
  margin-bottom: 2em;
}

/* estilo do <img class="home__hero-img"> */
.home__hero-img {
  width: 100%;
  height: auto;
  border-radius: 5rem;     
}

/* estilo do <section class="home__cards"> */
.home__cards {
  display: grid;                                                                   /* organiza os cards em grade */
  grid-template-columns: repeat(3, 1fr);                                           /* cria 3 colunas de tamanho igual */
  gap: 5rem;                                                                     /* espaço entre os cards */
  margin-bottom: 3rem;                                                             /* espaço abaixo da seção */
  margin-left: auto;                                                               /* margem esquerda automática */
  margin-right: auto;                                                              /* margem direita automática */
}

/* estilo do <div class="card"> */
.card, .card3 {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: var(--spacing-2xl);
  background: white;
  border: 1px solid var(--border-color);
  border-radius: var(--radius-lg);
  min-height: 500px;
  justify-content: space-between;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card3:hover {
  transform: translateY(-10px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.card2:hover {
  transform: translateY(-10px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.card:hover {
  transform: translateY(-10px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.card2 {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: var(--spacing-2xl);
  background: var(--text-primary);
  border: 1px solid white;
  border-radius: var(--radius-lg);
  min-height: 500px;
  justify-content: space-between;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

/* estilo do <div class="card card--alerta"> */
.card--alerta {
  border-color: #F97316;                                                           /* troca a borda para laranja */
  background: #FFF7ED;                                                             /* fundo laranja bem claro */
}

/* estilo do <span class="card__icone"> */
.card__icone {
  font-size: 32px;                                                                 /* tamanho do emoji/ícone */
  margin-bottom: 8px;                                                              /* espaço abaixo do ícone */
}

/* estilo do <span class="card__numero"> */
.card__numero1, .card__numero2, .card__numero3 {
  font-size: 2rem;
  font-weight: var(--font-weight-bold);
  color: var(--text-primary);
}

/* estilo do <span class="card__label"> */
.card__label {
  font-size: 2rem;
  color: var(--text-primary);
  margin-top: var(--spacing-xl);
  line-height: 1.8;
}

/* estilo do <section class="home__instrucoes"> */
.home__instrucoes {
  margin-bottom: 4rem;                                                             /* espaço abaixo da seção */
}

/* estilo do <h2 class="home__instrucoes-titulo"> */
.home__instrucoes-titulo {
  font-size: 22px;                                                                 /* tamanho do título da seção */
  color: #1E3A5F;                                                                  /* azul escuro */
  margin-bottom: 1.5rem;                                                           /* espaço abaixo do título */
  text-align: center;                                                              /* centraliza o texto */
}

/* estilo do <div class="home__passos"> */
.home__passos {
  display: grid;                                                                   /* organiza os passos em grade */
  grid-template-columns: repeat(4, 1fr);                                           /* 4 colunas de tamanho igual */
  gap: 1.5rem;                                                                     /* espaço entre os passos */
}

/* estilo do <div class="passo"> */
.passo {
  padding: 1.5rem;                                                                 /* espaço interno */
  background: #F8FAFC;                                                             /* fundo cinza claro */
  border-radius: 12px;                                                             /* cantos arredondados */
  border-left: 4px solid #F97316;                                                  /* barra laranja à esquerda */
  border-radius: 0 12px 12px 0;                                                    /* arredonda só os cantos da direita */
}

/* estilo do <span class="passo__numero"> */
.passo__numero {
  display: inline-block;                                                           /* permite definir largura e altura */
  width: 28px;                                                                     /* largura do círculo */
  height: 28px;                                                                    /* altura do círculo */
  border-radius: 50%;                                                              /* transforma em círculo */
  background: #F97316;                                                             /* fundo laranja */
  color: #fff;                                                                     /* número branco */
  text-align: center;                                                              /* centraliza o número */
  line-height: 28px;                                                               /* alinha o número verticalmente */
  font-weight: 700;                                                                /* número em negrito */
  font-size: 14px;                                                                 /* tamanho do número */
  margin-bottom: 10px;                                                             /* espaço abaixo do círculo */
}

/* estilo do <h3> dentro de .passo */
.passo h3 {
  font-size: 15px;                                                                 /* tamanho do título do passo */
  color: #1E3A5F;                                                                  /* azul escuro */
  margin: 0 0 6px;                                                                 /* espaço abaixo do título */
}

/* estilo do <p> dentro de .passo */
.passo p {
  font-size: 13px;                                                                 /* tamanho do texto */
  color: #555;                                                                     /* cinza médio */
  line-height: 1.6;                                                                /* espaço entre as linhas */
  margin: 0;                                                                       /* remove margem padrão */
}

.home_menu_info-texto {
  display: flex;                                                                   /* texto e imagem lado a lado */
  align-items: center;                                                             /* centraliza verticalmente */
  justify-content: center;                                                         /* centraliza horizontalmente */
  background-color: #555;                                                            /* centraliza verticalmente */
  gap: 2rem;                                                                       /* espaço entre texto e imagem */
  margin-bottom: 3rem;                                                             /* espaço abaixo da seção */
}

/* Linha divisória entre seções */
.section__divider {
  width: 80%;
  height: 2px;
  background: linear-gradient(to right, transparent, var(--text-primary), transparent);
  margin: var(--spacing-2xl) auto;
}

/* Estilos para Cards de Funcionalidades */
.Cards_funcionalidades {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--spacing-3xl);
  margin-bottom: var(--spacing-3xl);
  margin-top: var(--spacing-3xl);
}

.first_card_funcionalidades {
  width: 100%;
  text-align: center;
}

.first_card_funcionalidades h1 {
  font-size: 2.5rem;
  font-family: var(--font-family-heading);
  font-weight: var(--font-weight-bold);
  color: var(--text-primary);
  margin-bottom: var(--spacing-xl);
}

.funcionalidades_grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--spacing-2xl);
  width: 100%;
}

.card_funcionalidade {
  background: white;
  border: 1px solid var(--border-color);
  border-radius: var(--radius-lg);
  padding: var(--spacing-2xl);
  text-align: center;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card_funcionalidade:hover {
  transform: translateY(-10px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.icon_funcionalidade {
  font-size: 3rem;
  margin-bottom: var(--spacing-xl);
}

.card_funcionalidade h3 {
  font-size: 1.5rem;
  font-family: var(--font-family-heading);
  font-weight: var(--font-weight-bold);
  color: var(--text-primary);
  margin-bottom: var(--spacing-xl);
}

.card_funcionalidade p {
  font-size: 1rem;
  color: var(--text-secondary);
  line-height: 1.6;
}

.home__menu-texto {
  margin-left: 10rem;
  font-size: 1.75rem;
  width: 100%;
}

.button_Comece_agora {
  background-color: var(--primary);
  width: 10rem;
  height: 3rem;
  border-radius: var(--radius-md);
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.25rem;
  font-weight: var(--font-weight-bold);
  cursor: pointer;
  text-decoration: none;
  color: var(--text-primary);
  border: none;
  transition: background 0.2s;
}

.button_Comece_agora:hover {
  background-color: var(--primary-dark);
}                  



.card__label1 {
  font-size: 1.25rem;
  color: var(--text-primary);
  margin-top: var(--spacing-xl);
}

.card__label2 {
  font-size: 1.25rem;
  color: var(--text-primary);
  margin-top: var(--spacing-md);
}

.card__label3 {
  font-size: 1.25rem;
  color: var(--text-primary);
  margin-top: var(--spacing-md);
}

.card2 .card__numero2,
.card2 .card__valor1,
.card2 .card__valor4,
.card2 .card__label1,
.card2 .card__label2,
.card2 .card__label3 {
  color: white;
  font-size: 1.25rem;
}

.card .card__valor1 {
  color: var(--text-primary);
  font-size: 2rem;
  font-weight: var(--font-weight-bold);
}

.card3 .card__valor1 {
  color: var(--text-primary);
  font-size: 2rem;
  font-weight: var(--font-weight-bold);
}

.card__preco {
  display: flex;
  align-items: baseline;
  justify-content: center;
  gap: var(--spacing-sm);
  flex-wrap: nowrap;
  white-space: nowrap;
}

.button_solicitar_orcamento1, .button_solicitar_orcamento3 {
  background-color: var(--primary);
  width: 10rem;
  height: 3rem;
  border-radius: var(--radius-md);
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.25rem;
  font-weight: var(--font-weight-bold);
  cursor: pointer;
  text-decoration: none;
  color: var(--text-primary);
  border: none;
  transition: background 0.2s;
  margin-top: var(--spacing-2xl);
}

.button_solicitar_orcamento1:hover,
.button_solicitar_orcamento3:hover {
  background-color: var(--primary-dark);
}

.button_solicitar_orcamento2 {
  background-color: white;
  width: 10rem;
  height: 3rem;
  border-radius: var(--radius-md);
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.25rem;
  font-weight: var(--font-weight-bold);
  cursor: pointer;
  text-decoration: none;
  color: var(--text-primary);
  border: 1px solid var(--text-primary);
  transition: background 0.2s;
  margin-top: var(--spacing-xl);
}

.button_solicitar_orcamento2:hover {
  background-color: var(--background);
}

/* Media queries para responsividade */
@media (max-width: 768px) {
  .home__menu {
    flex-direction: column;
    align-items: center;
    gap: 2rem;
  }

  .home__menu-texto {
    margin-left: 0;
    text-align: center;
  }

  .home__hero-imagem {
    width: 80%;
  }

  .home__cards {
    grid-template-columns: 1fr;
    gap: 2rem;
  }

  .Cards_funcionalidades {
    flex-direction: column;
    align-items: center;
    gap: 2rem;
  }

  .funcionalidades_grid {
    grid-template-columns: 1fr;
    gap: 2rem;
  }

  .first_card_funcionalidades h1 {
    font-size: 1.75rem;
  }

}

</style>                                                                           
