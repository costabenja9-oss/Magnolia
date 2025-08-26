<#-- Developers FAQs Component -->
<#macro developersFaqs>
<#assign heading = "Frequently Asked Questions" />
<#assign faqs = [
  {"q":"Can I integrate the B-FY library into my hybrid application?","a":"If your hybrid app can use native libraries, then B-FY can be integrated without any issues."},
  {"q":"How can I download the library?","a":"You can download our library from the NEXUS repository."},
  {"q":"How do I configure my client with my library?","a":"The specific configuration parameters are provided by B-FY and are attributes of the client's dedicated REALM. These include: CLIENT_ID, CLIENT_SECRET, REDIRECT_URI, and LICENSE_CODE."},
  {"q":"How do I configure my client with B-FY?","a":"Just like with the library, the configuration parameters are provided by B-FY and correspond to your client's dedicated REALM. These are: CLIENT_ID, CLIENT_SECRET, REDIRECT_URI, and LICENSE_CODE."},
  {"q":"Can I launch authorized requests to perform simple actions?","a":"Yes, we've developed an API that allows you to perform operations using a temporary token, simplifying tasks the client may want to carry out with B-FY—whether in a corporate back office or another internal tool."},
  {"q":"Why do we recommend using a short-lived JWT?","a":"For security reasons, we recommend generating a new JWT for each request, with a lifespan of 30–60 seconds. This helps prevent unauthorized use of the token for unintended activities."}
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
