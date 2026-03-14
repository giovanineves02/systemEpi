<template>                                                                         <!-- bloco obrigatório que envolve o HTML do componente Vue -->
<Header />            
  <div class="home">                                                               <!-- div principal que centraliza o conteúdo -->

    <!-- ========== HERO ========== -->

    <section class="home_menu_info">
        <div class="home_menu_info-texto">
            <h2>PAINEL</h2>
        </div>
       
    </section>
    <section class="home__menu">                                                   <!-- seção com título, texto e imagem -->

      <div class="home__menu-texto">            
                    
                                                                                 <!-- título principal da página -->
        <p>Gerencie os EPIs dos seus colaboradores de forma simples e segura.</p> <!-- texto de apresentação -->
      </div>                                                                       <!-- fecha o bloco de texto -->

      <div class="home__hero-imagem">                                             <!-- lado direito: imagem ilustrativa -->
        <img                                                                       
          src="../assets/hero.png"                                               
          alt="Ilustração de gestão de EPI"                                        
          class="home__hero-img"                                                   
        />                                                                         <!-- tag img não tem fechamento -->
      </div>                                                                       <!-- fecha o bloco de imagem -->

    </section>                                                                     <!-- fecha a seção hero -->

    <!-- ========== CARDS DE RESUMO ========== -->
    <section class="home__cards">                                                  <!-- seção com os 4 cards de números -->

      <div class="card">                                                           <!-- card: total de EPIs -->
        <span class="card__icone">🪖</span>                                       <!-- ícone do card -->
        <span class="card__numero">124</span>                                     <!-- número em destaque -->
        <span class="card__label">Total de EPIs</span>                            <!-- legenda do número -->
      </div>                                                                       <!-- fecha o card -->

      <div class="card">                                                           <!-- card: colaboradores -->
        <span class="card__icone">👷</span>                                       <!-- ícone do card -->
        <span class="card__numero">48</span>                                      <!-- número em destaque -->
        <span class="card__label">Colaboradores</span>                            <!-- legenda do número -->
      </div>                                                                       <!-- fecha o card -->

      <div class="card">                                                           <!-- card: entregas realizadas -->
        <span class="card__icone">📦</span>                                       <!-- ícone do card -->
        <span class="card__numero">89</span>                                      <!-- número em destaque -->
        <span class="card__label">Entregas realizadas</span>                      <!-- legenda do número -->
      </div>                                                                       <!-- fecha o card -->

      <div class="card card--alerta">                                             <!-- card: EPIs vencendo (com destaque laranja) -->
        <span class="card__icone">⚠️</span>                                       <!-- ícone de alerta -->
        <span class="card__numero">7</span>                                       <!-- número em destaque -->
        <span class="card__label">EPIs vencendo</span>                            <!-- legenda do número -->
      </div>                                                                       <!-- fecha o card de alerta -->

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


<style scoped>                                                                     /* CSS só vale neste componente */

/* estilo do <div class="home"> */
.home {
  max-width: 1100px;                                                               /* largura máxima da página */
  margin: 0 auto;                                                                  /* centraliza na tela */
  padding: 2rem;                                                                   /* espaço interno */
}

/* estilo do <section class="home__hero"> */
.home__hero {
  display: flex;                                                                   /* texto e imagem lado a lado */
  align-items: center;                                                             /* centraliza verticalmente */
  gap: 2rem;                                                                       /* espaço entre texto e imagem */
  margin-bottom: 3rem;                                                             /* espaço abaixo da seção */
}

.home__hero-texto { flex: 1; }                                                    /* ocupa metade do espaço */
.home__hero-imagem { flex: 1; }                                                   /* ocupa metade do espaço */

/* estilo do <h1> dentro de .home__hero-texto */
.home__hero-texto h1 {
  font-size: 28px;                                                                 /* tamanho do título */
  color: #1E3A5F;                                                                  /* azul escuro institucional */
  margin-bottom: 1rem;                                                             /* espaço abaixo do título */
}

/* estilo do <p> dentro de .home__hero-texto */
.home__hero-texto p {
  font-size: 15px;                                                                 /* tamanho do texto */
  color: #555;                                                                     /* cinza médio */
  line-height: 1.7;                                                                /* espaço entre linhas */
}

/* estilo do <img class="home__hero-img"> */
.home__hero-img {
  width: 100%;                                                                     /* ocupa toda a largura do bloco */
  border-radius: 12px;                                                             /* cantos arredondados */
}

/* estilo do <section class="home__cards"> */
.home__cards {
  display: grid;                                                                   /* organiza os cards em grade */
  grid-template-columns: repeat(4, 1fr);                                           /* cria 4 colunas de tamanho igual */
  gap: 1.5rem;                                                                     /* espaço entre os cards */
  margin-bottom: 3rem;                                                             /* espaço abaixo da seção */
}

/* estilo do <div class="card"> */
.card {
  display: flex;                                                                   /* empilha os filhos */
  flex-direction: column;                                                          /* ícone, número e label um abaixo do outro */
  align-items: center;                                                             /* centraliza horizontalmente */
  padding: 1.5rem;                                                                 /* espaço interno do card */
  background: #ffffff;                                                             /* fundo branco */
  border: 1px solid #E2E8F0;                                                       /* borda cinza clara */
  border-radius: 12px;                                                             /* cantos arredondados */
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
.card__numero {
  font-size: 28px;                                                                 /* número grande em destaque */
  font-weight: 700;                                                                /* número em negrito */
  color: #1E3A5F;                                                                  /* azul escuro */
}

/* estilo do <span class="card__label"> */
.card__label {
  font-size: 13px;                                                                 /* texto pequeno */
  color: #555;                                                                     /* cinza médio */
  margin-top: 4px;                                                                 /* espaço acima do texto */
}

/* estilo do <section class="home__instrucoes"> */
.home__instrucoes {
  margin-bottom: 3rem;                                                             /* espaço abaixo da seção */
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


</style>                                                                           /* fecha o bloco de estilo */
