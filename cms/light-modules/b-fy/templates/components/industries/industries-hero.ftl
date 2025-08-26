<#-- Industries Hero Component -->

<#macro industriesHero>
  <#assign title = "Secure, Frictionless Authentication for Every Industry" />
  <#assign description = "B-FY delivers a decentralized biometric authentication solution designed to meet the demands of any industry. By ensuring that only legitimate users of your company can access your physical and digital environments, B-FY enhances user experience, strengthens compliance, and helps boost your bottom line.<br><br>From finance to logistics, healthcare to education, our technology provides robust protection against today's most sophisticated threats—generative AI, malicious apps, bots, account takeovers (ATO), phishing, and identity fraud." />
  <#assign heroImgUrl = "${ctx.contextPath}/.resources/b-fy/webresources/images/industries.webp" />

<section style="margin-top: 3rem; padding: 0 1.25rem; text-align: center;">
  <style>
    @media (min-width: 640px) {
      .industries-hero { padding: 0 2.5rem; }
    }
    @media (min-width: 1024px) {
      .industries-hero { padding: 0 3.25rem; }
    }
    @media (min-width: 1280px) {
      .industries-hero { margin-top: 1rem; }
    }
    .industries-hero h1 {
      max-width: 48rem;
      margin: 0 auto;
      font-weight: bold;
      font-size: 1.875rem;
      line-height: 1.2;
    }
    @media (min-width: 1280px) {
      .industries-hero h1 {
        font-size: 3rem;
      }
    }
    .industries-hero img {
      margin: 2.5rem auto;
      border-radius: 0.5rem;
      width: 100%;
      height: auto;
    }
    .industries-hero p {
      max-width: 70rem;
      margin: 0 auto;
      font-size: 1.125rem;
      line-height: 1.6;
      text-wrap: pretty;
    }
    @media (min-width: 1280px) {
      .industries-hero p {
        font-size: 1.25rem;
        line-height: 1.4;
      }
    }
  </style>
  <div class="industries-hero">
    <h1>${title}</h1>
    <img src="${heroImgUrl}" 
         alt="Industries authentication overview" 
         loading="eager" />
    <p>${description}</p>
  </div>
</section>
</#macro>


