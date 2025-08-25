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
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap" rel="stylesheet"> 

    ${resfn.css(["/b-fy-web/webresources/css/common/.*css"])!}
    <style>
      .form {
          background-image: url('${ctx.contextPath}/.resources/b-fy-web/webresources/assets/img/bg-contact.jpg');
      }
    </style>

  </head>
  <body>
    [#-- MODAL FORM --]
    <div class="modal relative z-10" aria-labelledby="modal-title" role="dialog" aria-modal="true">
        <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"></div>
        <div class="fixed inset-0 z-10 overflow-y-auto">
            <div class="flex min-h-full justify-center p-4 text-center items-center sm:p-0">
                <div class="modal__dialog">
                    <button class="modal__dialog__close">
                        <span></span>
                    </button>
                    <div style="width:100%" class="h-[90vh] md:h-[80vh] sm:w-2/5 p-6 rounded-md">
                        <iframe name="modal__form" style="width:100%;height:100%" src=""></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    ${resfn.js(["/b-fy-web/webresources/js/modal.js"])!}
    
    <div class="mx-auto h-full">
      [#-- HERO --]
      [@cms.area name="hero" /]
      <div class="grid grid-flow-row gap-y-8 mt-8">
        [#-- MAIN --]
        [@cms.area name="main" /]
      </div>
    </div>
  </body>
</html>
