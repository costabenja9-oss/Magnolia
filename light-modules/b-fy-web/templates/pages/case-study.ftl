<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>
    [@cms.page /]

    <script>
      // Define dataLayer and the gtag function.
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      
      // Default ad_storage and analytics_storage to 'denied' as a placeholder
      gtag('consent', 'default', {
        'ad_storage': 'denied',
        'analytics_storage': 'denied'
      });
    </script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-09TVSGTH8R"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
  
      gtag('config', 'G-09TVSGTH8R');
    </script>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${content.windowTitle!content.title!}</title>
    <meta name="description" content="${content.description!""}" />
    <meta name="keywords" content="${content.keywords!""}" />

    [#-- DERIVE DOMAIN FROM SITE --]
    [#assign domain = "https://b-fy.com"]
    [#assign site=sitefn.site()]
    [#assign domains=site.domains]
    [#if domains?hasContent && (domains?size > 0)]
      [#assign domain = domains[0]]
    [/#if]

    <meta name='robots' content='index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1' />
	  <link rel="canonical" href="${domain!}${cmsfn.link(content)}/" />
    <meta property="og:locale" content="${cmsfn.language()}" />
    <meta property="og:type" content="article" />
    <meta property="og:title" content="${content.windowTitle!content.title!}" />
    <meta property="og:url" content="${domain!}${cmsfn.link(content)}/" />
    <meta property="og:site_name" content="B-FY" />

    <link rel="icon" href="${ctx.contextPath}/.resources/b-fy-web/webresources/favicon.ico" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap" rel="stylesheet"> 

    ${resfn.css(["/b-fy-web/webresources/css/common/.*css"])!}
    [#-- TODO mover a un componente específico de formulario de contacto --]
    <style>
    .form {
        background-image: url('${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/bg-contact.jpg');
    }
    </style>
  </head>
  <body class="standard ${cmsfn.language()}">
    <header class="sticky top-0">
      [@cms.area name="navbar" /]
    </header>
    <div>
      [#-- GDPR --]
      [@cms.area name="gdpr" /]
      <!-- HERO -->
      [@cms.area name="hero" /]
      <!-- CASE STUDY SUMMARY -->
      <div class="pb-8">
        <div class="w-full text-center bg-smoke"><h2 class="font-raleway text-3xl font-semibold my-0 py-8 tracking-wide">${content.title!}</h2></div> 
        <div class="mx-auto">
          [#if content.caseStudyLogo?hasContent]
            [#assign imageLink = damfn.getAsset(content.caseStudyLogo).link]
            <img src="${imageLink!}" class="mx-auto mb-0" alt="" decoding="async" loading="lazy" />
          [/#if]
          [#if content.caseStudySummary?hasContent]
            <div class="max-w-5xl mx-auto px-2 md:px-12 text-center font-roboto text-lg font-light">
              ${cmsfn.decode(content).caseStudySummary!}
            </div>
          [/#if]
        </div>
      </div>
      <!-- MAIN -->
      <div class="mx-auto grid grid-flow-row my-12">
        [@cms.area name="main" /]
      </div>
    </div>
    <!-- FOOTER -->
    <footer>
      [@cms.area name="footer" /]
    </footer>
    ${resfn.js(["/b-fy-web/webresources/js/common/.*js"])!}
  </body>
</html>
