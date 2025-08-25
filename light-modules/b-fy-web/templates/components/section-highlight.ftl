[#if content.backgroundColor?has_content]
    [#assign backgroundColor = "bg-${content.backgroundColor}"]
[/#if]
[#if content.textColor?has_content]
    [#assign textColor = "text-${content.textColor}"]
[/#if]

<div class="${backgroundColor!} max-w-5xl mx-auto px-2 md:px-12 py-2 rounded-lg">
    <div class="text-center font-roboto text-xl ${textColor!}">
        ${cmsfn.decode(content).text!}
    </div>
</div>