[#-- ASSIGNMENTS --]
[#include "/b-fy-web/templates/shared/functions.ftl"]

[#assign storyName = ctx.getParameter('story')!]
[#if storyName?hasContent]
  [#assign story = getStoryByName(storyName)!]
[#elseIf content.story?hasContent]
  [#assign story = getStoryByPath(content.story)!]
[/#if]

[#-- Fall back to default story if none was selected --]
[#if !(story?hasContent)]
    [#assign story = getDefaultStory()]
[/#if]

[#-- AUTHOR --]
[#if story.teamMember?hasContent]
  [#assign teamMember = getTeamMember(story.teamMember)]
[/#if]

[#-- Author Image --]
[#if story.authorImage?hasContent]
  [#assign authorImage = damfn.getAsset(story.authorImage)]
  [#assign authorImageLink = authorImage.link]
[#elseIf teamMember?hasContent]
  [#assign authorImage = damfn.getAsset(teamMember.photo)]
  [#assign authorImageLink = authorImage.link]
[/#if]

[#-- Author Name --]
[#if story.author?hasContent]
  [#assign authorName = story.author]
[#elseIf teamMember?hasContent]
  [#assign authorName = teamMember.name]
[/#if]

[#-- Author Bio --]
[#if story.authorBio?hasContent]
  [#assign authorBio = cmsfn.decode(story).authorBio]
[#elseIf teamMember?hasContent]
  [#assign authorBio = cmsfn.decode(teamMember).bio!]
[/#if]


[#-- RENDERING --]
<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">
  <head>

    <script>
      // Define dataLayer and the gtag function.
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      
      // Default ad_storage and analytics_storage to 'denied' as a placeholder
      gtag('consent', 'default', {
        'ad_storage': 'denied',
        'analytics_storage': 'denied'
      });
    </script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-09TVSGTH8R"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
  
      gtag('config', 'G-09TVSGTH8R');
    </script>

    [@cms.page /]
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${story.title!}</title>
    <meta name="description" content="${story.seoDescription!story.lead!""}" />
    <meta name="keywords" content="${story.seoKeywords!""}" />


    [#-- DERIVE DOMAIN FROM SITE --]
    [#assign domain = "https://b-fy.com"]
    [#assign site=sitefn.site()]
    [#assign domains=site.domains]
    [#if domains?hasContent && (domains?size > 0)]
      [#assign domain = domains[0]]
    [/#if]

    <meta name='robots' content='index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1' />
	  <link rel="canonical" href="${domain!}${cmsfn.linkPrefix(story)}/blog/${story}/" />
    <meta property="og:locale" content="${cmsfn.language()}" />
    <meta property="og:type" content="article" />
   	<meta property="og:description" content="${story.seoDescription!story.lead!""}" />
    <meta property="og:title" content="${story.title!}" />
    <meta property="og:url" content="${domain!}${cmsfn.linkPrefix(story)}/blog/${story}/" />
    <meta property="og:site_name" content="B-FY" />

    <meta property="article:published_time" content="${cmsfn.metaData(story, "mgnl:created")!}" />
    <meta property="article:modified_time" content="${cmsfn.metaData(story, "mgnl:lastModified")!}" />
    <meta name="author" content="${authorName!}" />  

    <link rel="icon" href="${ctx.contextPath}/.resources/b-fy-web/webresources/favicon.ico" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;700&display=swap" rel="stylesheet"> 

    ${resfn.css(["/b-fy-web/webresources/css/common/.*css"])!}
  </head>
  <body class="lg:bg-smoke">
    <header class="sticky top-0">
      [@cms.area name="navbar" /]
    </header>
    [#-- GDPR --]
    [@cms.area name="gdpr" /]    
    <div>
      [#-- HERO --]
      [#if story.imagesource?hasContent]
        [#assign imageHero = damfn.getAsset(story.imagesource)]
        <div class="flex items-center bg-center bg-cover" style="height: 50vh; background-image: url(${imageHero.link!});">
        </div>
      [/#if]

      [#-- MAIN --]
      <div class="flex flex-col md:flex-row mx-5 bg-white">
        [#-- POST CONTENT --]
        <div class="px-4 py-8 lg:p-14 md:w-9/12">
          <!-- Lead text -->
          <div>
            <h1 class="text-3xl font-raleway font-bold uppercase">${story.title!}</h1>
            <h3 class="uppercase text-xl font-raleway font-extrabold pt-6">${story.lead!}</h3>
          </div>          
          <div class="grid grid-flow-row">
            [#assign blocks = cmsfn.children(story, "mgnl:block")]
            [#-- Render blocks  --]
            <!-- Blocks -->
            [#list blocks as block]
              [@cms.block content=block /]
            [/#list]

            <div class="flex flex-row border border-smoke p-5">
              <div>
                [#if authorImageLink?hasContent]
                  <img 
                    class="rounded-full max-w-[100px]"
                    src="${authorImageLink!}" 
                    alt="${authorName!}"
                    itemprop="image" 
                  >
                [/#if]
              </div>
              <div class="flex flex-col pl-5">
                <div>
                  <a href="/author/${teamMember!authorName!}"><span class="text-lg">${authorName!}</span></a>
                </div>
                <div class="text-sm">
                  ${authorBio!}
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- FILTER-->
        <aside class="text-center md:text-start md:w-3/12 md:px-10">
          [@cms.area name="filter" /]
        </aside>
      </div>

    </div>
    <!-- FOOTER -->
    <footer>
      [@cms.area name="footer" /]
    </footer>
    ${resfn.js(["/b-fy-web/webresources/js/common/.*js"])!}
  </body>
</html>
