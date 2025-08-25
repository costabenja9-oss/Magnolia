[@cms.page /]

[#assign location = '/']
[#if content.redirect?has_content]
  [#assign pageNode = cmsfn.contentById(content.redirect)!]
  [#if pageNode?has_content]
      [#assign location = cmsfn.link(pageNode)!]
  [/#if]
[/#if]

[#if cmsfn.editMode]
  <p>Redirection to</p>
  <b>${location!}</b>
[#else]
  [#if location?has_content]
    ${ctx.getResponse().setStatus(302)}
    ${ctx.getResponse().setHeader('Location', location)}
  [/#if]
[/#if]