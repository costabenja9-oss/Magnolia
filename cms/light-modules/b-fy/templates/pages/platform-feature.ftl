<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"Feature | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
</head>
<body class="font-sans antialiased text-neutral-900">
  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="platform" />
  <main style="margin-top:70px;" class="px-6 py-24 max-w-screen-xl mx-auto">
    <h1 class="font-bold text-4xl mb-6">${content.title!"Feature Detail"}</h1>
    <p class="text-lg max-w-prose mb-12">${content.description!"Fallback description of a platform capability."}</p>
    <#assign sections = [] />
    <#if content.sections?has_content>
      <#assign sections = content.sections?children />
    </#if>
    <#if sections?size == 0>
      <#assign sections = [
        {"title":"Why it matters","body":"Explains the business and security impact."},
        {"title":"How it works","body":"Technical flow and standards involved."},
        {"title":"Key benefits","body":"Reduced fraud, better UX, regulatory alignment."}
      ] />
    </#if>
    <div class="grid gap-10 md:grid-cols-3">
      <#list sections as s>
        <div class="p-6 border rounded bg-white shadow-sm">
          <h2 class="font-semibold text-xl mb-2">${s.title!s["title"]!}</h2>
          <p class="text-sm leading-snug">${s.body!s["body"]!}</p>
        </div>
      </#list>
    </div>
  </main>
  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
