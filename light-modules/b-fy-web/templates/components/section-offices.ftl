[#if content.image?has_content]
  [#assign background = damfn.getAsset(content.image)]
  [#assign backgroundLink = background.link]
[/#if]
<!-- SECTION-OFFICES -->
<div class="offices pt-16">
  <div class="separator mx-auto"></div>
  <div class="text-center">
    <h2 class="section-title">${content.title!}</h2>
  </div>
  <div>
    <img src="${backgroundLink!}" alt="" decoding="async" loading="lazy" sizes="(max-width: 1759px) 100vw, 1759px" width="1759" height="765">
    [#if content.offices?has_content]
      [#assign offices = cmsfn.children(content.offices, "mgnl:contentNode") /]
      <div class="grid grid-cols-1 md:grid-cols-${offices?size} gap-6 mt-6">
      [#list offices as office]
        [#if office.flag?has_content]
          [#assign flag = damfn.getAsset(office.flag)]
          [#assign flagLink = flag.link]
        [/#if]  
        <div class="flex flex-col">
          <div class="mx-auto">
            <img 
              src="${flagLink!}"
              alt=""
              decoding="async"
              loading="lazy"
              srcset="${flagLink!} 175w, ${flagLink!} 18w"
              sizes="(max-width: 175px) 100vw, 175px"
              width="175" height="116">
          </div>
          <p class="offices__address text-center mx-16 lg:mx-32 mt-4">${office.address!}</p>
        </div>  
      [/#list] 
      </div>
    [/#if]
  </div>
</div>