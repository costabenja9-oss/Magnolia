<#-- Industries CTA Component -->
<#macro industriesCta>
<#assign ctaTitle = "What are you waiting for?" />
<#assign ctaSubtitle = "Experience the new era of authentication." />
<#assign ctaDescription = "Discover how B-FY can transform your company's security. Request a demo or contact us for more information." />

<section style="padding: 6.25rem 1.25rem; text-align: center; background-color: #f8fafc;">
  <style>
    @media (min-width: 640px) {
      .industries-cta { padding: 6.25rem 2.5rem; }
    }
    @media (min-width: 1024px) {
      .industries-cta { padding: 6.25rem 3.25rem; }
    }
    .industries-cta h2 {
      font-weight: bold;
      font-size: 1.875rem;
      line-height: 1.2;
      margin-bottom: 1rem;
    }
    @media (min-width: 1280px) {
      .industries-cta h2 {
        font-size: 3rem;
      }
    }
    .industries-cta h3 {
      font-size: 1.5rem;
      line-height: 1.3;
      margin-bottom: 1.5rem;
      color: #6b7280;
    }
    @media (min-width: 1280px) {
      .industries-cta h3 {
        font-size: 2rem;
      }
    }
    .industries-cta p {
      max-width: 42rem;
      margin: 0 auto 3rem;
      font-size: 1.125rem;
      line-height: 1.6;
      color: #6b7280;
    }
    @media (min-width: 1280px) {
      .industries-cta p {
        font-size: 1.25rem;
        line-height: 1.4;
      }
    }
    .industries-cta-buttons {
      display: flex;
      flex-direction: column;
      gap: 1rem;
      align-items: center;
      justify-content: center;
    }
    @media (min-width: 640px) {
      .industries-cta-buttons {
        flex-direction: row;
      }
    }
    .industries-cta-btn {
      padding: 0.75rem 2rem;
      font-size: 1.125rem;
      font-weight: 500;
      text-decoration: none;
      border-radius: 0.375rem;
      transition: all 0.3s ease;
      display: inline-block;
      line-height: 1;
    }
    @media (min-width: 1280px) {
      .industries-cta-btn {
        font-size: 1.25rem;
      }
    }
    .industries-cta-btn-primary {
      background-color: #ea580c;
      color: white;
    }
    .industries-cta-btn-primary:hover {
      background-color: #dc2626;
    }
    .industries-cta-btn-secondary {
      background-color: transparent;
      color: #ea580c;
      border: 2px solid #ea580c;
    }
    .industries-cta-btn-secondary:hover {
      background-color: #ea580c;
      color: white;
    }
  </style>
  <div class="industries-cta">
    <h2>${ctaTitle}</h2>
    <h3>${ctaSubtitle}</h3>
    <p>${ctaDescription}</p>
    <div class="industries-cta-buttons">
      <a class="industries-cta-btn industries-cta-btn-primary" href="${ctx.contextPath}/get-demo">
        Get a demo
      </a>
      <a class="industries-cta-btn industries-cta-btn-secondary" href="${ctx.contextPath}/contact">
        Contact us
      </a>
    </div>
  </div>
</section>
</#macro>
