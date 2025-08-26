<#-- Resources Hero (visual-only) -->
<#macro resourcesHero>
  <#assign title = "Everything you need to understand about B-FY's game-changing authentication protocol" />
  <#assign description = "B-FY has changed the access protocol used for the past 15 years. Find key information about human authentication, privacy, and decentralized biometric technology. Explore our articles, white papers, and press materials to stay up to date on B-FY." />

  <section class="res-hero">
    <div class="res-hero__inner">
      <h1 class="res-hero__title">${title}</h1>
      <p class="res-hero__lead">${description}</p>
    </div>
  </section>

  <#-- inject styles once -->
  <#if !RES_HERO_STYLE_INCLUDED??>
    <#global RES_HERO_STYLE_INCLUDED = true />
    <style>
      /* Layout */
      .res-hero{
        padding-top: clamp(64px, 8vw, 120px);
        padding-bottom: clamp(24px, 4vw, 48px);
        padding-left: 1.25rem; padding-right: 1.25rem;
        text-align:center;
      }
      .res-hero__inner{ max-width: 74rem; margin: 0 auto; }

      /* Title: bold, very large, 2–3 lines, tight leading */
      .res-hero__title{
        margin: 0 auto;
        max-width: 24ch;                /* controla que el título rompa en 2–3 líneas */
        font-weight: 800;
        color: #0f172a;                 /* slate-900 */
        letter-spacing: -0.02em;
        line-height: 1.05;
        font-size: clamp(2.25rem, 1.25rem + 3vw, 3.75rem); /* ~36px → 60px */
      }

      /* Lead: más angosto y suave */
      .res-hero__lead{
        margin: clamp(16px, 2.2vw, 28px) auto 0;
        max-width: 62ch;                /* ancho visual del párrafo como en la imagen */
        color: #4b5563;                 /* gray-600 */
        line-height: 1.6;
        font-size: clamp(1rem, .9rem + .4vw, 1.125rem);    /* 16 → 18px */
      }

      /* Fine-tuning en xl+ */
      @media (min-width: 1280px){
        .res-hero__title{ font-size: clamp(3.25rem, 2rem + 2vw, 3.75rem); }
        .res-hero__lead{  font-size: 1.125rem; }
      }
    </style>
  </#if>
</#macro>
