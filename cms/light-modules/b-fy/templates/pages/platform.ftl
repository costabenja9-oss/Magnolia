<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Platform | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  <style>
    /* Platform page styles matching Astro exactly */
    .section-title{background:linear-gradient(90deg,#4f46e5,#f97316);-webkit-background-clip:text;color:transparent}
    .tile{position:relative;overflow:hidden;border:1px solid #e5e7eb;border-radius:12px;padding:1.25rem;transition:.25s;backdrop-filter:blur(4px)}
    .tile:hover{box-shadow:0 6px 18px -4px rgba(0,0,0,.15);transform:translateY(-4px)}
    .comparison-table th{font-size:.75rem;letter-spacing:.05em}
    .badge{display:inline-block;padding:.35rem .65rem;border-radius:9999px;font-size:.625rem;font-weight:600;text-transform:uppercase;letter-spacing:.05em;background:#eef2ff;color:#4338ca}
    
    /* Enhanced platform styles for new design */
    .bg-gradient-to-br { background-image: linear-gradient(to bottom right, var(--tw-gradient-stops)); }
    .from-orange-100 { --tw-gradient-from: #fed7aa; --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to, rgba(254, 215, 170, 0)); }
    .to-orange-200 { --tw-gradient-to: #fecaca; }
    .from-gray-900\/80 { --tw-gradient-from: rgba(17, 24, 39, 0.8); --tw-gradient-stops: var(--tw-gradient-from), var(--tw-gradient-to, rgba(17, 24, 39, 0)); }
    .to-gray-900\/60 { --tw-gradient-to: rgba(17, 24, 39, 0.6); }
    .bg-white\/90 { background-color: rgba(255, 255, 255, 0.9); }
    .bg-black\/50 { background-color: rgba(0, 0, 0, 0.5); }
    .backdrop-blur-sm { backdrop-filter: blur(4px); }
    .rounded-2xl { border-radius: 1rem; }
    .shadow-2xl { box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25); }
    .group:hover .group-hover\:scale-110 { transform: scale(1.1); }
    .ml-1 { margin-left: 0.25rem; }
    
    /* Tab navigation styles */
    .tab-active {
      background-color: #fff5f5;
      border-color: #fed7d7;
      color: #ea580c;
      position: relative;
    }
    .tab-active::after {
      content: '';
      position: absolute;
      bottom: -6px;
      left: 50%;
      transform: translateX(-50%) rotate(45deg);
      width: 12px;
      height: 12px;
      background-color: #ea580c;
    }
    
    /* Additional utility classes for exact Astro parity */
    .size-15 { width: 3.75rem; height: 3.75rem; }
    .h-17 { height: 4.25rem; }
    .w-3\/4 { width: 75%; }
    .gap-15 { gap: 3.75rem; }
    .mb-26 { margin-bottom: 6.5rem; }
    .mt-18 { margin-top: 4.5rem; }
    .pb-15 { padding-bottom: 3.75rem; }
    .py-15 { padding-top: 3.75rem; padding-bottom: 3.75rem; }
    .my-26 { margin-top: 6.5rem; margin-bottom: 6.5rem; }
    .max-w-108 { max-width: 27rem; }
    .max-w-240 { max-width: 60rem; }
    .xl\:text-5xl { font-size: 3rem; line-height: 1; }
    @media (min-width: 1280px) { .xl\:text-5xl { font-size: 3rem; line-height: 1; } }
    .text-xl\/tight { font-size: 1.25rem; line-height: 1.25; }
    .text-xl\/snug { font-size: 1.25rem; line-height: 1.375; }
    .leading-snug { line-height: 1.375; }
    .text-balance { text-wrap: balance; }
    .text-pretty { text-wrap: pretty; }
    .not-last\:border-b:not(:last-child) { border-bottom-width: 1px; }
    .group:hover .group-hover\:bg-orange-600 { background-color: #ea580c; }
    .transition-colors { transition-property: color, background-color, border-color, text-decoration-color, fill, stroke; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms; }
    .duration-75 { transition-duration: 75ms; }
    .hover\:bg-red-800:hover { background-color: #991b1b; }
    .hover\:text-orange-600:hover { color: #ea580c; }
    .-z-1 { z-index: -1; }
    .bg-linear-\(--color-neutral-100\) { background: linear-gradient(180deg, var(--color-neutral-100, #f5f5f5) 0%, transparent 100%); }
    .bg-size-\[auto_60\%\] { background-size: auto 60%; }
    .max-w-6xl\! { max-width: 72rem !important; }
    .bg-linear-240 { background: linear-gradient(240deg, #ffffff 0%, #fee2e2 100%); }
    .transition-colors { transition-property: color, background-color, border-color, text-decoration-color, fill, stroke; transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1); transition-duration: 150ms; }
    
    /* Grid and responsive utilities */
    .md\:grid-cols-\[9fr_8fr\] { grid-template-columns: 9fr 8fr; }
    .md\:grid-cols-\[8fr_9fr\] { grid-template-columns: 8fr 9fr; }
    @media (min-width: 768px) {
      .md\:grid-cols-\[9fr_8fr\] { grid-template-columns: 9fr 8fr; }
      .md\:grid-cols-\[8fr_9fr\] { grid-template-columns: 8fr 9fr; }
      .md\:row-start-1 { grid-row-start: 1; }
      .md\:ml-12 { margin-left: 3rem; }
      .md\:mr-12 { margin-right: 3rem; }
      .md\:text-right { text-align: right; }
      .md\:items-center { align-items: center; }
      .md\:grid-cols-2 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
      .md\:mb-32 { margin-bottom: 8rem; }
    }
    
    /* Layout specific */
    .gap-y-10 { row-gap: 2.5rem; }
    .pl-\[1em\] { padding-left: 1em; }
    .marker\:font-bold ::marker { font-weight: 700; }
    .marker\:text-orange-600 ::marker { color: #ea580c; }
    .list-decimal { list-style-type: decimal; }
    .\*\:p-7 > * { padding: 1.75rem; }
    .\*\:py-3 > * { padding-top: 0.75rem; padding-bottom: 0.75rem; }
    .\*\:px-5 > * { padding-left: 1.25rem; padding-right: 1.25rem; }
    .lg\:\*\:px-7 > * { padding-left: 1.75rem; padding-right: 1.75rem; }
    @media (min-width: 1024px) {
      .lg\:\*\:px-7 > * { padding-left: 1.75rem; padding-right: 1.75rem; }
      .lg\:grid-cols-3 { grid-template-columns: repeat(3, minmax(0, 1fr)); }
      .lg\:grid-cols-2 { grid-template-columns: repeat(2, minmax(0, 1fr)); }
      .lg\:text-xl\/tight { font-size: 1.25rem; line-height: 1.25; }
      .lg\:text-lg { font-size: 1.125rem; }
      .lg\:gap-x-24 { column-gap: 6rem; }
      .lg\:px-13 { padding-left: 3.25rem; padding-right: 3.25rem; }
    }
  </style>
</head>
<body class="font-sans antialiased text-neutral-900">

<#-- New grouped component imports -->
<#-- Modular imports for parity macros -->
<#import "/b-fy/templates/components/platform/platform-hero.ftl" as hero>
<#import "/b-fy/templates/components/platform/platform-features.ftl" as features>
<#import "/b-fy/templates/components/platform/platform-auth-process.ftl" as process>
<#import "/b-fy/templates/components/platform/platform-table.ftl" as table>
<#import "/b-fy/templates/components/platform/platform-links.ftl" as links>
<#import "/b-fy/templates/components/platform/platform-video.ftl" as video>
<#import "/b-fy/templates/components/platform/platform-details.ftl" as details>
<#import "/b-fy/templates/components/platform/platform-customer.ftl" as customer>

<#-- HELPERS -->
<#function firstChild nodeName>
  <#if (content[nodeName])??>
    <#assign ch = (content[nodeName]?children)![] />
    <#if ch?size gt 0><#return ch[0] /></#if>
  </#if>
  <#return {} />
</#function>

<#-- FALLBACK DATA FROM ASTRO TEXT -->
<#assign fbHeroTitle = "A unique authentication platform" />
<#assign fbHeroDesc = "B-FY authenticates people, certifying the truth of their identity, through a simple and easy-to-use design, integrated with online applications. With B-FY, there are no credentials that can be stolen or forged." />

<#assign fbFeatureBlocks = [
  {"title":"Prevention of malicious AI and phishing attacks","description":"It blocks all malicious generative AI attacks, ensuring access only to legitimate websites and access points."},
  {"title":"Protection against account takeover","description":"Each transaction is dynamically verified to neutralize cyberattacks and protect users. B-FY, OpenID certified, guarantees security and interoperability, simplifying SSO and advanced identity management with easy and reliable implementation."},
  {"title":"Zero Trust model with OpenID certification","description":"It eliminates reliance on central databases, reducing the risk of data breaches and preventing account takeover attacks (ATO)."},
  {"title":"User-controlled biometrics","description":"Users maintain complete control over their biometric data, ensuring privacy and security while enabling seamless authentication experiences."}
] />

<#assign fbTabs = [
  "Customer authentication",
  "Employee authentication", 
  "User-controlled biometrics",
  "Effective against ATO, AI-driven fraud and phishing",
  "Compliance",
  "Decentralized authentication"
] />

<#assign fbComparisonHeaders = ["Traditional 2FA (SMS, OTP, Apps)","Passwords","Passwordless by design","Decentralized security","Fraud and AI attack prevention","Frictionless user experience","Protection against ATO","User transparency","Easy integration"] />

<#assign fbComparisonMatrix = [
  {"capability":"Passwordless by design","legacy2fa":"✕","passwords":"✕","bfy":"✔"},
  {"capability":"Decentralized (no shared secrets)","legacy2fa":"✕","passwords":"✕","bfy":"✔"},
  {"capability":"Prevents phishing / AI spoofing","legacy2fa":"△","passwords":"✕","bfy":"✔"},
  {"capability":"Blocks ATO (account takeover)","legacy2fa":"△","passwords":"✕","bfy":"✔"},
  {"capability":"Eliminates credential reuse","legacy2fa":"△","passwords":"✕","bfy":"✔"},
  {"capability":"Frictionless UX","legacy2fa":"✕","passwords":"✕","bfy":"✔"},
  {"capability":"Open standards (OIDC)","legacy2fa":"△","passwords":"✕","bfy":"✔"},
  {"capability":"No OTP fatigue / SIM swap risk","legacy2fa":"✕","passwords":"✕","bfy":"✔"},
  {"capability":"Real-time fraud detection","legacy2fa":"✕","passwords":"✕","bfy":"✔"}
] />

<#assign fbProcessTitle = "Simple and frictionless authentication" />
<#assign fbProcessIntro = "A smarter and safer way to authenticate:" />
<#assign fbProcessSteps = [
  {"title":"The user scans the B‑FY QR code at an online or physical access point."},
  {"title":"Biometric verification is performed through the institution's mobile app (with B‑FY libraries integrated)."},
  {"title":"B‑FY grants direct access to the user, not just their credentials."},
  {"title":"Why it matters: Hackers can steal credentials, but they cannot replicate a real person."},
  {"title":"B-FY renders identification credentials useless to hackers. Even if leaked, they are worthless without biometric validation."}
] />

<#assign fbIntegrationTitle = "How is B-FY integrated?" />
<#assign fbIntegrationParagraphs = [
  "B-FY Platform offers a well-documented API/OpenID that allows companies to quickly integrate its authentication technology into their platforms (web, mobile, or physical access points).",
  "No additional hardware - Since B-FY leverages existing smartphone biometric capabilities, companies don't need to invest in specialized hardware or readers.",
  "Omnichannel compatibility - B-FY's solution works across multiple platforms and channels, ensuring companies can integrate it into websites, mobile apps, and even physical environments.",
  "Fast deployment and scalability - Whether for a startup or a large enterprise, B-FY's architecture allows fast and scalable deployment for millions of users without disrupting existing workflows.",
  "Enterprise-grade security - Built with enterprise security requirements in mind, B-FY provides comprehensive audit logs, compliance reporting, and administrative controls.",
  "Developer-friendly SDKs - Complete software development kits available for all major platforms including iOS, Android, Web (JavaScript), Python, .NET, and Java."
] />

<#assign fbBenefits = [
  {"title":"Be your own identity authority","description":"Become your own Identity Provider and manage access with full autonomy."},
  {"title":"Maximize your revenue","description":"With B-FY, optimize your operational profitability and take your bottom line to a new level."},
  {"title":"Break free from vendor lock‑in","description":"Say goodbye to dependencies on large providers and regain control of your tech strategy."},
  {"title":"Get guaranteed financial security","description":"Protect every transaction and safeguard your revenue with an impenetrable system."},
  {"title":"Ensure passwordless authentication","description":"Your users will enjoy an ultra-fast, simple, and seamless experience, with zero passwords."},
  {"title":"Say goodbye to hidden costs","description":"Completely eliminate expenses from fraud, data breaches, and account takeovers."}
] />

<#assign fbLinksNav = [
  {"label":"Features","anchor":"features"},
  {"label":"Capabilities","anchor":"capabilities"}, 
  {"label":"Process","anchor":"process"},
  {"label":"Integration","anchor":"integration"},
  {"label":"Benefits","anchor":"benefits"},
  {"label":"Prevention","anchor":"prevention"}
] />

<#assign fbKnowMoreTitle = "Want to know more?" />
<#assign fbServiceTitle = "B-FY: At the Service of Its Clients" />
<#assign fbServiceDesc = "Every company has unique needs, and at B-FY we adapt to their infrastructure to offer a robust and efficient authentication solution." />

  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="platform" />
  
  <main style="margin-top:70px;">
    <section class="min-h-svh mt-12 mb-24 pb-15 px-5 bg-linear-(--color-neutral-100) bg-size-[auto_60%] bg-no-repeat bg-bottom text-center sm:px-10 lg:px-13 xl:mt-24">
      <@hero.platformHero wrap=false />
      <@features.platformFeatures />
      <@links.platformLinks />
      <@video.platformVideo class="max-w-6xl! mx-auto mb-18" id=(content.videoId)!"dQw4w9WgXcQ" />
      <@table.platformTable />
      <@process.platformAuthProcess />
    </section>
    <@details.platformDetails />
    <@customer.platformCustomer />
  </main>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />

</body>
</html>
