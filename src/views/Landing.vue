<template>                                                                          <!-- bloco obrigatório que envolve o HTML do componente Vue -->

  <header class="navbar">                                                          <!-- faixa do topo da página -->

    <div class="navbar__marca">                                                    <!-- agrupa apenas o logo -->
      <img
        src="../assets/logo.png"                                                   <!-- caminho da imagem do logo -->
        alt="Logo EPI"                                                             <!-- texto se a imagem não carregar -->
        class="navbar__logo"                                                       <!-- classe CSS que define o tamanho do logo -->
      />                                                                           <!-- tag img não tem fechamento -->
    </div>                                                                         <!-- fecha o agrupador do logo -->

    <nav aria-label="Menu principal">                                              <!-- área de navegação, aria-label ajuda leitores de tela -->
      <ul class="navbar__lista">                                                   <!-- lista sem numeração ou bolinhas -->
        <li><RouterLink to="/" class="navbar__link">Dashboard</RouterLink></li>                         <!-- li: item da lista | RouterLink: navega sem recarregar -->
        <li><RouterLink to="/colaboradores" class="navbar__link">Colaboradores</RouterLink></li>        <!-- to: rota definida no router/index.js -->
        <li><RouterLink to="/equipamentos" class="navbar__link">Equipamentos</RouterLink></li>          <!-- to: rota definida no router/index.js -->
        <li><RouterLink to="/entregas" class="navbar__link">Entregas</RouterLink></li>                  <!-- to: rota definida no router/index.js -->
        <li><RouterLink to="/relatorios" class="navbar__link">Relatórios</RouterLink></li>              <!-- to: rota definida no router/index.js -->
      </ul>                                                                        <!-- fecha a lista -->
    </nav>                                                                         <!-- fecha a navegação -->

    <RouterLink to="/login" class="navbar__login">                                 <!-- link que leva para a rota /login -->
      <button type="button" class="navbar__btn">Entrar</button>                   <!-- botão clicável, type="button" evita envio de formulário -->
    </RouterLink>                                                                  <!-- fecha o RouterLink do botão -->

  </header>                                                                        <!-- fecha o header -->
</template>                                                                        <!-- fecha o template -->


<style scoped>                                                                     /* CSS só vale neste componente */

/* estilo do <header class="navbar"> */
.navbar {
  display: flex;                                                                   /* coloca logo, menu e botão em linha */
  align-items: center;                                                             /* centraliza tudo verticalmente */
  justify-content: space-between;                                                  /* espaço entre logo, nav e botão */
  padding: 0 1.5rem;                                                               /* espaço interno nas laterais */
  height: 58px;                                                                    /* altura da navbar */
  background: #ffffff;                                                             /* fundo branco */
  border-bottom: 1px solid #f0ede8;                                                /* linha cinza clara embaixo */
  gap: 1rem;                                                                       /* espaço mínimo entre os blocos */
}

/* estilo do <div class="navbar__marca"> */
.navbar__marca {
  display: flex;                                                                   /* mantém o logo alinhado */
  align-items: center;                                                             /* centraliza verticalmente */
  flex-shrink: 0;                                                                  /* impede que o logo encolha */
}

/* estilo do <img class="navbar__logo"> */
.navbar__logo {
  height: 34px;                                                                    /* altura do logo */
  width: auto;                                                                     /* largura proporcional à altura */
  display: block;                                                                  /* remove espaço extra abaixo da imagem */
}

/* estilo do <ul class="navbar__lista"> */
.navbar__lista {
  display: flex;                                                                   /* itens do menu em linha */
  align-items: center;                                                             /* centraliza verticalmente */
  gap: 2px;                                                                        /* espaço pequeno entre cada item */
  list-style: none;                                                                /* remove a bolinha padrão */
  margin: 0;                                                                       /* remove margem padrão do navegador */
  padding: 0;                                                                      /* remove padding padrão do navegador */
}

/* estilo do <RouterLink class="navbar__link"> — cada link do menu */
.navbar__link {
  display: block;                                                                  /* ocupa toda a área clicável do li */
  padding: 6px 12px;                                                               /* espaço interno do link */
  border-radius: 7px;                                                              /* cantos arredondados */
  font-size: 13.5px;                                                               /* tamanho da letra */
  font-weight: 500;                                                                /* letra levemente grossa */
  color: #6b7280;                                                                  /* cor cinza do texto */
  text-decoration: none;                                                           /* remove o sublinhado */
  letter-spacing: -0.01em;                                                         /* leve ajuste no espaço entre letras */
  transition: background 0.15s, color 0.15s;                                       /* animação suave ao passar o mouse */
  white-space: nowrap;                                                             /* impede quebra de linha no texto */
}

/* <RouterLink> ao passar o mouse */
.navbar__link:hover {
  background: #fef3ea;                                                             /* fundo laranja bem claro */
  color: #c2500a;                                                                  /* texto laranja escuro */
}

/* <RouterLink> da página atual — classe automática do Vue Router */
.navbar__link.router-link-active {
  background: #fff4ed;                                                             /* fundo laranja claro no link ativo */
  color: #ea5b0c;                                                                  /* texto laranja no link ativo */
  font-weight: 600;                                                                /* texto mais grosso na página atual */
}

/* estilo do <RouterLink class="navbar__login"> */
.navbar__login {
  text-decoration: none;                                                           /* remove sublinhado do link externo */
  flex-shrink: 0;                                                                  /* impede que o botão encolha */
}

/* estilo do <button class="navbar__btn"> */
.navbar__btn {
  padding: 7px 18px;                                                               /* espaço interno do botão */
  border-radius: 8px;                                                              /* cantos arredondados */
  border: none;                                                                    /* remove borda padrão */
  background: #ea5b0c;                                                             /* fundo laranja EPI */
  color: #ffffff;                                                                  /* texto branco */
  font-size: 13.5px;                                                               /* tamanho da letra */
  font-weight: 600;                                                                /* texto em negrito */
  letter-spacing: -0.01em;                                                         /* leve ajuste no espaço entre letras */
  cursor: pointer;                                                                 /* cursor de mão ao passar */
  transition: background 0.15s, transform 0.1s;                                    /* animação suave */
}

/* <button> ao passar o mouse */
.navbar__btn:hover {
  background: #d14e09;                                                             /* laranja mais escuro ao passar o mouse */
}

/* <button> ao clicar */
.navbar__btn:active {
  transform: scale(0.97);                                                          /* leve encolhimento ao clicar */
}

</style>                                                                           /* fecha o bloco de estilo */
