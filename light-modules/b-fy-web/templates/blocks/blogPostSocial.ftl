[#if content.embed?has_content]
    <div class="flex my-4 lg:mx-10">
        ${cmsfn.decode(content).embed!}
    </div>
[/#if]