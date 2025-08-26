<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>${content.title!"B-FY | Passwordless Biometric Authentication"}</title>
    <meta name="description" content="${content.description!}" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
    <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
    <style>
        /* Scoped minimal enhancements */
        .gradient-text{background:linear-gradient(90deg,#f97316,#4f46e5);-webkit-background-clip:text;color:transparent}
        .card{box-shadow:0 4px 12px -2px rgba(0,0,0,.08);transition:.25s}
        .card:hover{transform:translateY(-4px);box-shadow:0 8px 20px -4px rgba(0,0,0,.12)}
    </style>
</head>
<#include "/b-fy/templates/components/cookie-banner.ftl" />

<body class="font-sans antialiased text-neutral-900">
<#-- Navegación reutilizable -->
<#import "/b-fy/templates/components/nav.ftl" as ui>
<#-- Component imports -->
<#import "/b-fy/templates/components/home/home-hero.ftl" as heroCmp>
<#import "/b-fy/templates/components/home/home-platform.ftl" as platformCmp>
<#import "/b-fy/templates/components/home/home-industries.ftl" as industriesCmp>
<#import "/b-fy/templates/components/home/home-testimonials.ftl" as testimonialsCmp>
<#import "/b-fy/templates/components/home/home-partners.ftl" as partnersCmp>
<#import "/b-fy/templates/components/home/home-newsletter.ftl" as newsletterCmp>
<@ui.nav currentPage="home" />

<main style="margin-top:70px;">
    <@heroCmp.homeHero />

    <#-- PLATFORM SECTION extracted to component for Astro parity -->
    <@platformCmp.homePlatform />

    <#-- INDUSTRIES SECTION extracted to component -->
    <@industriesCmp.homeIndustries />

    <#-- TESTIMONIALS SECTION extracted to component -->
    <@testimonialsCmp.homeTestimonials />

    <#-- PARTNERS SECTION extracted to component -->
    <@partnersCmp.homePartners />

    <#-- CALL TO ACTION (universal component) -->
    <#import "/b-fy/templates/components/cta.ftl" as cmp />
    <@cmp.callToAction 
        tagline="WHAT ARE YOU WAITING FOR?" 
        title="Join the new era of authentication" 
        description="Discover how B-FY can transform the security of your business. Schedule a meeting or request a demo for more information." 
        primaryLabel="Contact us" 
        primaryLink="/contact" 
        secondaryLabel="Get a demo" 
        secondaryLink="/contact" />

    <#-- NEWSLETTER COMPONENT (Astro parity) -->
    <@newsletterCmp.homeNewsletter />
</main>

<#import "/b-fy/templates/components/footer.ftl" as layout />
<@layout.siteFooter />

<!-- Redirection script -->
<script>
  document.addEventListener("DOMContentLoaded", function() {
    if (location.pathname === "/" || location.pathname === "") {
      location.replace("/home");
    }
  });
</script>
</body>
</html>
