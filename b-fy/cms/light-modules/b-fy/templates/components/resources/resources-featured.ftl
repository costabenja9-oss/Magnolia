<#-- Resources Featured Post (bigger, centered image) -->
<#macro resourcesFeatured>
<section class="res-feature" id="blog">
  <article class="res-feature__grid">
    <div class="res-feature__media">
      <img
        class="res-feature__img"
        src="${ctx.contextPath}/.resources/b-fy/webresources/images/hidden-costs-identity-fraud-avoid.webp"
        alt="The hidden costs of identity fraud and how to avoid them"
        loading="eager" />
    </div>

    <div class="res-feature__content">
      <span class="res-feature__badge">FEATURED POST OF THE MONTH</span>
      <h2 class="res-feature__title">The hidden costs of identity fraud and how to avoid them</h2>
      <p class="res-feature__excerpt">
        Identity fraud doesn't just leave visible marks on the financial statement, but it also
        brings a series of hidden costs that can be equally devastating. These costs range from the
        time spent resolving the issue to the irreversible damage to a company's reputation.
      </p>
      <a class="res-feature__btn" href="${ctx.contextPath}/blog/hidden-costs-identity-fraud">
        Discover more
      </a>
    </div>
  </article>
</section>

<#-- inject styles once -->
<#if !RES_FEATURE_STYLE_INCLUDED??>
  <#global RES_FEATURE_STYLE_INCLUDED = true />
  <style>
    .res-feature{
      padding: clamp(56px, 8vw, 88px) 1.25rem clamp(28px, 5vw, 48px);
    }
    .res-feature__grid{
      max-width: 1280px; /* más ancho */
      margin: 0 auto;
      display: grid;
      gap: clamp(24px, 3vw, 52px);
      grid-template-columns: 1fr;
      align-items: center;
    }
    /* Da más proporción al media (imagen) que al texto */
    @media (min-width: 1024px){
      .res-feature__grid{ grid-template-columns: 8fr 5fr; }
    }
    @media (min-width: 1440px){
      .res-feature__grid{ grid-template-columns: 9fr 6fr; }
    }

    .res-feature__media{
      width: 100%;
      justify-self: center; /* centrado del bloque de imagen */
      border-radius: 18px;
      overflow: hidden;
      box-shadow: 0 22px 48px rgba(0,0,0,.14);
      background: #f3f4f6;
    }
    .res-feature__img{
      display: block; width: 100%; height: auto; object-fit: cover; aspect-ratio: 16/9;
    }
    /* Imagen más alta en desktop */
    @media (min-width: 1024px){
      .res-feature__img{ aspect-ratio: auto; height: 520px; }
    }
    @media (min-width: 1440px){
      .res-feature__img{ height: 560px; }
    }

    .res-feature__content{ max-width: 48rem; justify-self: center; }

    .res-feature__badge{
      display: inline-block; padding: 10px 16px; border-radius: 10px;
      background: #ea580c; color: #fff; font-weight: 700; text-transform: uppercase; letter-spacing: .02em;
    }
    .res-feature__title{
      margin: 22px 0 14px; color: #0f172a; font-weight: 800; line-height: 1.15; letter-spacing: -0.01em;
      font-size: clamp(1.9rem, 1.1rem + 1.6vw, 2.5rem);
    }
    .res-feature__excerpt{
      margin: 0 0 24px; color: #111827; line-height: 1.55; max-width: 62ch;
      font-size: clamp(1rem, .95rem + .2vw, 1.0625rem);
    }
    .res-feature__btn{
      display: inline-block; padding: 12px 18px; border-radius: 10px;
      border: 2px solid #ea580c; color: #ea580c; font-weight: 600; text-decoration: none; transition: all .2s ease;
    }
    .res-feature__btn:hover{ background: #ea580c; color: #fff; box-shadow: 0 10px 20px rgba(234,88,12,.25); }
  </style>
</#if>
</#macro>
