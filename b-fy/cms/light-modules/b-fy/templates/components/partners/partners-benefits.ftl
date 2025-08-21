<#-- Partners Benefits Component -->
<#import "/b-fy/templates/components/util/icons.ftl" as icons>

<#macro partnersBenefits>
<#assign sectionTitle = "Exclusive benefits for our partners" />
<#assign sectionDescription = "Being part of our partner network opens the door to new business opportunities and sustained growth. As a B-FY ally, you gain access to:" />

<#assign benefits = [
  {
    "icon": "briefcase",
    "title": "Financial incentives", 
    "description": "Explore new revenue streams by collaborating on high-growth potential projects. Earn attractive financial rewards for referrals and sales."
  },
  {
    "icon": "book",
    "title": "Training and certification",
    "description": "We offer a training process to help you earn your Official B-FY Partner certification."
  },
  {
    "icon": "handstack", 
    "title": "Support at every step",
    "description": "We'll assist you in generating business opportunities and expanding your solutions portfolio."
  },
  {
    "icon": "security",
    "title": "Technical support",
    "description": "Our technical and commercial teams will support you to ensure your project's success."
  },
  {
    "icon": "presentation",
    "title": "Marketing resources", 
    "description": "Access sales and marketing materials, plus support to strengthen your commercial strategy."
  },
  {
    "icon": "users",
    "title": "Collaborative work",
    "description": "Our sales team will be by your side when needed to help shape proposals and new client projects."
  }
] />

<section style="max-width: 65.5rem; margin: 6rem auto 5rem; padding: 0 1.25rem;">
  <style>
    @media (min-width: 640px) {
      .partners-benefits { padding: 0 2.5rem; }
    }
    @media (min-width: 1024px) {
      .partners-benefits { padding: 0 3.25rem; }
    }
    
    .benefits-intro {
      text-align: center;
    }
    .benefits-intro h2 {
      font-weight: bold;
      font-size: 1.5rem;
      line-height: 1.2;
      text-wrap: balance;
      color: #ea580c;
    }
    @media (min-width: 1280px) {
      .benefits-intro h2 {
        font-size: 2.25rem;
      }
    }
    .benefits-intro p {
      margin-top: 1rem;
      font-size: 1.125rem;
      line-height: 1.6;
    }
    @media (min-width: 1280px) {
      .benefits-intro p {
        font-size: 1.25rem;
        line-height: 1.4;
      }
    }
    
    .benefits-grid {
      margin-top: 3rem;
      display: grid;
      gap: 2rem;
    }
    @media (min-width: 768px) {
      .benefits-grid {
        grid-template-columns: repeat(2, 1fr);
      }
    }
    
    .benefit-card {
      padding: 1.75rem;
      border-radius: 0.5rem;
      background-color: #fef2f2;
    }
    @media (min-width: 1024px) {
      .benefit-card {
        padding: 2.25rem;
      }
    }
    
    .benefit-icon {
      width: 2.75rem;
      height: 2.75rem;
      object-fit: contain;
    }
    
    .benefit-title {
      margin-top: 1rem;
      font-weight: bold;
      font-size: 1.25rem;
      line-height: 1.2;
      text-wrap: pretty;
      color: #ea580c;
      text-transform: uppercase;
    }
    
    .benefit-description {
      margin-top: 0.25rem;
      font-size: 1.125rem;
      text-wrap: pretty;
      line-height: 1.6;
    }
    
    .benefits-cta {
      margin-top: 3.75rem;
      width: fit-content;
      margin-left: auto;
      margin-right: auto;
      padding: 0.625rem 1.25rem;
      display: block;
      border-radius: 0.25rem;
      background-color: #ea580c;
      font-size: 1.125rem;
      line-height: 1;
      color: white;
      text-decoration: none;
      transition: background-color 0.3s ease;
    }
    @media (min-width: 1280px) {
      .benefits-cta {
        font-size: 1.25rem;
      }
    }
    .benefits-cta:hover {
      background-color: #dc2626;
    }
  </style>
  
  <div class="partners-benefits">
    <div class="benefits-intro">
      <h2>${sectionTitle}</h2>
      <p>${sectionDescription}</p>
    </div>
    
    <div class="benefits-grid">
      <#list benefits as benefit>
        <article class="benefit-card">
          <img class="benefit-icon" 
               src="${ctx.contextPath}/.resources/b-fy/webresources/icons/${benefit.icon}.svg" 
               alt="${benefit.title}" />
          <h3 class="benefit-title">${benefit.title}</h3>
          <p class="benefit-description">${benefit.description}</p>
        </article>
      </#list>
    </div>
    
    <a class="benefits-cta" href="#form">
      Let's grow together!
    </a>
  </div>
</section>
</#macro>

<@partnersBenefits />
