[#if content.image?has_content]
  [#assign image = damfn.getAsset(content.image)]
  [#assign imageLink = image.link]
[/#if]

<figure class="mx-auto">
    [#if content.link?has_content]
        <a href="${content.link}" target="_blank" style="text-decoration: none; color: #000000">
            <img
                decoding="async"
                src="${imageLink!}"
                alt="${content.imageAltText!}"
                srcset="${imageLink} 812w, ${imageLink} 768w, ${imageLink} 18w"
                sizes="(max-width: 812px) 100vw, 812px"
                width="812"
                height="542"
            >
        </a>
    [#else]
        <img
            decoding="async"
            src="${imageLink!}"
            alt="${content.imageAltText!}"
            srcset="${imageLink} 812w, ${imageLink} 768w, ${imageLink} 18w"
            sizes="(max-width: 812px) 100vw, 812px"
            width="812"
            height="542"
        >
    [/#if]
    <figcaption class="text-sm font-roboto">
        ${content.imageCaption!}
    </figcaption>
</figure>