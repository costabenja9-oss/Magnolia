<#-- Developers Resources Component -->
<#macro developersResources
  tagline="Resources"
  title="Everything you need to integrate and scale"
  resources=[
    {"icon":"book","title":"Documentation","description":"Complete guides and API references to get you started quickly","name":"documentation","link":"#"},
    {"icon":"security","title":"SDKs & Tools","description":"Pre-built SDKs for popular platforms and comprehensive development tools","name":"SDKs","link":"#"},
    {"icon":"presentation","title":"Code Samples","description":"Ready-to-use code examples and integration patterns for common use cases","name":"examples","link":"#"}
  ]
>
  <section class="dev-resources">
    <style>
      .dev-resources{padding:3.75rem 0}
      .dev-resources-container{max-width:1280px;margin:0 auto;padding:0 1.25rem}
      .dev-resources h2{text-align:center;margin-bottom:3rem;font-weight:700;font-size:2.25rem}
      @media(min-width:1280px){.dev-resources h2{font-size:3rem}}
      .resources-grid{margin:3.75rem auto 0;display:flex;flex-wrap:wrap;align-items:baseline;justify-content:center;gap:3.25rem}
      .resource-item{width:100%;max-width:20rem;text-align:center}
      .resource-icon{width:3.25rem;height:3.25rem;margin:0 auto 1.25rem;object-fit:contain}
      .resource-title{width:16rem;margin:0 auto;font-weight:700;font-size:1.25rem;line-height:1.2;color:#ea580c;text-transform:uppercase}
      .resource-description{width:20rem;margin:.75rem auto 1.25rem;line-height:1.375}
      .resource-link{display:inline-flex;gap:.375rem;font-size:1.125rem;color:#ea580c;transition:color .3s;text-decoration:none}
      .resource-link:hover{color:#dc2626}
      .resource-link span{text-decoration:underline;text-underline-offset:2px}
      .resource-arrow{width:.6875rem}
      .resources-cta{margin-top:4.5rem;padding:.625rem 1.25rem;display:inline-block;border-radius:.375rem;background:#ea580c;font-size:1.25rem;color:#fff;text-decoration:none;transition:background-color .3s}
      .resources-cta:hover{background:#dc2626}
    </style>

    <div class="dev-resources-container">
      <h2>${title}</h2>

      <div class="resources-grid">
        <#list resources as resource>
          <article class="resource-item">
            <img class="resource-icon" src="${ctx.contextPath}/.resources/b-fy/webresources/icons/${resource.icon}.svg" alt="" />
            <h3 class="resource-title">${resource.title}</h3>
            <p class="resource-description">${resource.description}</p>
            <a class="resource-link" href="${resource.link}" target="_blank" rel="noreferrer">
              <span>View ${resource.name}</span>
              <svg class="resource-arrow" fill="currentColor" viewBox="0 0 24 24">
                <path d="M8.59 16.59L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
              </svg>
            </a>
          </article>
        </#list>
      </div>

      <div style="text-align:center">
        <a class="resources-cta" href="${ctx.contextPath}/contact">Need help?</a>
      </div>
    </div>
  </section>
</#macro>
