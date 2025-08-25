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
    <title>${content.windowTitle!}</title>
    <meta name="description" content="${content.description!""}" />
    <meta name="keywords" content="${content.keywords!""}" />
    <link rel="icon" href="${ctx.contextPath}/.resources/b-fy-web/webresources/favicon.ico" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap" rel="stylesheet"> 

    ${resfn.css(["/b-fy-web/webresources/css/common/.*css"])!}
  </head>
  <body class="bg-smoke">
    <header class="sticky top-0">
      [@cms.area name="navbar" /]
    </header>
    [#-- GDPR --]
    [@cms.area name="gdpr" /]
    <div class="bg-white max-w-7xl mx-auto mb-12">
      <div class="px-16">
        [@cms.area name="main" /]
      </div>
    </div>
    <footer>
      [@cms.area name="footer" /]
    </footer>
    ${resfn.js(["/b-fy-web/webresources/js/common/.*js"])!}
  </body>
</html>
