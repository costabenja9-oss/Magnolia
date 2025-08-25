[#if content.footerLogo?has_content]
  [#assign footerLogo = damfn.getAsset(content.footerLogo)]
  [#assign footerLogoLink = footerLogo.link]
[/#if]
[#assign decoded = cmsfn.decode(content)]

[#include "/b-fy-web/templates/shared/functions.ftl"]
[#assign domain = getDomain()]

<!DOCTYPE html>
<html>
  <head>
    [@cms.page /]
  </head>
  <body>
      <table style="width:100%; border-collapse:collapse; border:0; border-spacing:0; background:#ffffff; font-family:'Arial', 'sans-serif'; margin-bottom: 3rem;">
          <tr>
              <td>
                  <div style="height:3px; width: 100%; margin-bottom: 8px; background-color:#fe5000"></div>
              </td>
          </tr>
          [@cms.area name="hero" /]
          <tr>
              <td>
                  <table style="margin: 0.5rem 4rem 0 4rem;">
                      [@cms.area name="main" /]
                      <tr>
                          <td style="text-align: center">
                              <p>${content.disclaim!i18n.get('newsletter.disclaim')}</p>
                          </td>
                      </tr>
                  </table>
              </td>
          </tr>
          <tr>
              <td>
                  <div style="height: 3px; width: 100%; margin-bottom: 8px; background-color:#fe5000"></div>
              </td>
          </tr>
          [@cms.area name="footer" /]
      </table>
  </body>
</html>