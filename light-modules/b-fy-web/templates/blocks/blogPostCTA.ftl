[#assign link = (content.link.field == "url")?then(content.link.url, damfn.getAsset(content.link.asset).link)]
[#assign alignment_class = "justify-${content.alignment!'center'}"]
<div class="w-100 mt-1 mb-12 flex ${alignment_class}">
    <a class="btn" 
        href="${link!}" 
        target="_blank" 
        rel="noreferrer noopener">
    ${content.label!}
    </a>
</div>
