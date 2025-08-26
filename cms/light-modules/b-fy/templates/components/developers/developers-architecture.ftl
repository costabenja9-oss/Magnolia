<#<#assign subheading = "A Robust and Proven Tech Stack" />
<#assign description = "B-FY is easy to integrate: With B-FY, you'll have an authentication platform built on cutting-edge infrastructure, open protocols, and best-in-class security practices. Our service meets the most stringent regulatory requirements for privacy and data protection and can be integrated into your applications in just a few days through a fast and secure process based on high-security architectures and standards." /> Developers Architecture / Standards Component -->
<#macro developersArchitecture>
<#assign subheading = "A robust and proven tech stack" />
<#assign description = "B‑FY is easy to integrate: With B-FY, you’ll have an authentication platform built on cutting-edge infrastructure, open protocols, and best-in-class security practices. Our service meets the most stringent regulatory requirements for privacy and data protection and can be integrated into your applications in just a few days through a fast and secure process based on high-security architectures and standards." />
<#assign items = [
  {"icon":"mobile","title":"OpenID Certification","text":"An open identity protocol based on OAuth 2.0. It enables your applications to trust the authentication performed by B-FY to verify real user identities."},
  {"icon":"shield-lock","title":"Amazon Web Services","text":"Secure, scalable, and highly available cloud infrastructure. We run our services on AWS to ensure stability and performance."},
  {"icon":"security","title":"GDPR – Regulatory Compliance","text":"We fully comply with the General Data Protection Regulation. User privacy is protected by design."}
] />
<section class="dev-arch">
  <style>
    .dev-arch { background:#f8fafc; padding:5rem 1.25rem; }
    @media (min-width:640px){ .dev-arch { padding:6rem 2.5rem; } }
    @media (min-width:1024px){ .dev-arch { padding:6rem 3.25rem; } }
    .dev-arch h2 { font-weight:700; font-size:1.5rem; margin:0 auto 2rem; max-width:55rem; text-align:center; }
    @media (min-width:1280px){ .dev-arch h2 { font-size:2.25rem; } }
    .dev-arch h3 { font-weight:700; font-size:1.875rem; line-height:1.2; margin:0 auto 1.5rem; max-width:55rem; text-align:center; }
    @media (min-width:1280px){ .dev-arch h3 { font-size:3rem; } }
    .dev-arch p.desc { max-width:70rem; margin:0 auto 3rem; font-size:1.125rem; line-height:1.6; text-align:center; }
    @media (min-width:1280px){ .dev-arch p.desc { font-size:1.25rem; line-height:1.45; } }
    .dev-arch-list { max-width:70rem; margin:0 auto; display:grid; gap:2.25rem; }
    @media (min-width:768px){ .dev-arch-list { grid-template-columns:repeat(3,1fr); } }
    .dev-arch-item { background:#fff; border:1px solid #e5e7eb; border-radius:.75rem; padding:1.5rem; box-shadow:0 1px 2px rgba(0,0,0,.04); }
    .dev-arch-item-icon { width: 2.5rem; height: 2.5rem; margin-bottom: 1rem; object-fit: contain; }
    .dev-arch-item h4 { font-weight:600; font-size:1.125rem; margin-bottom:.5rem; }
    .dev-arch-item p { font-size:.95rem; line-height:1.5; }
  </style>
  <h3>${subheading}</h3>
  <p class="desc">${description}</p>
  <div class="dev-arch-list">
    <#list items as it>
      <div class="dev-arch-item">
        <img class="dev-arch-item-icon" src="${ctx.contextPath}/.resources/b-fy/webresources/icons/${it.icon}.svg" alt="" />
        <h4>${it.title}</h4>
        <p>${it.text}</p>
      </div>
    </#list>
  </div>
</section>
</#macro>

<@developersArchitecture />
