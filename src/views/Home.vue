<template>
  <Header />

  <div class="home">
    <!-- ========== HERO SECTION ========== -->
    <section class="hero">
      <div class="hero__container">
        <div class="hero__content">
          <h1 class="hero__title">
            Sistema de Controle de EPIs para Instituições de Ensino
          </h1>
          <p class="hero__description">
            Gerencie entregas, validade e rastreabilidade de equipamentos de proteção
            individual de forma simples, eficiente e segura.
          </p>
          <router-link to="/login2">
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

    <!-- ========== FEATURES SECTION ========== -->
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
/* --- Variáveis de Escopo e Configurações Gerais --- */
.home {
  --spacing-xs: 8px;
  --spacing-sm: 16px;
  --spacing-md: 24px;
  --spacing-lg: 40px;
  --spacing-xl: 60px;
  --spacing-2xl: 80px;
  --radius-sm: 12px;
  --radius-md: 24px;
  --primary: #FFCC00;
  --dark: #1a1a1a;
  --light: #FFFDF2;

  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
  padding: 0 var(--spacing-sm);
  background: linear-gradient(135deg, #ffffff 0%, #fafaf8 50%, #f5f3f0 100%);
  overflow-x: hidden; /* Evita quebras de tela por animações */
}

.section__divider {
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, var(--primary) 20%, var(--primary) 80%, transparent);
  margin: var(--spacing-2xl) 0;
  opacity: 0.5;
}

.section__title {
  font-size: 3rem;
  text-align: center;
  color: var(--dark);
  margin-bottom: var(--spacing-md);
  font-weight: 900;
  letter-spacing: -1px;
  background: linear-gradient(135deg, #1a1a1a 0%, #444 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

/* --- HERO SECTION --- */
.hero {
  padding: 100px 0;
  position: relative;
}

.hero::before {
  content: '';
  position: absolute;
  top: -50%;
  right: -20%;
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, rgba(255, 204, 0, 0.1) 0%, transparent 70%);
  border-radius: 50%;
  pointer-events: none;
}

.hero__container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: var(--spacing-lg);
  position: relative;
  z-index: 1;
}

.hero__content {
  flex: 1;
  animation: slideInLeft 0.8s ease-out;
}

.hero__title {
  font-size: 3.5rem;
  line-height: 1.2;
  margin-bottom: var(--spacing-md);
  font-weight: 900;
  color: var(--dark);
  letter-spacing: -1.5px;
}

.hero__description {
  font-size: 1.2rem;
  color: #555;
  line-height: 1.8;
  margin-bottom: var(--spacing-lg);
  max-width: 500px;
}

.btn-main-cta {
  background: linear-gradient(135deg, #FFCC00 0%, #FFB800 100%);
  color: #000;
  border: none;
  padding: 16px 45px;
  border-radius: 50px;
  font-weight: 800;
  font-size: 1.05rem;
  cursor: pointer;
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  box-shadow: 0 10px 40px rgba(255, 204, 0, 0.3);
  position: relative;
  overflow: hidden;
}

.btn-main-cta:hover {
  transform: translateY(-3px);
  box-shadow: 0 20px 60px rgba(255, 204, 0, 0.4);
}

.hero__image-wrapper {
  flex: 1;
  position: relative;
  animation: slideInRight 0.8s ease-out;
}

.hero__img {
  width: 100%;
  height: auto;
  border-radius: 30px;
  box-shadow: 0 30px 80px rgba(255, 204, 0, 0.25);
  transition: transform 0.4s ease, filter 0.4s ease;
}

.hero__image-wrapper:hover .hero__img {
  transform: scale(1.03);
  filter: brightness(1.02);
}

/* --- PRICING SECTION --- */
.pricing {
  padding: 60px 0;
  position: relative;
}

.pricing::before {
  content: '';
  position: absolute;
  left: -20%;
  bottom: -50%;
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, rgba(255, 204, 0, 0.08) 0%, transparent 70%);
  border-radius: 50%;
  pointer-events: none;
}

