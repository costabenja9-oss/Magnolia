<#-- Developers Features Component -->
<#macro developersFeatures
  tagline="DEVELOPER RESOURCES"
  title="Everything you need to integrate B-FY into your system"
  features=[]
>
  <#-- Fallback list if no features are passed -->
  <#assign fbFeatures = [
    {"icon":"book","title":"TECHNICAL INTEGRATION DETAILS","description":"Check out our technical guides with step-by-step instructions for integrating B-FY into your backend, frontend, or mobile systems.","name":"technical documentation","link":"#"},
    {"icon":"presentation","title":"CONCEPTUAL INTEGRATION OVERVIEW","description":"Understand how B-FY's architecture works and how it fits your products or services from a functional perspective.","name":"conceptual documentation","link":"#"}
  ] />
  <#assign list = (features?size > 0)?then(features, fbFeatures) />

  <section class="dev-features">
    <style>
  .dev-features{margin:3.75rem 1.25rem;text-align:center}
  @media(min-width:640px){.dev-features{margin:3.75rem 2.5rem}}
  @media(min-width:1024px){.dev-features{margin:3.75rem 3.25rem}}
  .dev-features-tagline{padding:.625rem 1.25rem;display:inline-block;border-radius:.375rem;background:#ea580c;line-height:1.25;color:#fff;text-transform:uppercase}
  @media(min-width:1280px){.dev-features-tagline{font-size:1.25rem}}
  .dev-features h2{max-width:50rem;margin:2.25rem auto 0;font-weight:700;font-size:1.875rem}
  @media(min-width:1280px){.dev-features h2{font-size:3rem}}

  .features-grid{
    margin:3.75rem auto 0;
    display:flex;
    flex-wrap:wrap;
    justify-content:center;
    gap:3.25rem;
    align-items:stretch; /* 👈 fuerza misma altura */
  }

  .feature-item{
    width:100%;
    max-width:20rem;
    display:flex;
    flex-direction:column;
    text-align:center;
  }

  .feature-icon{width:3.25rem;height:3.25rem;margin:0 auto 1.25rem;object-fit:contain}
  .feature-title{width:16rem;margin:0 auto;font-weight:700;font-size:1.25rem;line-height:1.2;color:#ea580c;text-transform:uppercase}

  .feature-description{
    flex-grow:1; /* 👈 ocupa espacio sobrante */
    width:20rem;
    margin:.75rem auto 1.25rem;
    line-height:1.4;
  }

  .feature-link{
    margin-top:auto; /* 👈 empuja el link al fondo */
    display:flex;           /* 👈 flex para centrar */
    justify-content:center; /* 👈 centrado horizontal */
    align-items:center;     /* 👈 centrado vertical */
    gap:.375rem;
    font-size:1.125rem;
    color:#ea580c;
    transition:color .3s;
    text-decoration:none;
  }
  .feature-link:hover{color:#dc2626}
  .feature-link span{text-decoration:underline;text-underline-offset:2px}
  .feature-arrow{width:.6875rem}

  .features-cta{
    margin-top:4.5rem;
    padding:.625rem 1.25rem;
    display:inline-block;
    border-radius:.375rem;
    background:#ea580c;
    font-size:1.25rem;
    color:#fff;
    text-decoration:none;
    transition:background-color .3s
  }
  .features-cta:hover{background:#dc2626}
</style>


    <hgroup>
      <p class="dev-features-tagline">${tagline}</p>
      <h2>${title}</h2>
    </hgroup>

    <div class="features-grid">
      <#list list as feature>
        <article class="feature-item">
          <img class="feature-icon" src="${ctx.contextPath}/.resources/b-fy/webresources/icons/${feature.icon}.svg" alt="" />
          <h3 class="feature-title">${feature.title}</h3>
          <p class="feature-description">${feature.description}</p>
          <a class="feature-link" href="${feature.link}" target="_blank" rel="noreferrer">
            <span>View ${feature.name}</span>
            <svg class="feature-arrow" fill="currentColor" viewBox="0 0 24 24">
              <path d="M8.59 16.59L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
            </svg>
          </a>
        </article>
      </#list>
    </div>

    <a class="features-cta" href="${ctx.contextPath}/contact">Need Help?</a>
  </section>
</#macro>
