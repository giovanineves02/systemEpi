<template>                                                                         <!-- bloco obrigatório que envolve o HTML do componente Vue -->

  <footer class="footer">                                                       
    <div class="footer__content">
      <div class="footer__redes-sociais">
        <h4>Redes Sociais</h4>
        <div class="redes__icons">
          <a href="https://www.linkedin.com/in/giovani-da-silva-neves" target="_blank" rel="noopener noreferrer" class="icon__link">
            <svg class="icon" viewBox="0 0 24 24" fill="currentColor">
              <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/>
            </svg>
          </a>
          <a href="https://www.instagram.com" target="_blank" rel="noopener noreferrer" class="icon__link">
            <svg class="icon" viewBox="0 0 24 24" fill="currentColor">
              <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zM5.838 12c0-3.403 2.759-6.162 6.162-6.162s6.162 2.759 6.162 6.162c0 3.403-2.759 6.162-6.162 6.162s-6.162-2.759-6.162-6.162zm3.35 0c0 1.557 1.255 2.812 2.812 2.812s2.812-1.255 2.812-2.812c0-1.557-1.255-2.812-2.812-2.812s-2.812 1.255-2.812 2.812zm8.715-6.423c0 .795.645 1.44 1.44 1.44s1.44-.645 1.44-1.44-.645-1.44-1.44-1.44-1.44.645-1.44 1.44z"/>
            </svg>
          </a>
        </div>
      </div>

      <div class="footer__contato">
        <h4>Entre em Contato</h4>
        <h6>contato@sistemepi.com.br</h6>
      </div>
    </div>

    <div class="footer__copy">                                                     <!-- bloco de copyright — ocupa linha inteira -->
      <p>© 2026 Sistema de Gestão de EPI — Todos os direitos reservados</p>       <!-- texto de direitos autorais -->
    </div>                                                                         <!-- fecha o bloco de copyright -->

  </footer>                                                                        <!-- fecha o rodapé -->

</template> 

<script>
import { ref } from 'vue';

export default {
  name: 'Footer',
  setup() {
    const email = ref('');

    const enviarEmail = () => {
      console.log('E-mail para contato:', email.value);
      alert('Obrigado! Entraremos em contato em breve.');
      email.value = '';
    };

    return {
      email,
      enviarEmail
    };
  }
};
</script>


<style scoped> 
.footer {
  display: flex;                                                                   /* blocos lado a lado */
  flex-direction: column;                                                          /* organiza em coluna */
  gap: 2rem;                                                                       /* espaço entre blocos */
  padding: 2rem;                                                                   /* espaço interno do footer */
  background: #FFCC00;                                                             /* fundo amarelo */
  color: #ffffff;                                                                  /* texto branco */
}

/* Container para redes sociais e contato */
.footer__content {
  display: flex;                                                                   /* lado a lado */
  justify-content: space-around;                                                   /* espaço distribuído */
  align-items: flex-start;                                                         /* alinha pelo topo */
  gap: 3rem;                                                                       /* espaço entre as seções */
  flex-wrap: wrap;                                                                 /* quebra em telas pequenas */
}

/* Seção de Redes Sociais */
.footer__redes-sociais {
  display: flex;                                                                   /* título e ícones em coluna */
  flex-direction: column;                                                          
  align-items: center;                                                             /* centraliza */
  gap: 1rem;  
  margin-right: 50%;                                                                     
}

.redes__icons {
  display: flex;                                                                   /* ícones em linha */
  gap: 1.5rem;                                                                     /* espaço entre os ícones */
}

.icon__link {
  display: flex;                                                                   /* centraliza o ícone */
  align-items: center;
  justify-content: center;
  width: 40px;                                                                     /* tamanho do ícone */
  height: 40px;                                                                    
  border-radius: 50%;                                                              /* deixa circular */
  background: #FFCC00;                                                             /* fundo preto */
  color: #000000;                                                                  /* ícone em amarelo */
  transition: all 0.3s ease;                                                      /* transição suave */
  text-decoration: none;
}

.icon__link:hover {
  transform: scale(1.1);                                                           /* aumenta o ícone */
}

.icon {
  width: 24px;                                                                     /* tamanho do SVG */
  height: 24px;
  background-color: #ffffff;
}

/* Seção de Contato */
.footer__contato {
  display: flex;                                                                   /* título e formulário em coluna */
  flex-direction: column;
  align-items: center;
  gap: 1rem;
}

.email__form {
  display: flex;                                                                   /* input e botão lado a lado */
  gap: 0.5rem;
  width: 100%;
  max-width: 300px;
}

.email__input {
  flex: 1;                                                                         /* ocupa espaço disponível */
  padding: 0.75rem;                                                                /* espaço interno */
  border: 1px solid #000000;                                                       /* borda preta */
  border-radius: 4px;                                                              /* cantos levemente arredondados */
  font-size: 14px;
  color: #000000;
  background: #ffffff;
}

.email__input::placeholder {
  color: #999999;
}

.email__input:focus {
  outline: none;
  border-color: #000000;
  box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
}

.email__botao {
  padding: 0.75rem 1.5rem;
  background: #000000;
  color: #FFCC00;
  border: none;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.email__botao:hover {
  background: #333333;
  transform: scale(1.05);
}

/* estilo dos <h4> dentro do footer */
.footer h4 {
  font-size: 14px;                                                                 /* tamanho do título do bloco */
  margin: 0;                                                                       /* remove margem */
  color: #000000;                                                                  /* preto */
  font-weight: 600;
}

/* estilo dos <h6> dentro do footer */
.footer h6 {
  font-size: 13px;                                                                 /* tamanho do e-mail */
  margin: 0;                                                                       /* remove margem */
  color: #000000;                                                                  /* preto */
  font-weight: 400;
}

/* estilo dos <p> e <a> dentro do footer */
.footer p,
.footer a {
  font-size: 13px;                                                                 /* tamanho do texto e links */
  color: #000000;                                                                  /* preto */
  text-decoration: none;                                                           /* remove sublinhado dos links */
  margin: 0;                                                                       /* remove margem padrão */
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
  border-top: 1px solid #000000;                                                   /* linha separadora acima */
  padding-top: 1rem;                                                               /* espaço acima do texto */
}

/* Responsividade */
@media (max-width: 768px) {
  .footer__content {
    flex-direction: column;
    align-items: center;
    gap: 2rem;
  }

  .email__form {
    flex-direction: column;
    width: 100%;
  }

  .email__input,
  .email__botao {
    width: 100%;
  }

  .footer {
    padding: 1.5rem;
  }
}

</style>                                                                           /* fecha o bloco de estilo */
