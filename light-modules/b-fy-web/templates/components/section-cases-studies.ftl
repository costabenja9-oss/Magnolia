[#assign currentNode = cmsfn.asJCRNode(content)]
[#assign rootPageNode = cmsfn.root(currentNode, "mgnl:page")!]
[#if rootPageNode??]
  [#assign caseStudyTemplate = "b-fy-web:pages/case-study"]
  [#assign caseStudyPages=cmsfn.contentListByTemplateId(rootPageNode, caseStudyTemplate)?filter(cs -> !currentNode.getPath()?starts_with(cs.getPath()))]
  [#assign hideTitle = cmsfn.metaData(cmsfn.page(currentNode), "mgnl:template") != caseStudyTemplate]
[/#if]
<div class="bg-smoke pt-16 pb-10">
  <div class="max-w-5xl mx-auto px-2 md:px-12">
    [#if !hideTitle]
      <div class="mb-8">
        <div class="separator mx-auto"></div>
        <div class="text-center">
            <h2 class="section-title">${content.title!i18n.get("b-fy-web.components.cases-studies.more-cases-studies")}</h2>
        </div>
      </div>
    [/#if]
    [#if caseStudyPages??]
      [#assign gridColsXl = (caseStudyPages?size < 3)?then(caseStudyPages?size, 3) ]
      <div class="grid grid-cols-1 md:grid-cols-${gridColsXl} gap-6 lg:gap-x-12 justify-center">
      [#list caseStudyPages as __caseStudy]
        [#assign caseStudy = cmsfn.asContentMap(__caseStudy)]
        <div class="mx-auto">
          [#if caseStudy.caseStudyLogo??]
            [#assign imageLink = damfn.getAsset(caseStudy.caseStudyLogo).link]
            <img src="${imageLink!}" class="mx-auto mb-6" alt="" decoding="async" loading="lazy" />
          [/#if]
          <h2 class="font-raleway font-extrabold text-sm text-center">${caseStudy.title}</h2>
          <div class="flex flex-col mt-8">
            <a href="${ctx.contextPath}${cmsfn.link(__caseStudy)!}" class="btn-large font-xs mx-auto">
              ${i18n.get("b-fy-web.components.blog.see-more")}
            </a>
          </div>
        </div>
      [/#list]
      </div>
    [/#if]

  </div>
</div>