<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Developers | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
</head>
<body>
  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="developers" />
  <main style="margin-top:70px;">
    <#import "/b-fy/templates/components/developers/developers-hero.ftl" as hero />
    <#import "/b-fy/templates/components/developers/developers-details.ftl" as details />
    <#import "/b-fy/templates/components/developers/developers-features.ftl" as features />
    <#import "/b-fy/templates/components/developers/developers-architecture.ftl" as arch />
    <#import "/b-fy/templates/components/developers/developers-faqs.ftl" as faqs />
    <@hero.developersHero />
    <@details.developersDetails />
    <@features.developersFeatures />
    <@arch.developersArchitecture />
    <@faqs.developersFaqs />
  </main>
  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
