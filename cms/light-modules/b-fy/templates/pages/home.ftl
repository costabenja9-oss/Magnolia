<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>${content.title!"B-FY | Passwordless Biometric Authentication"}</title>
    <meta name="description" content="${content.description!}" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <#-- TODO: Incluir hoja de estilos compilada (Tailwind/utility CSS). -->
        <#-- CSS principal del light module usando contextPath para evitar problemas de prefijos -->
    <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
    <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
        <#-- Fallback temporal: activar Tailwind CDN si el archivo local aún no contiene las utilidades (quitar en producción) -->
        <script>
            // Descomenta para pruebas rápidas si no ves estilos:
            // document.write('<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@3.4.10/dist/tailwind.min.css" />');
        </script>
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
<#-- Updated component imports pointing to grouped folder (optional future use) -->
<#import "/b-fy/templates/components/home/home-hero.ftl" as heroCmp>
<#import "/b-fy/templates/components/home/home-platform.ftl" as platformCmp>
<#import "/b-fy/templates/components/home/home-industries.ftl" as industriesCmp>
<#import "/b-fy/templates/components/home/home-testimonials.ftl" as testimonialsCmp>
<#import "/b-fy/templates/components/home/home-partners.ftl" as partnersCmp>
<#import "/b-fy/templates/components/home/home-newsletter.ftl" as newsletterCmp>
<@ui.nav currentPage="home" />

