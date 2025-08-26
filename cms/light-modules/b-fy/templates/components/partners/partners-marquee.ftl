<#-- Partners Marquee Component -->
<#macro partnersMarquee>
<#assign sectionTitle = "These are our partners" />

<#-- Use specific partner logos -->
<#assign partners = [
  {"name": "Four1", "logo": "four1.webp"},
  {"name": "Soldig", "logo": "soldig.webp"},
  {"name": "Serban Group", "logo": "serban-group.webp"},
  {"name": "CTN-GTS", "logo": "ctn-gts.webp"},
  {"name": "Hola TI", "logo": "hola-ti.webp"},
  {"name": "TSG", "logo": "tsg.webp"},
  {"name": "Qualoom", "logo": "qualoom.webp"},
  {"name": "TAT Sales", "logo": "tat-sales.webp"},
  {"name": "Asisa", "logo": "asisa.webp"}
] />

<section style="overflow: hidden; margin: 6rem 0;">
  <style>
    .partners-marquee h2 {
      font-weight: bold;
      text-align: center;
      font-size: 1.5rem;
      line-height: 1.2;
      color: #ea580c;
    }
    @media (min-width: 1280px) {
      .partners-marquee h2 {
        font-size: 2.25rem;
      }
    }
    
    .marquee-container {
      margin: 5rem 0 2.5rem;
      min-width: 200%;
      width: max-content;
      display: flex;
      align-items: center;
      justify-content: space-around;
      animation: marquee 30s linear infinite;
    }
    
    .marquee-container > * {
      flex-shrink: 0;
    }
    
    .partner-logo {
      height: 3.75rem;
      width: 8.75rem;
      object-fit: contain;
      margin: 0 2.5rem;
      filter: grayscale(100%);
      opacity: 0.7;
      transition: all 0.3s ease;
    }
    
    .partner-logo:hover {
      filter: grayscale(0%);
      opacity: 1;
    }
    
    @keyframes marquee {
      0% {
        transform: translateX(0);
      }
      100% {
        transform: translateX(-50%);
      }
    }
    
    /* Pause animation on hover */
    .marquee-container:hover {
      animation-play-state: paused;
    }
  </style>
  
  <div class="partners-marquee">
    <h2>${sectionTitle}</h2>
    <div class="marquee-container">
      <#-- First set of logos -->
      <#list partners as partner>
        <img class="partner-logo" 
             src="${ctx.contextPath}/.resources/b-fy/webresources/images/${partner.logo}" 
             alt="${partner.name}" />
      </#list>
      
      <#-- Duplicate set for seamless loop -->
      <#list partners as partner>
        <img class="partner-logo" 
             src="${ctx.contextPath}/.resources/b-fy/webresources/images/${partner.logo}" 
             alt="${partner.name}" />
      </#list>
    </div>
  </div>
</section>
</#macro>

<@partnersMarquee />
