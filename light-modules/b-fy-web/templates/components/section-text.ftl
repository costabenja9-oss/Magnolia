[#if content.image?has_content]
  [#assign imageLink = damfn.getAsset(content.image).link]
[/#if]
[#if content.color?has_content]
  [#assign classNames = "bg-${content.color} pt-16 pb-10"]
[/#if]
[#assign textAlignment = "text-${content.alignment!'center'}"]

<div ${classNames?has_content?then("class=\"" + classNames + "\"", "")}>
  <div class="max-w-5xl mx-auto px-6 md:px-12">
    [#if !content.hideSeparator!false]
      <div class="separator mx-auto"></div>
    [/#if]
    <div class="text-center">
      <h2 class="section-title">${content.title!}</h2>
    </div>
    <div class="section-text__content ${textAlignment}">
      ${cmsfn.decode(content).text!}
    </div>
    [#if imageLink?has_content]
      <div>
        <img
          src="${imageLink!}"
          class="mx-auto"
          alt=""
          decoding="async"
          loading="lazy"
          srcset="${imageLink!} 1024w, ${imageLink!} 300w, ${imageLink!} 768w, ${imageLink!} 18w, ${imageLink!} 1055w"
          sizes="(max-width: 800px) 100vw, 800px"
          width="800"
          height="448">
      </div>
    [/#if]
    [#if content.buttonLink?has_content && content.buttonLink.link?has_content]
      [#assign target = cmsfn.contentByPath(content.buttonLink.link, "website")!]
      [#if target?has_content]
        <div class="text-center my-10 inline-block w-full">
          <a 
            class="btn" 
            href="${ctx.contextPath}${cmsfn.link(target)!}" 
            title="${content.buttonLink.label!}" 
          >
            ${content.buttonLink.label!}
          </a>
        </div>
      [/#if]
    [/#if]        
  </div>
</div>