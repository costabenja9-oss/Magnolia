[#assign alignment = content.alignment!"left"]
[#if content.image?has_content]
  [#assign image = damfn.getAsset(content.image)]
  [#assign imageLink = image.link]
[/#if]

<!-- BANNER JUMBO -->
<div class="w-3/5 mx-auto">
  <div class="grid grid-cols-1 lg:grid-cols-2 gap-x-11 mx-auto">
    [#if content.blocks?has_content]
      [#assign blocks = cmsfn.children(content.blocks, "mgnl:contentNode") /]
      <div class="${(alignment == "left")?then("order-first", "order-last")}">
        <div class="grid grid-cols-1 gap-y-6">
          [#list blocks as block]
            <div>
              <div class="border-t-4 border-primary w-1/5"></div>
              <h2 class="text-black font-raleway text-2xl font-extrabold text-left">${block.title!}</h2>
              <div class="text-oslo font-condensed font-light text-left">
                ${cmsfn.decode(block).text!}
              </div>
            </div>
          [/#list]
        </div>
      </div>
    [/#if]
    <div>
      <img
        src="${imageLink!}"
        alt=""
        decoding="async"
        loading="lazy"
        srcset="${imageLink!} 1065w, ${imageLink!} 262w, ${imageLink!} 893w, ${imageLink!} 768w, ${imageLink!} 10w"
        sizes="(max-width: 1065px) 100vw, 1065px"
        width="1065"
        height="1221">
    </div>
  </div>
</div>