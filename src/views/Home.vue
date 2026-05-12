<template>
  <Header />
  <div class="home">
    <!-- ========== HERO SECTION ========== -->
    <section class="hero">
      <div class="hero__container">
        <div class="hero__content">
          <h1 class="hero__title">
            Sistema de Controle de EPIs<br />
            <span class="hero__subtitle">para Instituições de Ensino</span>
          </h1>
          <p class="hero__description">
            Gerencie entregas, validade e rastreabilidade de equipamentos de proteção 
            individual de forma simples, eficiente e segura.
          </p>
          <router-link to="/login">
            <button class="btn-main-cta">Comece agora</button>
          </router-link>
        </div>

        <div class="hero__image-wrapper">
          <img src="../assets/landing.png" alt="Gestão de EPI" class="hero__img" />
        </div>
      </div>
    </section>

    <div class="section__divider"></div>

    <!-- ========== PRICING SECTION ========== -->
    <section class="pricing">
      <div class="section-header">
        <h2 class="section__title">Nossos Planos</h2>
      </div>
      <div class="pricing__grid">
        
        <!-- Card Inicial -->
        <div class="price-card">
          <div class="card-header">
            <h3>Inicial</h3>
            <div class="price-box">
              <span class="currency">R$</span>
              <span class="amount">50</span>
              <span class="period">/mês</span>
            </div>
          </div>
          <ul class="card-features">
            <li>Lançamento de EPI</li>
            <li>Notificação de vencimento</li>
            <li>Lançamento de fornecedores</li>
          </ul>
          <button class="btn-plan-yellow">Assinar Agora</button>
        </div>

        <!-- Card Intermediário (Destaque Dark) -->
        <div class="price-card featured-dark">
          <div class="card-header">
            <h3>Intermediário</h3>
            <div class="price-box">
              <span class="currency">R$</span>
              <span class="amount">150</span>
              <span class="period">/mês</span>
            </div>
          </div>
          <ul class="card-features">
            <li>Lançamento de EPI</li>
            <li>Notificação de vencimento</li>
            <li>Lançamento de fornecedores</li>
            <li>API de Integração</li>
          </ul>
          <button class="btn-plan-white">Assinar Agora</button>
        </div>

        <!-- Card Avançado -->
        <div class="price-card">
          <div class="card-header">
            <h3>Avançado</h3>
            <div class="price-box">
              <span class="currency">R$</span>
              <span class="amount">300</span>
              <span class="period">/mês</span>
            </div>
          </div>
          <ul class="card-features">
            <li>Lançamento de EPI</li>
            <li>Notificação de vencimento</li>
            <li>API de Integração</li>
            <li>16h Treinamento Próprio</li>
          </ul>
          <button class="btn-plan-yellow">Assinar Agora</button>
        </div>
      </div>
    </section>

    <div class="section__divider"></div>

    <!-- ========== FEATURES SECTION (SISTEMA NA PRÁTICA) ========== -->
    <section class="features-section">
      <div class="features-container">
        <div class="features-header">
          <span class="badge">Funcionalidades</span>
          <h2 class="section__title">Sistema na Prática</h2>
          <div class="title-underline"></div>
        </div>

        <div class="features-grid">
          <div class="feat-card" v-for="(f, i) in features" :key="i">
            <div class="feat-icon-wrapper">
              <span class="feat-icon">{{ f.icon }}</span>
            </div>
            <div class="feat-content">
              <h4>{{ f.title }}</h4>
              <p>{{ f.desc }}</p>
            </div>
            <div class="card-glow"></div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <Footer />
</template>

<script setup>
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';

const features = [
  { icon: '📦', title: 'Controle de Estoque', desc: 'Rastreamento inteligente de entrada, saída e níveis críticos em tempo real.' },
  { icon: '⏰', title: 'Alertas Ativos', desc: 'Sistema de notificações automáticas para renovação de CAs e validades.' },
  { icon: '👥', title: 'Gestão de Usuários', desc: 'Controle granular de permissões por departamento ou cargo acadêmico.' },
  { icon: '📊', title: 'Business Intelligence', desc: 'Dashboards completos com métricas de consumo e custo por setor.' },
  { icon: '🏢', title: 'Fornecedores', desc: 'Portal para cotações e histórico de performance de entrega de cada parceiro.' },
  { icon: '📱', title: 'Conectividade API', desc: 'Integre o controle de EPIs ao seu ERP ou sistema acadêmico nativo.' }
];
</script>

