<#-- Import shared CMS utilities -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#-- HOME HERO -->
<#macro homeHero 
  tagline="Say goodbye to passwords. Say hello to security and frictionless experience." 
  title="The passwordless biometric solution to authenticate people and protect their privacy" 
  description="B-FY transforms authentication with its decentralized biometric identification solution. It guarantees secure, seamless experiences for users, increases customer retention, trust, and eliminates online ID fraud." 
  hook="Identity fraud represents more than 65% of all cyberattacks. With the advent of AI, this percentage is only increasing." 
  buttonLabel="Get a demo" 
  privacyIntro="Check our Privacy Policy" 
  privacyLinkLabel="here" 
  securityActivated="Security activated" 
  systemGreeting="System secure greeting" 
  emailPlaceholder="Enter your email..." 
>
  <#if !HOME_HERO_STYLE_INCLUDED??>
    <#global HOME_HERO_STYLE_INCLUDED = true />
    <style>
      /* Hero Container */
      .home-hero {
        display:flex;
        flex-direction:column;
        gap:24px;
        padding:132px 20px 60px;
        background:linear-gradient(108deg,#fff 0%,#f5f5f5 100%);
        overflow:hidden;
        position:relative;
        min-height:100vh;
      }
      @media (min-width:640px){
        .home-hero{ padding-bottom:88px; padding-left:40px; padding-right:40px; }
      }
      @media (min-width:1024px){
        /* menos aire en los costados */
        .home-hero{ padding-left:32px; padding-right:32px; }
      }
      @media (min-width:1280px){
        /* más separación entre columnas y distribución a extremos */
        .home-hero{
          flex-direction:row;
          align-items:center;
          justify-content:center;
		  gap: 200px;
        }
      }

      /* Text Section */
      .home-hero__text{
        max-width:760px;   /* antes 700px */
        flex:1;
      }
      .home-hero__tag{
        font-size:1rem;line-height:1.3;text-transform:uppercase;color:#ea580c;letter-spacing:.5px;font-weight:600;margin-bottom:20px;display:block;
      }
      .home-hero__text h1{ margin:0 0 32px 0;font-weight:700;font-size:2.5rem;line-height:1.1;color:#1f2937; }
      @media (min-width:1280px){ .home-hero__text h1{ font-size:3rem; } }
      .home-hero__desc{ margin:0 0 24px 0;font-size:1.25rem;line-height:1.5;color:#4b5563; }
      @media (min-width:1280px){ .home-hero__desc{ font-size:1.5rem; } }

      .home-hero__hook{
        margin:0 0 40px 0;font-style:italic;font-size:1.25rem;color:#ea580c;line-height:1.4;text-align:center;padding:20px;background:rgba(234,88,12,.05);
        border-radius:8px;border-left:4px solid #ea580c;
      }
      @media (min-width:1280px){ .home-hero__hook{ font-size:1.5rem;text-align:left; } }

      /* Form */
      form.home-hero__form{ max-width:100%; }
      .home-hero__form-row{ display:flex; flex-direction:column; gap:16px; margin-bottom:12px; }
      @media (min-width:640px){ .home-hero__form-row{ flex-direction:row; } }
      .home-hero__input{
        flex:1;padding:16px 18px;border:2px solid #d1d5db;border-radius:8px;font-size:16px;transition:border-color .2s;
      }
      .home-hero__input:focus{ outline:none;border-color:#ea580c;box-shadow:0 0 0 3px rgba(234,88,12,.1); }
      .home-hero__btn{
        padding:16px 32px;border-radius:8px;background:#ea580c;color:#fff;font-size:1rem;font-weight:600;line-height:1;transition:.2s;white-space:nowrap;border:none;cursor:pointer;
      }
      .home-hero__btn:hover{ background:#c2410c;transform:translateY(-2px);box-shadow:0 8px 16px rgba(234,88,12,.3); }
      .home-hero__privacy{ font-size:14px;color:#6b7280;line-height:1.4; }
      .home-hero__privacy a{ color:#ea580c;text-decoration:underline;transition:color .2s; }
      .home-hero__privacy a:hover{ color:#c2410c; }

      /* Visual Section */
      .home-hero__visual{ position:relative;flex-shrink:0;width:fit-content;margin:0 auto; }
      @media (min-width:1280px){ .home-hero__visual{ margin:0; } }
      .home-hero__img{
        display:block;width:380px;height:520px;object-fit:cover;border-radius:16px;box-shadow:0 20px 40px rgba(0,0,0,.1);
      }
      @media (min-width:1280px){
        /* un poco más grande para ocupar mejor el ancho total */
        .home-hero__img{ width:480px;height:620px; }
      }

      /* Badge (Samuel) */
      .home-hero__badge{
        position:absolute;top:-20px;left:-40px;width:240px;padding:16px;display:flex;align-items:center;gap:12px;border-radius:16px;background:#fff;
        box-shadow:0 12px 32px rgba(0,0,0,.15);z-index:2;
      }
      @media (min-width:1280px){ .home-hero__badge{ left:-72px; top:40px; } }
      .home-hero__badge-avatar{
        width:48px;height:48px;border:3px solid #f3f4f6;border-radius:50%;display:flex;align-items:center;justify-content:center;color:#ea580c;font-size:20px;flex-shrink:0;
      }
      .home-hero__badge-content{ flex:1; }
      .home-hero__badge-name{ font-size:16px;font-weight:600;color:#1f2937;margin:0 0 4px 0; }
      .home-hero__badge-status{ font-size:12px;color:#6b7280;margin:0; }

      /* Card (Fingerprint) */
      .home-hero__card{
        position:absolute;right:-20px;bottom:-40px;width:240px;padding:24px;border-radius:16px;background:#fff;box-shadow:0 12px 32px rgba(0,0,0,.15);text-align:center;z-index:2;
      }
      @media (min-width:1280px){ .home-hero__card{ right:-40px; bottom:20px; } }
      .home-hero__card p{ margin:0 0 20px 0;font-size:14px;line-height:1.4;color:#ea580c;font-weight:500; }
      .home-hero__finger{ width:60px;height:60px;margin:0 auto;color:#ea580c; }

      /* Responsive centering on <1280px */
      @media (max-width:1279px){
        .home-hero__text{ text-align:center; }
        .home-hero__hook{ text-align:center; }
      }
    </style>
  </#if>

  <#-- DEF: Resolver variables una sola vez al inicio -->
  <#assign _tag       = cms.cmsOrDefault(content.tagline!'', tagline) />
  <#assign _title     = cms.cmsOrDefault(content.title!'', title) />
  <#assign _desc      = cms.cmsOrDefault(content.description!'', description) />
  <#assign _hook      = cms.cmsOrDefault(content.hook!'', hook) />
  <#assign _btn       = cms.cmsOrDefault(content.buttonLabel!'', buttonLabel) />
  <#assign _priv      = cms.cmsOrDefault(content.privacyIntro!'', privacyIntro) />
  <#assign _privHere  = cms.cmsOrDefault(content.privacyLinkLabel!'', privacyLinkLabel) />
  <#assign _secAct    = cms.cmsOrDefault(content.securityActivated!'', securityActivated) />
  <#assign _sysGreet  = cms.cmsOrDefault(content.systemGreeting!'', systemGreeting) />
  <#assign _emailPh   = cms.cmsOrDefault(content.emailPlaceholder!'', emailPlaceholder) />
  <#assign _heroImg   = cms.damOrLocal(content.heroImage!'', 'hero.webp') />

  <section class="home-hero" aria-label="Hero">
    <div class="home-hero__text">
      <p class="home-hero__tag">${_tag}</p>
      <h1>${_title}</h1>
      <p class="home-hero__desc">${_desc}</p>
      <p class="home-hero__hook">${_hook}</p>

      <form id="hero-form" class="home-hero__form" onsubmit="return false;">
        <!-- Honeypot (antispam) -->
        <input type="text" name="website" tabindex="-1" autocomplete="off" style="position:absolute; left:-9999px; opacity:0;" />
        <div class="home-hero__form-row">
          <input type="email" name="email" placeholder="${_emailPh}" class="home-hero__input" required />
          <button class="home-hero__btn" type="submit">${_btn}</button>
        </div>
        <p class="home-hero__privacy">${_priv} <a href="${ctx.contextPath}/privacy-policy">${_privHere}</a></p>
      </form>
    </div>

    <div class="home-hero__visual" aria-hidden="true">
      <div class="home-hero__badge">
        <div class="home-hero__badge-avatar" aria-hidden="true">
          <svg viewBox="0 0 26 26" width="26" height="26" fill="currentColor" aria-hidden="true">
            <path d="M12.997 0C9.192 0 6.094 3.105 6.094 6.91a6.9 6.9 0 0 0 3.208 5.82C3.93 14.327 0 19.302 0 25.187A.813.813 0 0 0 .813 26h24.375a.812.812 0 0 0 .812-.813c0-5.886-3.932-10.86-9.306-12.457 1.927-1.227 3.212-3.376 3.212-5.82 0-3.805-3.105-6.91-6.91-6.91Zm0 1.625a5.274 5.274 0 0 1 5.284 5.284A5.269 5.269 0 0 1 13 12.188h-.003a5.264 5.264 0 0 1-5.278-5.279 5.269 5.269 0 0 1 5.278-5.284Zm0 12.188H13c6.013 0 10.871 4.658 11.294 10.562H1.706c.423-5.903 5.279-10.56 11.29-10.563Z" opacity=".98"/>
          </svg>
        </div>
        <div class="home-hero__badge-content">
          <p class="home-hero__badge-name">Samuel</p>
          <p class="home-hero__badge-status">${_secAct}</p>
        </div>
      </div>

      <img src="${_heroImg}" alt="${_title}" width="480" height="620" class="home-hero__img" />

      <div class="home-hero__card">
        <p>System secure greeting</p>
        <svg class="home-hero__finger" viewBox="0 0 73 73" width="60" height="60" fill="currentColor" aria-hidden="true">
          <path d="M36.5 67.786a24.795 24.795 0 0 0 24.768-24.768V29.982a24.768 24.768 0 0 0-49.536 0v13.036A24.795 24.795 0 0 0 36.5 67.786Zm-13.036-14.34a1.304 1.304 0 0 1-.212-2.588c7.478-1.247 11.945-6.128 11.945-13.054v-6.518a1.303 1.303 0 1 1 2.607 0v6.518c0 8.185-5.413 14.172-14.126 15.624-.07.013-.142.019-.214.018Zm15.643 7.822a4.793 4.793 0 0 1-2.607-.934 4.792 4.792 0 0 1-2.607.934 1.304 1.304 0 0 1 0-2.607 3.24 3.24 0 0 0 1.694-.926 1.304 1.304 0 0 1 1.84 0c.453.471 1.04.794 1.68.926a1.304 1.304 0 0 1 0 2.607Zm6.518-3.91a13.074 13.074 0 0 1-9.04-3.196 15.643 15.643 0 0 1-6.287 3.156 1.304 1.304 0 0 1-.63-2.529c1.792-.45 4.916-1.728 5.667-3.229a1.304 1.304 0 0 1 1.084-.72 1.277 1.277 0 0 1 1.166.577c.088.13 2.364 3.333 8.04 3.333a1.304 1.304 0 0 1 0 2.607Zm2.607-5.215c-4.432 0-7.451-1.564-8.995-4.632a1.303 1.303 0 0 1 2.334-1.165c1.08 2.147 3.256 3.19 6.661 3.19a1.304 1.304 0 0 1 0 2.607ZM36.5 9.125a22.186 22.186 0 0 1 22.16 22.16 1.304 1.304 0 0 1-2.606 0 19.553 19.553 0 0 0-39.108 0 1.304 1.304 0 0 1-2.607 0A22.186 22.186 0 0 1 36.5 9.126ZM14.34 36.5a1.304 1.304 0 0 1 1.303-1.304 4.17 4.17 0 0 0 3.91-3.91 16.946 16.946 0 0 1 33.893 0 4.17 4.17 0 0 0 3.911 3.91 1.304 1.304 0 0 1 0 2.608 6.778 6.778 0 0 1-6.518-6.518 14.34 14.34 0 1 0-28.678 0 6.779 6.779 0 0 1-6.518 6.518 1.304 1.304 0 0 1-1.304-1.304Zm1.303 6.518a1.303 1.303 0 0 1 1.303-1.304c4.172 0 7.822-4.264 7.822-9.125v-1.303a11.733 11.733 0 0 1 23.464 0v1.303c0 4.861 3.65 9.125 7.822 9.125a1.304 1.304 0 1 1 0 2.607c-5.556 0-10.429-5.482-10.429-11.732v-1.303a9.125 9.125 0 1 0-18.25 0v1.303c0 6.25-4.873 11.732-10.428 11.732a1.304 1.304 0 0 1-1.304-1.303Zm1.322 5.428a1.304 1.304 0 0 1 1.071-1.5A14.184 14.184 0 0 0 29.982 32.67v-1.32a6.518 6.518 0 0 1 13.036 0v1.32a14.184 14.184 0 0 0 11.946 14.277 1.304 1.304 0 0 1-.429 2.57A16.953 16.953 0 0 1 40.411 32.67v-1.32a3.91 3.91 0 0 0-7.822 0v1.32a16.953 16.953 0 0 1-14.125 16.847 1.298 1.298 0 0 1-1.5-1.071ZM1.304 73h11.732v-3.91H5.214a1.303 1.303 0 0 1-1.303-1.305v-7.82H0v11.731A1.303 1.303 0 0 0 1.304 73ZM1.304 0A1.304 1.304 0 0 0 0 1.304v11.732h3.91V5.214a1.304 1.304 0 0 1 1.304-1.303h7.822V0H1.304ZM73 13.036V1.304A1.303 1.303 0 0 0 71.696 0H59.964v3.91h7.822a1.303 1.303 0 0 1 1.303 1.304v7.822H73ZM71.696 73A1.303 1.303 0 0 0 73 71.696V59.964h-3.91v7.822a1.303 1.303 0 0 1-1.304 1.303h-7.822V73h11.732Z"/>
        </svg>
      </div>
    </div>
  </section>

  <!-- EmailJS SDK + envío para hero -->
  <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js" defer></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Verificar que EmailJS esté disponible
      if (typeof window.emailjs === 'undefined') {
        console.error('EmailJS SDK no se cargó correctamente');
        return;
      }

      // 1) Init - usando las mismas credenciales que contact
      emailjs.init("KQDglcggc3HBv46cx"); // <-- Mismo public key que contact

      const form = document.getElementById("hero-form");
      if (!form) return;

      form.addEventListener("submit", function (e) {
        e.preventDefault();

        // Honeypot: si está relleno, no enviamos
        const hp = form.querySelector('input[name="website"]');
        if (hp && hp.value.trim() !== "") return;

        // Validación básica del email
        const emailInput = form.querySelector('input[name="email"]');
        if (!emailInput || !emailInput.value.trim()) {
          alert("Please enter your email address.");
          return;
        }

        // Validación simple de formato de email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(emailInput.value.trim())) {
          alert("Please enter a valid email address.");
          return;
        }

        // UX botón
        const btn = form.querySelector('button[type="submit"]');
        const original = btn ? btn.textContent : null;
        if (btn) { btn.disabled = true; btn.textContent = "Requesting..."; }

        // 3) Crear objeto filtrado solo con campos que tienen valor
        const templateParams = {};
        
        // Solo agregar el email (que ya validamos que existe)
        templateParams.email = emailInput.value.trim();
        
        // Agregar tipo de formulario para identificación en el template
        templateParams.form_type = "hero_demo_request";
        
        // 4) Enviar usando emailjs.send - mismas credenciales que contact
        emailjs.send("service_bd0x4ke", "template_txdnffe", templateParams)
          .then(() => {
            alert("Thank you! We'll contact you soon to schedule your demo.");
            form.reset();
          })
          .catch((err) => {
            console.error(err);
            alert("We couldn't process your request. Please try again.");
          })
          .finally(() => {
            if (btn) { btn.disabled = false; btn.textContent = original; }
          });
      });
    });
  </script>
</#macro>
