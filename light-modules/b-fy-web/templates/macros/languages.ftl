[#macro languages]
    <div class="languages absolute top-0 right-0 z-10 rounded-b-md shadow-md shadow-jungle bg-gradient-to-b from-alabaster to-iron pt-1 grid grid-cols-1">
    [#-- In case of Virtual Uri of Blog Post, build the URL --]
      [#assign isVirtualUri = state.originalURI != state.currentURI]
      [#assign template = cmsfn.metaData(content, "mgnl:template")!]
      [#assign isBlogPost = template == "b-fy-web:pages/blog-post"]
      [#if isVirtualUri && isBlogPost]
        [#assign virtualUri = "/blog/${ctx.getParameter('story')!}"]
      [/#if]
      [#assign currentLanguage = cmsfn.language()]
      <div class="font-roboto text-charcoal text-[90%] px-4 py-1">${i18n.get("language-selector.${currentLanguage}")}</div>
      [#assign localizedLinks = cmsfn.localizedLinks()!]
      [#if localizedLinks?has_content]
        [#assign languages = localizedLinks?keys]
        [#list languages?filter(l -> !cmsfn.isCurrentLocale(l)) as lang]
          [#assign href = (virtualUri?has_content)?then("/${lang}${virtualUri}", "${localizedLinks[lang]!}")]
          <a href="${href!}" class="selectable font-roboto text-charcoal text-[90%] px-4 py-1 hover:text-white hover:bg-boulder">${i18n.get("language-selector.${lang}")}</a>
        [/#list]
      [/#if]
    </div>
[/#macro]