<main style="margin-top:70px;">
        <#-- DEFAULT FALLBACKS (se usan si el autor no cargó contenido) -->

        <#-- PLATFORM fallbacks -->
        <#assign fallbackPlatform = {
            "tagline":"Authenticate the real person behind the digital identity",
            "title":"Take back control over the security of your business, your operations and your revenue",
            "description":"B-FY goes beyond passwords and tokens. It allows you to authenticate the real person behind every transaction, access or interaction — securely, in compliance with regulations, and without storing personal or biometric data.",
            "features":[
                {
                    "title":"Identify people, not data",
                    "description":"Our passwordless solution offers a secure, user-friendly and frictionless experience, eliminating the complexity of traditional identification.",
                    "link":"/platform#customer-authentication"
                },
                {
                    "title":"Secure access in any environment",
                    "description":"Put an end to all forms of online fraud, including bots, AI use, phishing and other emerging attack vectors that are causing irreparable damage to users and institutions alike.",
                    "link":"/platform#employee-authentication"
                },
                {
                    "title":"Your phone is your key",
                    "description":"With B-FY, biometrics always remain under the user's control, using native capabilities on their device to ensure secure authentication of the legitimate user.",
                    "link":"/platform#user-controlled-biometrics"
                },
                {
                    "title":"Prevents identity impersonation",
                    "description":"Effective against ATO, AI-driven fraud and phishing: strong protection against account takeover, phishing attacks, and threats driven by generative AI.",
                    "link":"/platform#ato-protection"
                },
                {
                    "title":"Privacy ensured",
                    "description":"Complies with national and European data privacy regulations using secure, offline-protected biometrics stored only on the user’s device.",
                    "link":"/platform#compliance"
                },
                {
                    "title":"Aligned with Zero Trust",
                    "description":"Decentralized biometric approach gives users full control; no centralized biometric repositories to attack or breach.",
                    "link":"/platform#decentralized-authentication"
                }
            ]
        } />

        <#-- INDUSTRIES fallbacks -->
        <#assign fallbackIndustries = {
            "tagline":"B‑FY in action",
            "title":"A solution that adapts to every sector",
            "description":"Our technology meets the demands of different industries. B‑FY protects institutions from all types of online identity fraud, including growing attack vectors such as AI, APP, ATO, and bots.",
            "items":[
                {"name":"Financial Services","description":"Stop ATO and APP threats, MFA bombing, and other attacks and data breaches with secure decentralized biometric authentication.","link":"/industries#financial"},
                {"name":"Transport & Logistics","description":"Meet sector regulations while eliminating fraud stemming from identity theft and streamlining user experience.","link":"/industries#transport"},
                {"name":"Education","description":"Protect students and staff from ransomware, data breaches and financial fraud; streamline enrollment and secure restricted areas.","link":"/industries#education"},
                {"name":"Healthcare Services","description":"Comply with HIPAA / GDPR while protecting against medical identity theft, insurance fraud and data breaches.","link":"/industries#healthcare"}
            ]
        } />

        <#-- PARTNER PROGRAM fallbacks -->
        <#assign fallbackPartnerProgram = {
            "tagline":"Discover our partner program",
            "title":"Be part of the future of omnichannel authentication",
            "description":"B-FY is looking for strategic partners: integrators, technology providers, consultants. Expand your reach, increase client value and maximize profitability with decentralized biometrics, passwordless authentication, and advanced fraud prevention.",
            "benefits":[
                "Access to cutting‑edge technology",
                "Incentive structure",
                "Technical support and specialized training",
                "Marketing materials and resources"
            ]
        } />


    <#-- Newsletter component handles its own fallback -->

        <#-- Certificaciones fallback (usar nombres de archivos ya subidos al DAM idealmente) -->
        <#-- Si existieran rutas DAM específicas se mapearían; aquí se asume assets en webresources como fallback -->
        <#-- Helper para convertir rutas relativas o absolutas a URLs válidas de webresources -->
        <#function staticLink path>
            <#if !path?has_content>
                <#return "" />
            </#if>
            <#-- Si ya viene con /.resources lo prefixeamos con contextPath -->
            <#if path?starts_with("/.resources")>
                <#return ctx.contextPath + path />
            </#if>
            <#-- Si empieza con /images asumimos relativo a carpeta images del módulo -->
            <#if path?starts_with("/images/")>
                <#return ctx.contextPath + "/.resources/b-fy/webresources" + path />
            </#if>
            <#-- Si empieza directamente con images/ -->
            <#if path?starts_with("images/")>
                <#return ctx.contextPath + "/.resources/b-fy/webresources/" + path />
            </#if>
            <#-- Si empieza con / lo tratamos como relativo a raíz del módulo webresources -->
            <#if path?starts_with("/")>
                <#return ctx.contextPath + "/.resources/b-fy/webresources" + path />
            </#if>
            <#-- Caso general: concatenar -->
            <#return ctx.contextPath + "/.resources/b-fy/webresources/" + path />
        </#function>

        <#assign fallbackCertImages = [
            {"path":"images/iso-9001.svg", "alt":"ISO 9001"},
            {"path":"images/iso-iec-27001.svg", "alt":"ISO/IEC 27001"},
            {"path":"images/iso-iec-27701.svg", "alt":"ISO/IEC 27701"},
            {"path":"images/pacto-digital.webp", "alt":"Pacto Digital"},
            {"path":"images/incibe.webp", "alt":"INCIBE"},
            {"path":"images/openid.webp", "alt":"OpenID"}
        ] />

    <#-- Logos removed per request -->

                        <#-- Helper: intenta obtener un asset DAM por ruta absoluta, si no existe devuelve cadena vacía. Protegido contra ausencia de damfn. -->
                        <#function damLinkByPath path>
                                <#assign node = cmsfn.contentByPath(path, "dam")! />
                                <#if node?? && (damfn??)>
                                    <#attempt>
                                        <#return (damfn.link(node))!"" />
                                    <#recover>
                                        <#return "" />
                                    </#attempt>
                                </#if>
                                <#return "" />
                        </#function>

            <#-- Real DAM paths using existing assets -->
            <#assign defaultDamHeroPath = "/images/b-fys-global-launch-identity-week-amsterdam.webp" />
            <#assign damHeroLink = damLinkByPath(defaultDamHeroPath) />
    <@heroCmp.homeHero />

    <#-- PLATFORM SECTION extracted to component for Astro parity -->
    <#-- Removed outdated import to old path; using /home/home-platform.ftl already imported at top -->
    <@platformCmp.homePlatform />

    <#-- INDUSTRIES SECTION extracted to component -->
    <#-- Removed outdated import to old path; using /home/home-industries.ftl already imported at top -->
    <@industriesCmp.homeIndustries />

    <#-- TESTIMONIALS SECTION extracted to component -->
    <#-- Removed outdated import to old path; using /home/home-testimonials.ftl already imported at top -->
    <@testimonialsCmp.homeTestimonials />

        <#-- PARTNERS SECTION extracted to component -->
    <#-- Removed outdated import to old path; using /home/home-partners.ftl already imported at top -->
        <@partnersCmp.homePartners />

    <#-- CALL TO ACTION (universal component) -->
    <#import "/b-fy/templates/components/cta.ftl" as cmp />
    <@cmp.callToAction 
        tagline="Experience the new era of authentication." 
        title="Discover how B-FY can transform your company’s security." 
        description="Request a demo or contact us for more information." 
        primaryLabel="Get a demo" 
        primaryLink="/contact" 
        secondaryLabel="Contact us" 
        secondaryLink="/contact" />

    <#-- NEWSLETTER COMPONENT (Astro parity) -->
    <#-- Removed outdated import to old path; using /home/home-newsletter.ftl already imported at top -->
    <@newsletterCmp.homeNewsletter />

    <#-- CERTIFICATIONS removed per request -->

    <#-- LOGOS section removed -->
  </main>

    <#import "/b-fy/templates/components/footer.ftl" as layout />
    <@layout.siteFooter />
</body>
</html>
