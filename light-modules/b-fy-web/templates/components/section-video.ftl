<div class="mx-auto max-w-[800px]">
  [#if content.youtube.field?has_content]
    <figure class="mx-auto">
      [#if content.youtube.field == "url"]
        <iframe 
            class="w-full aspect-video" 
            title="" 
            width="800" 
            height="450" 
            src="${content.youtube.url!}" 
            frameborder="0" 
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
            allowfullscreen>
        </iframe>
      [/#if]
      [#if content.youtube.field == "embed"]
          ${cmsfn.decode(content.youtube).embed!}
      [/#if]
    </figure>
  [/#if]
  <div class="text-center font-roboto text-lg font-light px-6">
    ${cmsfn.decode(content).text!}
  </div>
</div>