.pricing__grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: var(--spacing-lg);
  padding: var(--spacing-md) 0;
  position: relative;
  z-index: 1;
  align-items: center;
}

.price-card {
  background: white;
  padding: 50px 35px;
  border-radius: var(--radius-md);
  border: 2px solid #f0f0f0;
  text-align: center;
  display: flex;
  flex-direction: column;
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  box-shadow: 0 15px 50px rgba(0, 0, 0, 0.05);
}

.price-card:hover {
  transform: translateY(-10px);
  border-color: var(--primary);
  box-shadow: 0 30px 80px rgba(255, 204, 0, 0.2);
}

.featured-dark {
  background: linear-gradient(135deg, #1a1a1a 0%, #2a2a2a 100%);
  color: white;
  border: 2px solid var(--primary);
  box-shadow: 0 30px 80px rgba(255, 204, 0, 0.25);
}

.featured-dark .price-box .amount {
  color: var(--primary);
}

.card-header h3 {
  font-size: 1.6rem;
  margin-bottom: var(--spacing-md);
  font-weight: 800;
}

.price-box {
  margin: var(--spacing-md) 0;
}

.amount {
  font-size: 3.5rem;
  font-weight: 900;
}

.currency {
  font-size: 1.2rem;
  vertical-align: top;
  margin-right: 4px;
}

.period {
  font-size: 0.9rem;
  opacity: 0.8;
  display: block;
}

.card-features {
  list-style: none;
  padding: 0;
  margin-bottom: var(--spacing-lg);
  flex-grow: 1;
  text-align: left;
}

.card-features li {
  margin-bottom: 14px;
  font-size: 0.98rem;
  opacity: 0.85;
  padding-left: 30px;
  position: relative;
  transition: all 0.3s;
}

.card-features li:before {
  content: '✓';
  position: absolute;
  left: 0;
  color: var(--primary);
  font-weight: 900;
  font-size: 1.2rem;
}

.card-features li:hover {
  opacity: 1;
  transform: translateX(5px);
}

.btn-plan-yellow {
  background: linear-gradient(135deg, #FFCC00 0%, #FFB800 100%);
  color: #000;
  border: none;
  padding: var(--spacing-md);
  border-radius: var(--radius-sm);
  font-weight: 800;
  cursor: pointer;
  width: 100%;
  transition: all 0.3s;
  box-shadow: 0 8px 20px rgba(255, 204, 0, 0.3);
}

.btn-plan-yellow:hover {
  transform: scale(1.02);
  box-shadow: 0 12px 30px rgba(255, 204, 0, 0.4);
}

.btn-plan-white {
  background: white;
  color: #1a1a1a;
  border: none;
  padding: var(--spacing-md);
  border-radius: var(--radius-sm);
  font-weight: 800;
  cursor: pointer;
  width: 100%;
  transition: all 0.3s;
}

.btn-plan-white:hover {
  transform: scale(1.02);
  background: #f5f5f5;
}

/* --- FEATURES SECTION --- */
.features-section {
  padding: 60px 0;
  position: relative;
}

.features-header {
  text-align: center;
  margin-bottom: var(--spacing-xl);
  display: flex;
  flex-direction: column;
  align-items: center;
  animation: fadeInDown 0.8s ease-out;
}

.badge {
  background: var(--primary);
  color: #000;
  padding: 8px 18px;
  border-radius: 50px;
  font-size: 0.75rem;
  font-weight: 900;
  text-transform: uppercase;
  margin-bottom: var(--spacing-md);
  letter-spacing: 1px;
}

.title-underline {
  width: 80px;
  height: 5px;
  background: var(--primary);
  border-radius: 10px;
  margin-top: var(--spacing-sm);
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--spacing-lg);
}

.feat-card {
  position: relative;
  background: white;
  padding: 40px;
  border-radius: var(--radius-md);
  border: 1px solid #f0f0f0;
  transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  overflow: hidden;
  box-shadow: 0 15px 50px rgba(0, 0, 0, 0.05);
}

.feat-card:hover {
  transform: translateY(-10px);
  border-color: var(--primary);
  box-shadow: 0 20px 40px rgba(255, 204, 0, 0.15);
}

.feat-icon-wrapper {
  width: 60px;
  height: 60px;
  background: #fffdf2;
  border-radius: 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.8rem;
  margin-bottom: var(--spacing-md);
  transition: 0.3s;
  border: 1px solid #fff2cc;
}

.feat-card:hover .feat-icon-wrapper {
  background: var(--primary);
  transform: rotate(-8deg) scale(1.1);
}

.feat-content h4 {
  font-size: 1.25rem;
  margin-bottom: var(--spacing-sm);
  font-weight: 700;
  color: #1a1a1a;
}

.feat-content p {
  color: #666;
  line-height: 1.6;
  font-size: 0.95rem;
}

.card-glow {
  position: absolute;
  bottom: -20px;
  right: -20px;
  width: 80px;
  height: 80px;
  background: var(--primary);
  filter: blur(40px);
  opacity: 0;
  transition: 0.4s;
}

.feat-card:hover .card-glow {
  opacity: 0.3;
}

/* --- ANIMAÇÕES --- */
@keyframes slideInLeft {
  from { opacity: 0; transform: translateX(-40px); }
  to { opacity: 1; transform: translateX(0); }
}

@keyframes slideInRight {
  from { opacity: 0; transform: translateX(40px); }
  to { opacity: 1; transform: translateX(0); }
}

@keyframes fadeInDown {
  from { opacity: 0; transform: translateY(-20px); }
  to { opacity: 1; transform: translateY(0); }
}

/* ==================== MEDIA QUERIES (RESPONSIVIDADE) ==================== */

/* --- Tablet (Até 1024px) --- */
@media (max-width: 1024px) {
  .home {
    --spacing-lg: 32px;
    --spacing-2xl: 60px;
  }
  .section__title { font-size: 2.4rem; }
  .hero__title { font-size: 2.8rem; }
}

/* --- Mobile (Até 767px) --- */
@media (max-width: 767px) {
  .home {
    --spacing-sm: 12px;
    --spacing-md: 16px;
    --spacing-lg: 24px;
    --spacing-xl: 32px;
    --spacing-2xl: 40px;
    padding: 0 15px;
  }

  .section__divider { margin: var(--spacing-xl) 0; }
  .section__title { font-size: 2rem; }

  /* Hero Mobile */
  .hero { padding: 40px 0; }
  .hero__container {
    flex-direction: column-reverse; /* Imagem vai para cima do texto no mobile */
    text-align: center;
    gap: var(--spacing-lg);
  }
  .hero__title { font-size: 2.2rem; }
  .hero__description { margin: 0 auto var(--spacing-lg) auto; }
  .btn-main-cta { width: 100%; max-width: 300px; }

  /* Pricing Mobile */
  .pricing__grid {
    grid-template-columns: 1fr;
    gap: var(--spacing-md);
  }
  .price-card { padding: 35px 20px; }
  .amount { font-size: 2.8rem; }
  .card-features { text-align: center; }
  .card-features li { padding-left: 0; text-align: center; }
  .card-features li:before { display: none; } /* Remove o check lateral para centralizar melhor no mobile */

  /* Features Mobile */
  .features-grid {
    grid-template-columns: 1fr;
    gap: var(--spacing-md);
  }
  .feat-card { padding: 30px 20px; display: flex; flex-direction: column; align-items: center; text-align: center; }
  .feat-icon-wrapper { margin-bottom: var(--spacing-sm); }
}

/* --- Telas Muito Pequenas (Até 480px) --- */
@media (max-width: 480px) {
  .section__title { font-size: 1.7rem; }
  .hero__title { font-size: 1.8rem; }
  .amount { font-size: 2.4rem; }
  .feat-content h4 { font-size: 1.1rem; }
}
</style>