<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Industries | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
      line-height: 1.6;
      color: #1f2937;
      background-color: #ffffff;
    }
    
    img {
      max-width: 100%;
      height: auto;
    }
    
    a {
      color: inherit;
      text-decoration: none;
    }
    
    button {
      cursor: pointer;
      border: none;
      background: none;
      font: inherit;
    }
  </style>
</head>
<body>
  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="industries" />
  
  <main style="margin-top:70px;">
    <#-- Include component imports -->
    <#import "/b-fy/templates/components/industries/industries-hero.ftl" as hero />
    <#import "/b-fy/templates/components/industries/industries-list.ftl" as list />
    <#import "/b-fy/templates/components/industries/industries-cta.ftl" as cta />
    
    <#-- Render page sections -->
    <@hero.industriesHero />
    <@list.industriesList />
    <@cta.industriesCta />
  </main>
  
  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
