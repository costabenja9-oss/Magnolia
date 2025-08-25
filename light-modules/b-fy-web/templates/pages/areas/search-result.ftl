[#-- ASSIGNMENTS --]
[#include "/b-fy-web/templates/macros/listStories.ftl"]
[#assign categoryName = ctx.getParameter('category')!?html]
[#assign authorName = ctx.getParameter('author')!?html]
[#assign stories = []]

[#-- NOTA: Protege de uso fraudulento de busqueda por categoria --]
[#assign categoryNode = cmsfn.nodeByPath('/' + categoryName, "category")!]
[#if categoryNode?hasContent && categoryNode.getPrimaryNodeType().isNodeType("mgnl:category")] 
  [#assign queryWhere = queryWhere?hasContent?then(queryWhere + " AND ", " WHERE ") + "s.[category] = '" + categoryNode.getPath() + "' "]
  [#assign title = i18n.get("b-fy-web.pages.search.category") + ": " + cmsfn.asContentMap(cmsfn.wrapForI18n(categoryNode)).displayName!]
[/#if]

[#-- NOTA: Protege de uso fraudulento de busqueda por autor --]
[#assign employeeNode = cmsfn.nodeByPath('/' + authorName, "bfy-team")!]
[#if employeeNode?hasContent && employeeNode.getPrimaryNodeType().isNodeType("bfy:team")] 
  [#assign queryWhere = queryWhere?hasContent?then(queryWhere + " AND ", " WHERE ") + "s.[teamMember] = '" + employeeNode.getIdentifier() + "' "]
  [#assign title = i18n.get("b-fy-web.pages.search.author") + ": " + cmsfn.asContentMap(cmsfn.wrapForI18n(employeeNode)).name!]
[#elseIf authorName?hasContent]
  [#assign queryWhere = queryWhere?hasContent?then(queryWhere + " AND ", " WHERE ") + "s.[author] = '" + authorName + "' "]
  [#assign title = i18n.get("b-fy-web.pages.search.author") + ": " + authorName]
[/#if]

[#assign query = "SELECT * FROM [mgnl:composition] AS s " + queryWhere!" 1 = 2 " + " ORDER BY s.[created] DESC"]
[#assign __stories = cmsfn.search("stories", query, "JCR-SQL2", "mgnl:composition")!]
[#list __stories! as __story]
    [#assign stories = stories + [cmsfn.asContentMap(__story)]]
[/#list]

<div class="py-8">
  <div class="pb-24">
    <h1 class="font-raleway text-7xl font-extrabold text-center uppercase">${title!}</h1>
  </div>
  [@listStories stories! /]
</div>