<style scoped>
/* --- Configurações Gerais --- */
.home {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
  background-color: var(--background-light);
  overflow-x: hidden;
}

.section__divider {
  width: 100%;
  height: 1px;
  background: linear-gradient(to right, transparent, var(--border-color), transparent);
  margin: 60px 0;
}

.section__title {
  font-size: 2.8rem;
  text-align: center;
  color: var(--text-primary);
  margin-bottom: 20px;
  font-weight: 800;
}

/* --- Hero --- */
.hero { padding: 80px 0; }
.hero__container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 50px;
}
.hero__content { flex: 1; }
.hero__title { font-size: 3.5rem; line-height: 1.1; margin-bottom: 20px; }
.hero__subtitle { font-size: 1.8rem; color: #666; display: block; margin-top: 10px; }
.hero__description { font-size: 1.25rem; color: var(--text-secondary); line-height: 1.6; margin-bottom: 40px; }
.btn-main-cta {
  background-color: var(--primary);
  border: none;
  padding: 18px 40px;
  border-radius: 12px;
  font-weight: 800;
  font-size: 1.1rem;
  cursor: pointer;
  transition: 0.3s;
}
.btn-main-cta:hover { background-color: var(--primary-dark); transform: translateY(-3px); }
.hero__img { width: 100%; max-width: 550px; border-radius: 30px; box-shadow: 0 20px 50px rgba(0,0,0,0.1); }

/* --- Pricing Cards --- */
.pricing__grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  padding: 20px 0;
}
.price-card {
  background: white;
  padding: 45px 35px;
  border-radius: 24px;
  border: 1px solid #eee;
  text-align: center;
  display: flex;
  flex-direction: column;
  transition: 0.3s ease;
  box-shadow: 0 10px 30px rgba(0,0,0,0.05);
}
.price-card:hover { transform: translateY(-10px); }
.featured-dark { background: #1a1a1a; color: white; transform: scale(1.05); border: none; }
.featured-dark .price-box .amount { color: var(--primary); }
.price-box { margin: 30px 0; }
.amount { font-size: 3.5rem; font-weight: 800; }
.currency { font-size: 1.2rem; vertical-align: top; margin-right: 4px; }
.card-features { list-style: none; padding: 0; margin-bottom: 35px; flex-grow: 1; }
.card-features li { margin-bottom: 15px; font-size: 1.1rem; opacity: 0.9; }
.btn-plan-yellow { background: var(--primary); border: none; padding: 15px; border-radius: 10px; font-weight: 700; cursor: pointer; width: 100%; }
.btn-plan-white { background: white; color: #1a1a1a; border: none; padding: 15px; border-radius: 10px; font-weight: 700; cursor: pointer; width: 100%; }

/* --- Features (Sistema na Prática) --- */
.features-section { padding: 80px 0; }
.features-header { text-align: center; margin-bottom: 60px; display: flex; flex-direction: column; align-items: center; }
.badge { background: var(--primary); padding: 6px 16px; border-radius: 50px; font-size: 0.8rem; font-weight: 800; text-transform: uppercase; margin-bottom: 15px; }
.title-underline { width: 60px; height: 5px; background: var(--primary); border-radius: 10px; margin-top: 10px; }
.features-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 30px; }
.feat-card {
  position: relative;
  background: white;
  padding: 40px;
  border-radius: 28px;
  border: 1px solid #f0f0f0;
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  overflow: hidden;
}
.feat-card:hover { transform: translateY(-12px); border-color: var(--primary); box-shadow: 0 20px 40px rgba(255, 204, 0, 0.15); }
.feat-icon-wrapper {
  width: 65px;
  height: 65px;
  background: #fffdf2;
  border-radius: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2rem;
  margin-bottom: 25px;
  transition: 0.3s;
  border: 1px solid #fff2cc;
}
.feat-card:hover .feat-icon-wrapper { background: var(--primary); transform: rotate(-8deg) scale(1.1); }
.feat-content h4 { font-size: 1.4rem; margin-bottom: 15px; font-weight: 700; color: #1a1a1a; }
.feat-content p { color: #666; line-height: 1.6; }
.card-glow { position: absolute; bottom: -20px; right: -20px; width: 80px; height: 80px; background: var(--primary); filter: blur(40px); opacity: 0; transition: 0.4s; }
.feat-card:hover .card-glow { opacity: 0.3; }

/* --- Mobile --- */
@media (max-width: 992px) {
  .hero__container { flex-direction: column; text-align: center; }
  .hero__img { max-width: 100%; }
  .featured-dark { transform: scale(1); }
}
</style>