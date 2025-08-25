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
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;600;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap" rel="stylesheet"> 

    ${resfn.css(["/b-fy-web/webresources/css/common/.*css"])!}
  </head>
  <body class="bg-smoke ${cmsfn.language()}">
    <header class="sticky top-0">
      [@cms.area name="navbar" /]
    </header>
    <div class="bg-white max-w-7xl mx-auto mb-12">
      [#-- GDPR --]
      [@cms.area name="gdpr" /]
      <div class="px-5 lg:px-16 py-8">
        [#-- TITLE --]
        <div class="pt-16 pb-20">
          <h1 class="font-raleway text-6xl font-extrabold text-center uppercase">${content.title!}</h1>
        </div>

        [#-- CONTENTS --]
        <div class="mx-auto">
          [#if content.cards?hasContent && content.cards?size > 0]
            [#assign cards = cmsfn.children(content.cards, "mgnl:contentNode") /]
            [#assign gridColsLg = (cards?size > 3)?then(4, 3) ]
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-${gridColsLg} gap-8">
              [#list cards as card]
                <div class="flex flex-col pb-4 bg-smoke">
                  <div class="flex flex-col pt-4 mb-6 px-3">
                    <h4 class="text-lg font-raleway font-semibold">${card.summary!}</h4>
                    [#if card.date?hasContent]
                      <time class="text-oslo text-sm mr-auto pt-2" datetime="${card.date?datetime?isoLocal}">
                        ${card.date?string(i18n.get("date-format"))}
                      </time>
                    [/#if]
                  </div>
                  [#if card.assetResource?hasContent]
                    [#assign asset = damfn.getAsset(card.assetResource)]
                    <a 
                      class="btn w-fit mx-auto mb-4 mt-auto" 
                      href="${asset.link!}" 
                      title="" 
                      target="_blank"
                    >
                      ${card.buttonLabel!i18n.get("b-fy-web.pages.press.see-more")}
                    </a>
                  [/#if]
                </div>
              [/#list]
            </div>
          [/#if]

        </div>
      </div>
    </div>
    <!-- FOOTER -->
    <footer>
      [@cms.area name="footer" /]
    </footer>
    ${resfn.js(["/b-fy-web/webresources/js/common/.*js"])!}
  </body>
</html>
