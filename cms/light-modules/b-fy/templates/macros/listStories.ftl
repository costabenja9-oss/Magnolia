[#macro listStories stories]
    [#-- RENDERING --]
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 2rem; margin-top: 2rem;">
        [#list stories! as __story]
        [#assign story = cmsfn.wrapForI18n(__story)]

        <div style="background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1); transition: transform 0.2s ease, box-shadow 0.2s ease; border: 1px solid #e5e7eb;">
            [#if story.imagesource?hasContent]
                [#assign image = damfn.getAsset(story.imagesource)]
                <a href="${ctx.contextPath}/blog/${story.@name}" title="${story.title!}">
                    <img src="${image.link!}" alt="${story.imagealtText!}" style="width: 100%; height: 200px; object-fit: cover;">
                </a>
            [/#if]
            <div style="padding: 1.5rem;">
                <h4 style="font-size: 1.25rem; font-weight: 700; color: #1f2937; margin-bottom: 0.75rem; line-height: 1.3;">${story.title!}</h4>
                <p style="color: #6b7280; font-size: 0.875rem; line-height: 1.5; margin-bottom: 1rem;">${story.lead!}</p>
                <div style="display: flex; justify-content: space-between; align-items: center; font-size: 0.75rem; color: #9ca3af;">
                    <span>${story.author!"B-FY Team"}</span>
                    <span>${cmsfn.metaData(story, "mgnl:created")!}</span>
                </div>
            </div>
        </div>
        [/#list]
    </div>
[/#macro]
