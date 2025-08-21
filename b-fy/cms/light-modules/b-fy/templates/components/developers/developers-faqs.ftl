<#-- Developers FAQs Component -->
<#macro developersFaqs>
<#assign heading = "Frequently Asked Questions" />
<#assign faqs = [
  {"q":"How long does it take to integrate B-FY?","a":"Basic integration can be completed in less than an hour using our SDKs. Most implementations are fully operational within a few days."},
  {"q":"Do you store biometric data?","a":"No, biometric data never leaves the user's device. B-FY uses a decentralized approach where authentication templates remain on the user's smartphone."},
  {"q":"Do you support OpenID?","a":"Yes, we are OpenID and OAuth2 certified, ensuring seamless integration with existing identity management systems."},
  {"q":"What platforms does B-FY support?","a":"B-FY works across web, mobile (iOS and Android), and can be integrated into physical access points. Our SDKs support all major development frameworks."},
  {"q":"How secure is B-FY authentication?","a":"B-FY uses military-grade encryption and follows strict security protocols. Our decentralized approach eliminates single points of failure and reduces attack vectors."},
  {"q":"Can B-FY replace existing authentication systems?","a":"Yes, B-FY can completely replace traditional password-based systems or work alongside existing multi-factor authentication solutions."},
  {"q":"What happens if a user loses their device?","a":"Users can easily re-register with a new device using our secure recovery process. The decentralized nature ensures no data is lost from central servers."},
  {"q":"Is there a sandbox environment for testing?","a":"Yes, we provide a full sandbox environment where you can test authentication flows safely before going live."}
] />
<section class="dev-faqs">
  <style>
    .dev-faqs { padding: 3.75rem 1.25rem 4.5rem; background-color: #e5e5e5; }
    @media (min-width:640px){ .dev-faqs { padding: 3.75rem 2.5rem 4.5rem; } }
    @media (min-width:1024px){ .dev-faqs { padding: 3.75rem 3.25rem 4.5rem; } }
    .dev-faqs-tagline { width: fit-content; margin: 0 auto; padding: 0.625rem 1.25rem; border-radius: 0.375rem; background-color: #ea580c; line-height: 1; color: white; text-transform: uppercase; }
    @media (min-width:1280px){ .dev-faqs-tagline { font-size: 1.25rem; } }
    .dev-faqs h2 { max-width: 62rem; margin: 2.25rem auto 0; font-weight: 700; font-size: 1.875rem; text-align: center; }
    @media (min-width:1280px){ .dev-faqs h2 { font-size: 3rem; } }
    .faq-list { max-width: 62rem; margin: 2.25rem auto 0; display: flex; flex-direction: column; gap: 0.75rem; }
    .faq-item { background: #fff; border-radius: 0.375rem; }
    .faq-item summary { cursor: pointer; padding: 1.25rem; font-weight: 700; font-size: 1rem; display: flex; justify-content: space-between; align-items: center; }
    .faq-item[open] summary { border-bottom: 1px solid #e5e7eb; }
    .faq-item p { padding: 0 1.25rem 1.25rem; font-size: 0.875rem; line-height: 1.4; }
    .faq-plus { width: 1rem; height: 1rem; transition: transform 0.2s; }
    .faq-item[open] .faq-plus { transform: rotate(45deg); }
  </style>
  
  <div>
    <p class="dev-faqs-tagline">FAQs</p>
    <h2>${heading}</h2>
  </div>
  
  <div class="faq-list">
    <#list faqs as f>
      <details class="faq-item">
        <summary>
          ${f.q}
          <svg class="faq-plus" fill="currentColor" viewBox="0 0 24 24">
            <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
          </svg>
        </summary>
        <p>${f.a}</p>
      </details>
    </#list>
  </div>
</section>
</#macro>

<@developersFaqs />
