<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Resources | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  <style>
    /* Resources page styles matching Astro exactly */
    .section-title{background:linear-gradient(90deg,#4f46e5,#f97316);-webkit-background-clip:text;color:transparent}
    .featured-post{display:grid;gap:2.5rem;font-size:1.125rem;line-height:1}
    .featured-post-badge{width:fit-content;padding:0.625rem 1.25rem;border-radius:0.375rem;background-color:#ea580c;color:white;text-transform:uppercase;font-size:1.25rem}
    .post-grid{display:grid;gap-y:3.75rem;gap-x:2.5rem}
    .white-paper-grid{display:grid;gap-y:3.75rem;gap-x:2.5rem}
    .newsroom-pagination{display:grid;gap:1.25rem}
    
    /* Additional utility classes for exact Astro parity */
    .size-full { width: 100%; height: 100%; }
    .gap-10 { gap: 2.5rem; }
    .gap-13 { gap: 3.25rem; }
    .gap-15 { gap: 3.75rem; }
    .mt-20 { margin-top: 5rem; }
    .mb-10 { margin-bottom: 2.5rem; }
    .py-20 { padding-top: 5rem; padding-bottom: 5rem; }
    .pt-13 { padding-top: 3.25rem; }
    .pb-15 { padding-bottom: 3.75rem; }
    .mb-20 { margin-bottom: 5rem; }
    .mt-18 { margin-top: 4.5rem; }
    .aspect-3\/2 { aspect-ratio: 3/2; }
    .aspect-video { aspect-ratio: 16/9; }
    .max-w-4xl { max-width: 56rem; }
    .max-w-5xl { max-width: 64rem; }
    .max-w-200 { max-width: 50rem; }
    .max-w-236 { max-width: 59rem; }
    .text-balance { text-wrap: balance; }
    .text-pretty { text-wrap: pretty; }
    .leading-snug { line-height: 1.375; }
    .text-xl\/snug { font-size: 1.25rem; line-height: 1.375; }
    .text-xl\/tight { font-size: 1.25rem; line-height: 1.25; }
    .text-lg\/none { font-size: 1.125rem; line-height: 1; }
    .ring { box-shadow: 0 0 0 1px rgba(59, 130, 246, 0.5); }
    .ring-inset { box-shadow: inset 0 0 0 1px rgba(59, 130, 246, 0.5); }
    .bg-linear-180 { background: linear-gradient(180deg, #fef2f2 0%, #fecaca 100%); }
    .from-red-50 { --tw-gradient-from: #fef2f2; }
    .to-red-100 { --tw-gradient-to: #fee2e2; }
    .underline-offset-2 { text-underline-offset: 2px; }
    .w-2\.75 { width: 0.6875rem; }
    .transitions-colors { transition-property: color, background-color, border-color, text-decoration-color, fill, stroke; }
    .mt-15 { margin-top: 3.75rem; }
    .mb-15 { margin-bottom: 3.75rem; }
    .mt-25 { margin-top: 6.25rem; }
    .mb-20 { margin-bottom: 5rem; }
    .gap-y-17 { row-gap: 4.25rem; }
    .text-3xl\/none { font-size: 1.875rem; line-height: 1; }
    .pt-15 { padding-top: 3.75rem; }
    .pb-18 { padding-bottom: 4.5rem; }
    .bg-neutral-200 { background-color: #e5e5e5; }
    .text-sm\/snug { font-size: 0.875rem; line-height: 1.375; }
    .group-open\:rotate-45:is(.group[open] *) { transform: rotate(45deg); }
    
    /* Grid and responsive utilities */
    .md\:grid-cols-\[2fr_3fr\] { grid-template-columns: 2fr 3fr; }
    .xl\:grid-cols-\[4fr_3fr\] { grid-template-columns: 4fr 3fr; }
    @media (min-width: 768px) {
      .md\:grid-cols-\[2fr_3fr\] { grid-template-columns: 2fr 3fr; }
      .md\:grid-cols-2 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }
    @media (min-width: 1024px) {
      .lg\:grid-cols-2 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
      .lg\:grid-cols-3 { grid-template-columns: repeat(3, minmax(0, 1fr)); }
      .lg\:items-center { align-items: center; }
      .lg\:px-13 { padding-left: 3.25rem; padding-right: 3.25rem; }
    }
    @media (min-width: 1280px) {
      .xl\:max-w-6xl { max-width: 72rem; }
      .xl\:mt-24 { margin-top: 6rem; }
      .xl\:text-5xl { font-size: 3rem; line-height: 1; }
      .xl\:text-4xl { font-size: 2.25rem; line-height: 2.5rem; }
      .xl\:text-xl { font-size: 1.25rem; line-height: 1.75rem; }
      .xl\:grid-cols-\[4fr_3fr\] { grid-template-columns: 4fr 3fr; }
      .xl\:gap-5 { gap: 1.25rem; }
    }
    @media (min-width: 640px) {
      .sm\:px-10 { padding-left: 2.5rem; padding-right: 2.5rem; }
      .sm\:grid-cols-2 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }
  </style>
</head>
<body class="font-sans antialiased text-neutral-900">
<#-- New grouped component imports -->
<#import "/b-fy/templates/components/resources/resources-hero.ftl" as hero>
<#import "/b-fy/templates/components/resources/resources-featured.ftl" as featured>
<#import "/b-fy/templates/components/resources/resources-posts.ftl" as posts>
<#import "/b-fy/templates/components/resources/resources-whitepapers.ftl" as whitepapers>
<#import "/b-fy/templates/components/resources/resources-newsroom.ftl" as newsroom>
<#import "/b-fy/templates/components/resources/resources-faqs.ftl" as faqs>

<#-- HELPERS -->
<#function firstChild nodeName>
  <#if (content[nodeName])??>
    <#assign ch = (content[nodeName]?children)![] />
    <#if ch?size gt 0><#return ch[0] /></#if>
  </#if>
  <#return {} />
</#function>

<#-- FALLBACK DATA FROM USER PROVIDED TEXT -->
<#assign fbTitle = "Everything you need to understand about B‑FY's game-changing authentication protocol" />
<#assign fbDescription = "B-FY has changed the access protocol used for the past 15 years. Find key information about human authentication, privacy, and decentralized biometric technology. Explore our articles, white papers, and press materials to stay up to date on B-FY." />

<#assign fbFeaturedPost = {
  "title": "The hidden costs of identity fraud and how to avoid them",
  "description": "Identity fraud doesn't just leave visible marks on the financial statement, but it also brings a series of hidden costs that can be equally devastating. These costs range from the time spent resolving the issue to the irreversible damage to a company's reputation.",
  "image": "${ctx.contextPath}/.resources/b-fy/webresources/images/featured-post.jpg",
  "slug": "hidden-costs-identity-fraud"
} />

<#assign fbBlogPosts = [
  {
    "title": "Cybersecurity trends: an evolving landscape",
    "description": "Digital acceleration and the proliferation of cyber threats have redefined business priorities in security. In 2025, cybersecurity is set to become a critical element not only for protecting data but also for ensuring customer trust and operational continuity.",
    "category": "cybersecurity",
    "slug": "cybersecurity-trends-2025"
  },
  {
    "title": "Identity verification, a growing challenge", 
    "description": "In an increasingly complex digital environment, human identity verification and cybersecurity are essential to protect users and businesses from emerging threats. Looking towards 2025, technologies such as biometrics, artificial intelligence, and quantum computing will redefine online security.",
    "category": "biometrics",
    "slug": "identity-verification-challenge"
  },
  {
    "title": "Identity fraud: a growing threat",
    "description": "As identity fraud becomes increasingly sophisticated, organizations and individuals must be more vigilant than ever in safeguarding their data. With a rise in AI‑driven attacks and deepfakes, financial losses and digital security risks continue to escalate.",
    "category": "cybersecurity", 
    "slug": "identity-fraud-growing-threat"
  },
  {
    "title": "Human authentication: a revolutionary approach to data protection",
    "description": "Human authentication, driven by biometric technologies, is transforming digital security by offering a safer and more efficient solution to the risks posed by traditional passwords. In this context, B-FY stands out as a leader, developing an innovative technology that protects data without compromising user privacy.",
    "category": "biometrics",
    "slug": "human-authentication-revolutionary"
  },
  {
    "title": "B‑FY consolidates its presence worldwide", 
    "description": "B‑FY's solution has already proven its effectiveness in various sectors, including healthcare, banking logistics, and events, among others, in countries like Spain and Mexico. By launching its solution in the US market, B‑FY consolidates its worldwide presence and reinforces its commitment to the battle against cybercrime and identity fraud.",
    "category": "regulation",
    "slug": "bfy-consolidates-presence-worldwide"
  },
  {
    "title": "How B‑FY's human authentication transforms the traveler experience",
    "description": "The tourism industry is at the forefront of technological innovation, transforming both traveler experiences and resource management. Today, advancements such as artificial intelligence (AI), augmented reality, and biometric human authentication solutions like those offered by B‑FY are revolutionizing the interaction between travelers and service providers.",
    "category": "biometrics",
    "slug": "bfy-transforms-traveler-experience"
  },
  {
    "title": "Cybersecurity moves toward a passwordless future with B‑FY's approach",
    "description": "In an increasingly threatened digital world, companies are seeking alternatives to eliminate one of the most vulnerable elements of their systems: passwords. Through a strategy centered on biometric authentication and a passwordless approach, B‑FY aims to eliminate risks associated with stolen or compromised credentials.",
    "category": "cybersecurity",
    "slug": "passwordless-future-bfy-approach"
  },
  {
    "title": "B‑FY enters the U.S. market",
    "description": "After its successful global launch in Amsterdam, B‑FY will present its innovative Authentication as a Service (AaaS) tool at Identity Week in Washington DC. With this move, B-FY consolidates its international presence and reinforces its commitment to combating cybercrime and identity fraud.",
    "category": "regulation",
    "slug": "bfy-enters-us-market"
  },
  {
    "title": "B‑FY Introduces Revolutionary Solution to Terminate Online ID Fraud and Cybercrime",
    "description": "B‑FY's technology provides a foolproof method to identify real operators behind online transactions, ensuring 100% secure interactions. It is a solution designed for easy integration with existing cybersecurity and 2FA systems, offering a potential revenue of $145 billion annually by addressing cybercrime losses.",
    "category": "cybersecurity",
    "slug": "bfy-revolutionary-solution-terminate-fraud"
  }
] />

<#assign fbWhitePapers = [
  {
    "title": "Identity as a Service (IDaaS)",
    "description": "A new way of verifying identity is helping organizations truly authenticate people instead of simply \"matching\" certain elements the user supposedly owns or knows.",
    "image": "${ctx.contextPath}/.resources/b-fy/webresources/images/whitepaper-idaas.jpg"
  },
  {
    "title": "Entering a new era of identification", 
    "description": "The reality is that, until now, people have never truly been authenticated. We've been granting access to individuals without really knowing who they are.",
    "image": "${ctx.contextPath}/.resources/b-fy/webresources/images/whitepaper-era.jpg"
  },
  {
    "title": "Protect your business with B-FY",
    "description": "B-FY has changed the access protocol used without success for many years. Instead of comparing identity data, B-FY protects the transaction by authenticating the person requesting access, making hacking, impersonation, or physical access through identity fraud impossible.",
    "image": "${ctx.contextPath}/.resources/b-fy/webresources/images/whitepaper-business.jpg"
  }
] />

<#assign fbPressReleases = [
  {
    "title": "B‑FY passwordless biometric solution: a real gamechanger in the fight against Cybercrime",
    "date": "September 18, 2024",
    "formats": ["WORD", "PDF"]
  },
  {
    "title": "B‑FY's revolutionary solution against cybercrime, a huge success in Washington ID Week",
    "date": "September 16, 2024", 
    "formats": ["WORD", "PDF"]
  },
  {
    "title": "B‑FY introduces revolutionary solution to terminate Online ID Fraud and Cybercrime",
    "date": "September 9, 2024",
    "formats": ["WORD", "PDF"]
  },
  {
    "title": "B‑FY presents its universal solution to Online ID Fraud in Washington DC",
    "date": "September 4, 2024",
    "formats": ["WORD", "PDF"]
  },
  {
    "title": "B‑FY the biometric solution that stops Cybercrime",
    "date": "June 11, 2024",
    "formats": ["WORD", "PDF"]
  }
] />

  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="resources" />
  
  <main style="margin-top:70px;">
    <@hero.resourcesHero />
    <@featured.resourcesFeatured />
    <@posts.resourcesPosts />
    <@whitepapers.resourcesWhitePapers />
    <@newsroom.resourcesNewsroom />
    <@faqs.resourcesFAQs />
  </main>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />

</body>
</html>
