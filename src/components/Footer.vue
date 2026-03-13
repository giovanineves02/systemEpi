<template>                                                                         <!-- bloco obrigatório que envolve o HTML do componente Vue -->

  <footer class="footer">                                                          <!-- rodapé da página -->

    <div class="footer__contato">                                                  <!-- bloco de contato -->
      <h4>Contato</h4>                                                             <!-- título do bloco -->
      <p>📧 suporte@epi.com</p>                                                   <!-- e-mail de suporte -->
    </div>                                                                         <!-- fecha o bloco de contato -->

    <div class="footer__redes">                                                    <!-- bloco de redes sociais -->
      <h4>Redes sociais</h4>                                                       <!-- título do bloco -->
      <div class="footer__redes-links">                                            <!-- agrupa os links em linha -->
        <a href="#" class="footer__link">LinkedIn</a>                             <!-- link para o LinkedIn -->
        <a href="#" class="footer__link">Instagram</a>                            <!-- link para o Instagram -->
        <a href="#" class="footer__link">Facebook</a>                             <!-- link para o Facebook -->
      </div>                                                                       <!-- fecha os links das redes -->
    </div>                                                                         <!-- fecha o bloco de redes -->

    <div class="footer__copy">                                                     <!-- bloco de copyright — ocupa linha inteira -->
      <p>© 2026 Sistema de Gestão de EPI — Todos os direitos reservados</p>       <!-- texto de direitos autorais -->
    </div>                                                                         <!-- fecha o bloco de copyright -->

  </footer>                                                                        <!-- fecha o rodapé -->

</template>                                                                        <!-- fecha o template -->


<style scoped>                                                                     /* CSS só vale neste componente */

/* estilo do <footer class="footer"> */
.footer {
  display: flex;                                                                   /* blocos lado a lado */
  justify-content: space-between;                                                  /* espaço entre os blocos */
  align-items: flex-start;                                                         /* alinha os blocos pelo topo */
  flex-wrap: wrap;                                                                 /* quebra linha em telas pequenas */
  gap: 2rem;                                                                       /* espaço entre os blocos */
  padding: 2rem;                                                                   /* espaço interno do footer */
  background: #1E3A5F;                                                             /* fundo azul escuro */
  color: #ffffff;                                                                  /* texto branco */
}

/* estilo dos <h4> dentro do footer */
.footer h4 {
  font-size: 14px;                                                                 /* tamanho do título do bloco */
  margin: 0 0 10px;                                                                /* espaço abaixo do título */
  color: #F97316;                                                                  /* laranja para destaque */
}

/* estilo dos <p> e <a> dentro do footer */
.footer p,
.footer a {
  font-size: 13px;                                                                 /* tamanho do texto e links */
  color: #cbd5e1;                                                                  /* cinza claro */
  text-decoration: none;                                                           /* remove sublinhado dos links */
  margin: 0;                                                                       /* remove margem padrão */
}

/* estilo do <a> ao passar o mouse */
.footer a:hover {
  color: #F97316;                                                                  /* laranja ao passar o mouse */
}

/* estilo do <div class="footer__redes-links"> */
.footer__redes-links {
  display: flex;                                                                   /* links das redes em linha */
  gap: 12px;                                                                       /* espaço entre cada link */
}

/* estilo do <div class="footer__copy"> */
.footer__copy {
  width: 100%;                                                                     /* ocupa a linha inteira */
  text-align: center;                                                              /* centraliza o texto */
  border-top: 1px solid #2d4f7c;                                                   /* linha separadora acima */
  padding-top: 1rem;                                                               /* espaço acima do texto */
}

</style>                                                                           /* fecha o bloco de estilo */
