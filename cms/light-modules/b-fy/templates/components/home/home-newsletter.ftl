[#-- Import shared CMS utilities --]
[#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms]

[#macro homeNewsletter]
  [#-- DEF: Resolver variables una sola vez al inicio --]
  [#assign newsletterNode = {} /]
  [#if content.newsletter??]
    [#assign _children = (content.newsletter?children)![] /]
    [#if _children?size gt 0][#assign newsletterNode = _children[0] /][/#if]
  [/#if]

  [#assign _title          = cms.cmsOrDefault(newsletterNode.title!'', "Subscribe to our Newsletter") /]
  [#assign _description    = cms.cmsOrDefault(newsletterNode.description!'', "Receive the latest updates on digital identity, security and authentication innovation.") /]
  [#assign _buttonLabel    = cms.cmsOrDefault(newsletterNode.buttonLabel!'', "Request a demo") /]
  [#assign _emailPlaceholder = cms.cmsOrDefault(newsletterNode.emailPlaceholder!'', "Enter your email") /]

  [#if !HOME_NEWSLETTER_STYLE_INCLUDED??]
    [#global HOME_NEWSLETTER_STYLE_INCLUDED = true /]
    <style>
      .newsletter-section{padding:48px 16px;background:#fff}
      @media(min-width:640px){.newsletter-section{padding:64px 32px}}
      @media(min-width:1024px){.newsletter-section{padding:72px 44px}}

      .newsletter-container{
        max-width:1400px;margin:0 auto;background:#ea580c;border-radius:16px;
        padding:40px 28px;color:#fff;display:flex;flex-direction:column;gap:18px
      }
      @media(min-width:768px){
        .newsletter-container{flex-direction:row;align-items:center;justify-content:space-between;gap:24px;padding:40px 32px}
      }

      /* MÁS ESPACIO PARA EL TEXTO */
      .newsletter-content{flex:1 1 auto;max-width:980px}
      .newsletter-title{margin:0 0 8px;font-weight:800;letter-spacing:-.015em;color:#fff;font-size:28px;line-height:1.15}
      @media(min-width:640px){.newsletter-title{font-size:30px}}
      @media(min-width:1024px){.newsletter-title{font-size:34px}}
      .newsletter-description{margin:0;opacity:.98;font-size:16px;line-height:1.45}
      @media(min-width:640px){.newsletter-description{font-size:17px}}
      @media(min-width:1024px){.newsletter-description{font-size:18px}}

      .newsletter-form{width:100%;display:flex;flex-direction:column;gap:12px}
      @media(min-width:640px){.newsletter-form{flex-direction:row;align-items:stretch;gap:14px}}
      /* INPUT MÁS CORTO: limitamos el ancho del bloque de formulario */
      @media(min-width:768px){.newsletter-form{width:clamp(320px, 28vw, 440px)}}
      @media(min-width:1200px){.newsletter-form{width:clamp(560px, 26vw, 660px)}}

      .newsletter-input,.newsletter-button{height:48px;border-radius:10px}
      .newsletter-input{
        flex:1 1 auto;min-width:0;padding:0 16px;background:transparent;color:#fff;
        border:1.5px solid rgba(255,255,255,.95);font-size:15px;transition:box-shadow .2s,border-color .2s
      }
      .newsletter-input::placeholder{color:rgba(255,255,255,.95)}
      .newsletter-input:focus{outline:none;box-shadow:0 0 0 3px rgba(255,255,255,.28)}

      .newsletter-button{
        padding:0 18px;background:#fff;color:#ea580c;border:1.5px solid #fff;
        font-weight:700;font-size:15px;cursor:pointer;white-space:nowrap;transition:transform .15s,background .15s
      }
      .newsletter-button:hover{background:#f7f7f7;transform:translateY(-1px)}
    </style>
  [/#if]

  <section class="newsletter-section">
    <div class="newsletter-container">
      <div class="newsletter-content">
        <h3 class="newsletter-title">${_title}</h3>
        <p class="newsletter-description">${_description}</p>
      </div>
      <form id="newsletter-form" class="newsletter-form" onsubmit="return false;" novalidate>
        <!-- Honeypot (antispam) -->
        <input type="text" name="website" tabindex="-1" autocomplete="off" style="position:absolute; left:-9999px; opacity:0;" />
        <input type="email" name="email" placeholder="${_emailPlaceholder}" aria-label="${_emailPlaceholder}" required class="newsletter-input"/>
        <button type="submit" class="newsletter-button">${_buttonLabel}</button>
      </form>
    </div>
  </section>

  <!-- EmailJS SDK + envío para newsletter -->
  <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js" defer></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Verificar que EmailJS esté disponible
      if (typeof window.emailjs === 'undefined') {
        console.error('EmailJS SDK no se cargó correctamente');
        return;
      }

      // 1) Init - usando las mismas credenciales que contact
      emailjs.init("KQDglcggc3HBv46cx"); // <-- REEMPLAZAR con tu public key

      const form = document.getElementById("newsletter-form");
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
        if (btn) { btn.disabled = true; btn.textContent = "Subscribing..."; }

        // 3) Crear objeto filtrado solo con campos que tienen valor
        const templateParams = {};
        
        // Solo agregar el email (que ya validamos que existe)
        templateParams.email = emailInput.value.trim();
        
        // Agregar tipo de formulario para identificación en el template
        templateParams.form_type = "newsletter";
        
        // 4) Enviar usando emailjs.send en lugar de sendForm para tener control total
        emailjs.send("service_bd0x4ke", "template_txdnffe", templateParams) // <-- Mismas credenciales que contact
          .then(() => {
            alert("Thank you for subscribing to our newsletter!");
            form.reset();
          })
          .catch((err) => {
            console.error(err);
            alert("We couldn't process your subscription. Please try again.");
          })
          .finally(() => {
            if (btn) { btn.disabled = false; btn.textContent = original; }
          });
      });
    });
  </script>
[/#macro]
