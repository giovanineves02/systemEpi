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

    <!-- ========== CARDS DE RESUMO ========== -->
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
    </section>                                                                     <!-- fecha a seção de cards -->

    <!-- ========== COMO USAR ========== -->
    <section class="home__instrucoes">                                            <!-- seção com os 4 passos de uso -->

      <h2 class="home__instrucoes-titulo">Como usar o sistema</h2>               <!-- título da seção -->

      <div class="home__passos">                                                  <!-- grade com os 4 passos -->

        <div class="passo">                                                        <!-- passo 1 -->
          <span class="passo__numero">1</span>                                    <!-- círculo com o número -->
          <h3>Cadastre os colaboradores</h3>                                      <!-- título do passo -->
          <p>Acesse o menu Colaboradores e registre cada funcionário com seus dados.</p> <!-- descrição -->
        </div>                                                                     <!-- fecha o passo 1 -->

        <div class="passo">                                                        <!-- passo 2 -->
          <span class="passo__numero">2</span>                                    <!-- círculo com o número -->
          <h3>Cadastre os EPIs</h3>                                               <!-- título do passo -->
          <p>Vá em Equipamentos e adicione os EPIs disponíveis com validade e quantidade.</p> <!-- descrição -->
        </div>                                                                     <!-- fecha o passo 2 -->

        <div class="passo">                                                        <!-- passo 3 -->
          <span class="passo__numero">3</span>                                    <!-- círculo com o número -->
          <h3>Registre as entregas</h3>                                           <!-- título do passo -->
          <p>Em Entregas, vincule o EPI ao colaborador e registre a data de entrega.</p> <!-- descrição -->
        </div>                                                                     <!-- fecha o passo 3 -->

        <div class="passo">                                                        <!-- passo 4 -->
          <span class="passo__numero">4</span>                                    <!-- círculo com o número -->
          <h3>Acompanhe os relatórios</h3>                                        <!-- título do passo -->
          <p>Monitore validades e histórico de entregas pelo menu Relatórios.</p> <!-- descrição -->
        </div>                                                                     <!-- fecha o passo 4 -->

      </div>                                                                       <!-- fecha a grade de passos -->

    </section>                                                                     <!-- fecha a seção de instruções -->

  </div>                                                                           <!-- fecha a div principal -->

</template>          

<script setup>
import Header from '../components/Header.vue';
</script>


<style scoped>   
* {
  box-sizing: border-box;                                                        /* inclui padding e border na largura total */
  margin: 0;                                                                      /* remove margens padrão */
  padding: 0;                                                                     /* remove espaçamento interno padrão */
}                                                                  /* CSS só vale neste componente */

/* estilo do <div class="home"> */
.home {
  max-width: auto;                                                               /* largura máxima da página */
  margin: auto;                                                                  /* centraliza na tela */
  padding: 2rem;     
  background-color: #FFFDF2;                                                              /* espaço interno */
}

/* estilo do <section class="home__hero"> */
.home__hero {
  display: flex;                                                                   /* texto e imagem lado a lado */
  align-items: center;                                                             /* centraliza verticalmente */
  gap: 2rem;                                                                       /* espaço entre texto e imagem */
  margin-bottom: 3rem;                                                             /* espaço abaixo da seção */
}

.home__menu {
  display: flex;                                                                   /* texto e imagem lado a lado */
  align-items: center;                                                             /* centraliza verticalmente */
  justify-content: space-between;                                                  /* texto à esquerda, imagem à direita */
  gap: 0;                                                                          /* sem espaço entre texto e imagem */
  margin-bottom: 3rem;                                                             /* espaço abaixo da seção */
                                                                   /* largura total da viewport */
  margin-left: calc(-50vw + 50%);                                                  /* centraliza o full width */
  position: relative;  
  background-color: #FFFDF2;                                                            /* para posicionamento */
}

.home__hero-texto { flex: 1; }                                                    /* ocupa metade do espaço */
.home__hero-imagem { 
  margin-left: 20rem ;
  width: 180rem;   
}

/* estilo do <h1> dentro de .home__menu-texto */
.home__menu-texto h1 {
  font-size: 4rem;                                                                 /* tamanho do título */
  color: #000000;                                                                  /* azul escuro institucional */
  margin-bottom: 1rem;                                                             /* espaço aumentado abaixo do título */
}

