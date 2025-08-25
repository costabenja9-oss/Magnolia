[#if content.video?has_content]
    <figure class="mx-auto">
        [#if content.video.field == "url"]
            <iframe 
                class="w-full aspect-video" 
                title="" 
                width="800" 
                height="450" 
                src="${content.video.url!}" 
                frameborder="0" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                allowfullscreen>
            </iframe>
        [/#if]
        [#if content.video.field == "embed"]
            ${cmsfn.decode(content.video).embed!}
        [/#if]
    </figure>
[/#if]