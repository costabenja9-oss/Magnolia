[#-- ASSIGNMENTS --]
[#include "/b-fy/templates/shared/functions.ftl"]

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
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>${story.title!content.title!"Blog Post | B-FY"}</title>
  <meta name="description" content="${story.seoDescription!story.lead!content.description!""}" />
  <meta name="keywords" content="${story.seoKeywords!content.keywords!""}" />
  
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  
  <style>
    .blog-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 2rem 1rem;
    }
    
    .blog-hero {
      width: 100%;
      height: 300px;
      object-fit: cover;
      border-radius: 12px;
      margin-bottom: 2rem;
    }
    
    .blog-content {
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 3rem;
    }
    
    .blog-title {
      font-size: 2.5rem;
      font-weight: 700;
      color: #ea580c;
      margin-bottom: 1rem;
      line-height: 1.2;
    }
    
    .blog-meta {
      display: flex;
      gap: 1rem;
      margin-bottom: 2rem;
      padding-bottom: 1rem;
      border-bottom: 2px solid #e5e7eb;
      font-size: 0.875rem;
      color: #6b7280;
    }
    
    .blog-category {
      background: #ea580c;
      color: white;
      padding: 0.25rem 0.75rem;
      border-radius: 6px;
      font-weight: 600;
      text-transform: uppercase;
      font-size: 0.75rem;
    }
    
    .blog-body {
      font-size: 1.125rem;
      line-height: 1.7;
      color: #374151;
    }
    
    .blog-body h2 {
      font-size: 1.75rem;
      font-weight: 600;
      margin: 2rem 0 1rem 0;
      color: #1f2937;
    }
    
    .blog-body p {
      margin-bottom: 1.5rem;
    }
    
    .blog-body ul {
      margin-bottom: 1.5rem;
      padding-left: 1.5rem;
    }
    
    .blog-body li {
      margin-bottom: 0.5rem;
    }
    
    .blog-body strong {
      color: #ea580c;
      font-weight: 600;
    }
    
    .blog-sidebar {
      background: #f9fafb;
      border-radius: 12px;
      padding: 1.5rem;
      height: fit-content;
      position: sticky;
      top: 2rem;
    }
    
    .sidebar-title {
      font-size: 1.25rem;
      font-weight: 700;
      color: #ea580c;
      margin-bottom: 1rem;
      text-transform: uppercase;
    }
    
    .back-link {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      color: #ea580c;
      text-decoration: none;
      font-weight: 600;
      margin-bottom: 2rem;
      transition: color 0.15s ease;
    }
    
    .back-link:hover {
      color: #c2410c;
    }
    
    .author-card {
      display: flex;
      border: 1px solid #e5e7eb;
      border-radius: 8px;
      padding: 1.5rem;
      margin-top: 2rem;
      background: #f9fafb;
    }
    
    .author-image {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 1rem;
    }
    
    .author-info h4 {
      font-size: 1.1rem;
      font-weight: 600;
      color: #1f2937;
      margin-bottom: 0.5rem;
    }
    
    .author-info p {
      font-size: 0.875rem;
      color: #6b7280;
      line-height: 1.5;
    }
    
    /* Responsive */
    @media (max-width: 1024px) {
      .blog-content {
        grid-template-columns: 1fr;
        gap: 2rem;
      }
      
      .blog-title {
        font-size: 2rem;
      }
    }
    
    @media (max-width: 768px) {
      .blog-container {
        padding: 1rem 0.5rem;
      }
      
      .blog-title {
        font-size: 1.75rem;
      }
      
      .blog-hero {
        height: 200px;
      }
    }
  </style>
</head>

<body class="font-sans antialiased text-neutral-900">
  <#import "/b-fy/templates/components/nav.ftl" as nav />
  <@nav.nav currentPage="resources" />
  
  <main style="margin-top: 70px;">
    <div class="blog-container">
      <!-- Back Link -->
      <a href="${ctx.contextPath}/blog" class="back-link">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
          <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/>
        </svg>
        Back to Blog
      </a>
      
      [#-- Hero Image --]
      [#if story.imagesource?hasContent]
        [#assign imageHero = damfn.getAsset(story.imagesource)]
        <img src="${imageHero.link!}" alt="${story.title!}" class="blog-hero" />
      [/#if]
      
      <div class="blog-content">
        <article class="blog-main">
          <!-- Title -->
          <h1 class="blog-title">${story.title!content.title!"Untitled Blog Post"}</h1>
          
          <!-- Lead -->
          [#if story.lead?hasContent]
            <h3 class="text-xl font-bold text-gray-700 mb-4">${story.lead}</h3>
          [/#if]
          
          <!-- Meta -->
          <div class="blog-meta">
            <span>✏️ ${authorName!content.author!"B-FY Team"}</span>
            <span>📅 ${cmsfn.metaData(story, "mgnl:created")!content.date!"2025-01-01"}</span>
          </div>
          
          <!-- Content -->
          <div class="blog-body">
            [#if story?hasContent]
              [#assign blocks = cmsfn.children(story, "mgnl:block")]
              [#-- Render blocks --]
              [#list blocks as block]
                [@cms.block content=block /]
              [/#list]
            [#else]
              <#assign fbBody = "This is placeholder blog content. Please configure a story or add content." />
              <div>${content.body!fbBody}</div>
            [/#if]
          </div>
          
          <!-- Author Card -->
          [#if authorName?hasContent]
            <div class="author-card">
              [#if authorImageLink?hasContent]
                <img src="${authorImageLink}" alt="${authorName}" class="author-image" />
              [/#if]
              <div class="author-info">
                <h4>${authorName}</h4>
                [#if authorBio?hasContent]
                  <p>${authorBio}</p>
                [/#if]
              </div>
            </div>
          [/#if]
        </article>
        
        <!-- Sidebar -->
        <aside class="blog-sidebar">
          <h2 class="sidebar-title">Related Posts</h2>
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            [#assign relatedStories = getStories('/blog', 3)]
            [#list relatedStories as relatedStory]
              [#if relatedStory.@name != (story.@name)!""]
                <a href="${ctx.contextPath}/blog/${relatedStory.@name}" 
                   style="color: #374151; text-decoration: none; padding: 0.75rem; border: 1px solid #e5e7eb; border-radius: 8px; transition: all 0.15s ease;">
                  <div style="font-weight: 600; font-size: 0.875rem; margin-bottom: 0.25rem;">${relatedStory.title}</div>
                  <div style="font-size: 0.75rem; color: #6b7280;">${relatedStory.lead!""}</div>
                </a>
              [/#if]
            [/#list]
          </div>
        </aside>
      </div>
    </div>
  </main>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