/* estilo do <p> dentro de .home__menu-texto */
.home__menu-texto p {
  font-size: 2rem;                                                                 /* tamanho do texto */
  color: #000000;                                                                     /* cinza médio */
  line-height: 1.7;                                                                /* espaço entre linhas */
  margin-bottom: 2em;                                                           /* espaço aumentado abaixo do parágrafo */
}

/* estilo do <img class="home__hero-img"> */
.home__hero-img {
  width: 50rem;                                                                     /* ocupa 80% da largura do bloco */
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
  display: flex;                                                                   /* empilha os filhos */
  flex-direction: column;                                                          /* ícone, número e label um abaixo do outro */
  align-items: center;                                                             /* centraliza horizontalmente */
  padding: 1.5rem;                                                                 /* espaço interno do card */
  background: #ffffff;                                                             /* fundo branco */
  border: 1px solid #E2E8F0;                                                       /* borda cinza clara */
  border-radius: 12px;                                                             /* cantos arredondados */
  min-height: 500px;                                                               /* altura mínima para alinhar botões */
  justify-content: space-between;                                                  /* distribui espaço entre elementos */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);                                       /* sombra suave */
}

.card2 {
  display: flex;                                                                   /* empilha os filhos */
  flex-direction: column;                                                          /* ícone, número e label um abaixo do outro */
  align-items: center;                                                             /* centraliza horizontalmente */
  padding: 1.5rem;                                                                 /* espaço interno do card */
  background: #000000;                                                             /* fundo branco */
  border: 1px solid #ffffff;                                                       /* borda cinza clara */
  border-radius: 12px;    
  min-height: 500px;                                                               /* altura mínima para alinhar botões */
  justify-content: space-between;                                                  /* distribui espaço entre elementos */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);                                       /* sombra mais intensa para card escuro */
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
  font-size: 2rem;                                                                 /* número grande em destaque */
  font-weight: 700;                                                                /* número em negrito */
  color: #000000;                                                                  /* azul escuro */
}

/* estilo do <span class="card__label"> */
.card__label {
  font-size: 2rem;                                                                 /* texto maior */
  color: #000000;                                                                     /* cinza médio */
  margin-top: 10px;                                                                /* espaço aumentado acima do texto */
  line-height: 1.8;                                                                /* espaçamento entre linhas */
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

.home__menu-texto {
  margin-left: 10rem; 
  font-size: 1.75rem;
  width: 100%;

    
}        
.button_Comece_agora {
  background-color: #000000;
  width: 10rem;
  height: 3rem;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.25rem;
  cursor: pointer;
  text-decoration: none;
  color: white;

}                  



.card__label1 {
  font-size: 2rem;
  color: #000000;
  margin-top: 4rem;
  gap:  1.75rem;
}

.card__label2 {
  font-size: 2rem;
  color: #000000;
  margin-top: 10px;
  gap:  1.75rem;
}
.card__label3 {
  font-size: 2rem;
  color: #000000;
  margin-top: 10px;
  gap: 1.75rem;
}

.card2 .card__numero2,
.card2 .card__valor1,
.card2 .card__valor4,
.card2 .card__label1,
.card2 .card__label2,
.card2 .card__label3 {
  color: #ffffff;
  font-size: 2rem;
}

.card .card__valor1 {
  color: #000000;
  font-size: 2rem;
}
.card3 .card__valor1 {
  color: #000000;
  font-size: 2rem;
}

.card__preco {
  display: flex;
  align-items: baseline;
  justify-content: center;
  gap: 0.2rem;
  flex-wrap: nowrap;
  white-space: nowrap;
}

.button_solicitar_orcamento1 , .button_solicitar_orcamento3{
  background-color: #000000;
  width: 10rem;
  height: 3rem;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.25rem;
  cursor: pointer;
  text-decoration: none;
  color: white;
    margin-top: 3rem;
}

.button_solicitar_orcamento2 {
  background-color: #ffffff;
  width: 10rem;
  height: 3rem;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 1.25rem;
  cursor: pointer;
  text-decoration: none;
  color: rgb(0, 0, 0);
  gap: 2rem;
  margin-top: 2rem;
}

</style>                                                                           
