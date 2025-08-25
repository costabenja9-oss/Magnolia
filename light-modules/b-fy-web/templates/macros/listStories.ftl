[#macro listStories stories]
    [#assign gridCols = (stories?size > 3 )?then(4, 3)]
    [#-- RENDERING --]
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-${gridCols} gap-8">
        [#list stories! as __story]
        [#assign story = cmsfn.wrapForI18n(__story)]

        <div class="flex flex-col bg-smoke">
            [#if story.imagesource?hasContent]
                [#assign image = damfn.getAsset(story.imagesource)]
                <a href="${cmsfn.linkPrefix(story)}/blog/${story}" title="${story.title!}">
                    <img src="${image.link!}" alt="${story.imagealtText!}">
                </a>
            [/#if]
            <div class="pt-4 px-2">
            <h4 class="text-lg font-raleway font-extrabold uppercase">${story.title!}</h4>
            <p class="text-sm font-roboto leading-7">${story.lead!}</p>
            </div>
            <a 
                class="btn w-fit mx-auto mb-4 mt-auto" 
                href="${cmsfn.linkPrefix(story)}/blog/${story}" 
                title=""
            >
            ${i18n.get("b-fy-web.components.blog.see-more")}
            </a>
        </div>
        [/#list]
    </div>
[/#macro]