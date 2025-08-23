<#-- About Us Hero (title + description + carousel placeholder) -->
<#macro aboutHero title description carouselItems=[]>
<section class="mt-12 px-5 text-center sm:px-10 lg:px-13 xl:mt-24">
  <h1 class="max-w-xl mx-auto font-bold text-3xl xl:text-5xl">${title}</h1>
  <p class="max-w-3xl mt-8 mx-auto text-lg xl:text-xl">${description}</p>
  <#if carouselItems?has_content>
    <div class="mt-10 grid grid-cols-2 md:grid-cols-4 gap-4">
      <#list carouselItems as item>
        <div class="aspect-video bg-neutral-200 rounded overflow-hidden flex items-center justify-center text-sm text-neutral-500">${item.title!item_index+1}</div>
      </#list>
    </div>
  </#if>
</section>
</#macro>
