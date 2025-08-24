<#-- Blog Detail Template -->
<#import "/b-fy/templates/components/nav.ftl" as nav />

<#-- Get slug from URL parameter -->
<#assign slug = (ctx.getParameter("slug"))!"" />

<#-- JCR-SQL2 Query to find the blog post by slug -->
<#assign query = "SELECT * FROM [nt:base] AS t WHERE ISDESCENDANTNODE(t, '/blog') AND t.slug = '${slug}'" />
<#assign result = cmsfn.search("blog", query) />

<#-- Check if post exists -->
<#if result?size == 0>
  <#-- 404 Not Found -->
  <#assign response = ctx.response />
  <#assign void = response.setStatus(404) />
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Not Found | B-FY</title>
    <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
    <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  </head>
  <body class="font-sans antialiased text-neutral-900">
    <@nav.nav currentPage="resources" />
    <main style="margin-top:70px; padding: 4rem 2rem; text-align: center;">
      <h1 style="font-size: 2rem; margin-bottom: 1rem;">Post Not Found</h1>
      <p>The blog post you're looking for doesn't exist.</p>
      <a href="/resources" style="color: #F97316; text-decoration: underline;">← Back to Resources</a>
    </main>
  </body>
  </html>
  <#return />
</#if>

<#-- Get the blog post -->
<#assign post = result[0] />

<#-- Query for 3 recent posts (excluding current) -->
<#assign recentQuery = "SELECT * FROM [nt:base] AS t WHERE ISDESCENDANTNODE(t, '/blog') AND t.slug != '${slug}' ORDER BY t.date DESC" />
<#assign recentPosts = cmsfn.search("blog", recentQuery, 3) />

<#-- Helper function to get DAM image -->
<#function getPostImage damUuid>
  <#if damUuid??>
    <#assign asset = damfn.getAsset(damUuid)!"" />
    <#if asset?has_content>
      <#return damfn.link(asset) />
    </#if>
  </#if>
  <#return "${ctx.contextPath}/.resources/b-fy/webresources/images/default-blog-hero.jpg" />
</#function>

<#-- Helper function to truncate text -->
<#function truncateText text maxLength>
  <#if text?length <= maxLength>
    <#return text />
  <#else>
    <#return text?substring(0, maxLength) + "..." />
  </#if>
</#function>

<#-- Helper function to format date -->
<#function formatDate dateValue>
  <#if dateValue??>
    <#return dateValue?string("MMMM dd, yyyy") />
  </#if>
  <#return "" />
</#function>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${post.title!"Blog Post"} | B-FY</title>
  <meta name="description" content="${post.excerpt!"Read this blog post on B-FY's insights and updates."}" />
  
  <#-- SEO Meta Tags -->
  <meta property="og:title" content="${post.title!"Blog Post"}" />
  <meta property="og:description" content="${post.excerpt!""}" />
  <meta property="og:image" content="${getPostImage(post.heroImage)}" />
  <meta property="og:url" content="${ctx.request.requestURL}" />
  <meta property="og:type" content="article" />
  
  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content="${post.title!"Blog Post"}" />
  <meta name="twitter:description" content="${post.excerpt!""}" />
  <meta name="twitter:image" content="${getPostImage(post.heroImage)}" />
  
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  
  <style>
    /* Blog Detail Styles */
    .blog-detail-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 1rem;
    }
    
    .blog-hero-image {
      width: 100%;
      height: 400px;
      object-fit: cover;
      border-radius: 8px;
      margin-bottom: 2rem;
    }
    
    .blog-content-wrapper {
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 4rem;
      margin-top: 2rem;
    }
    
    .blog-main-content {
      max-width: none;
    }
    
    .blog-title {
      font-size: 2.5rem;
      font-weight: 700;
      color: #F97316;
      margin-bottom: 1rem;
      line-height: 1.2;
    }
    
    .blog-subtitle {
      font-size: 1.25rem;
      font-weight: 600;
      color: #374151;
      margin-bottom: 1.5rem;
      line-height: 1.4;
    }
    
    .blog-meta {
      display: flex;
      gap: 1rem;
      margin-bottom: 2rem;
      font-size: 0.875rem;
      color: #6B7280;
    }
    
    .blog-body {
      font-size: 1rem;
      line-height: 1.7;
      color: #374151;
    }
    
    .blog-body p {
      margin-bottom: 1.5rem;
    }
    
    .blog-body h2 {
      font-size: 1.5rem;
      font-weight: 600;
      margin: 2rem 0 1rem 0;
      color: #1F2937;
    }
    
    .blog-body h3 {
      font-size: 1.25rem;
      font-weight: 600;
      margin: 1.5rem 0 1rem 0;
      color: #1F2937;
    }
    
    .blog-body img {
      max-width: 100%;
      height: auto;
      border-radius: 4px;
      margin: 1.5rem 0;
    }
    
    .blog-body ul, .blog-body ol {
      margin-bottom: 1.5rem;
      padding-left: 1.5rem;
    }
    
    .blog-body li {
      margin-bottom: 0.5rem;
    }
    
    .blog-sidebar {
      position: sticky;
      top: 2rem;
      height: fit-content;
    }
    
    .sidebar-section {
      background: #F9FAFB;
      border-radius: 8px;
      padding: 1.5rem;
    }
    
    .sidebar-title {
      font-size: 1rem;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      color: #374151;
      margin-bottom: 1.5rem;
      border-bottom: 2px solid #F97316;
      padding-bottom: 0.5rem;
    }
    
    .recent-post {
      display: flex;
      gap: 1rem;
      margin-bottom: 1.5rem;
      padding-bottom: 1.5rem;
      border-bottom: 1px solid #E5E7EB;
    }
    
    .recent-post:last-child {
      margin-bottom: 0;
      padding-bottom: 0;
      border-bottom: none;
    }
    
    .recent-post-image {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border-radius: 4px;
      flex-shrink: 0;
    }
    
    .recent-post-content {
      flex: 1;
    }
    
    .recent-post-title {
      font-size: 0.875rem;
      font-weight: 600;
      text-transform: uppercase;
      color: #1F2937;
      margin-bottom: 0.5rem;
      line-height: 1.3;
    }
    
    .recent-post-excerpt {
      font-size: 0.8rem;
      color: #6B7280;
      margin-bottom: 0.5rem;
      line-height: 1.4;
    }
    
    .recent-post-link {
      font-size: 0.8rem;
      color: #F97316;
      text-decoration: none;
      font-weight: 500;
    }
    
    .recent-post-link:hover {
      text-decoration: underline;
    }
    
    /* Responsive Design */
    @media (max-width: 768px) {
      .blog-content-wrapper {
        grid-template-columns: 1fr;
        gap: 2rem;
      }
      
      .blog-title {
        font-size: 2rem;
      }
      
      .blog-hero-image {
        height: 250px;
      }
    }
    
    @media (max-width: 480px) {
      .blog-detail-container {
        padding: 0 0.5rem;
      }
      
      .blog-title {
        font-size: 1.75rem;
      }
      
      .blog-subtitle {
        font-size: 1.125rem;
      }
      
      .sidebar-section {
        padding: 1rem;
      }
    }
  </style>
</head>

<body class="font-sans antialiased text-neutral-900">
  <@nav.nav currentPage="resources" />
  
  <main style="margin-top: 70px; padding: 2rem 0;">
    <div class="blog-detail-container">
      <#-- Hero Image -->
      <img src="${getPostImage(post.heroImage)}" alt="${post.title!""}" class="blog-hero-image" />
      
      <div class="blog-content-wrapper">
        <article class="blog-main-content">
          <#-- Title and Subtitle -->
          <h1 class="blog-title">${post.title!"Untitled Post"}</h1>
          <#if post.subtitle??>
            <p class="blog-subtitle">${post.subtitle}</p>
          </#if>
          
          <#-- Meta Information -->
          <div class="blog-meta">
            <#if post.date??>
              <span>📅 ${formatDate(post.date)}</span>
            </#if>
            <#if post.author??>
              <span>✏️ ${post.author}</span>
            </#if>
            <#if post.category??>
              <span>🏷️ ${post.category}</span>
            </#if>
          </div>
          
          <#-- Body Content -->
          <div class="blog-body">
            ${post.body?no_esc!"<p>No content available.</p>"}
          </div>
        </article>
        
        <aside class="blog-sidebar">
          <div class="sidebar-section">
            <h2 class="sidebar-title">Otras Entradas</h2>
            
            <#if recentPosts?size == 0>
              <p style="color: #6B7280; font-size: 0.875rem;">No hay otras entradas disponibles.</p>
            <#else>
              <#list recentPosts as recentPost>
                <div class="recent-post">
                  <img src="${getPostImage(recentPost.heroImage)}" alt="${recentPost.title!""}" class="recent-post-image" />
                  <div class="recent-post-content">
                    <h3 class="recent-post-title">${recentPost.title!"Untitled"}</h3>
                    <p class="recent-post-excerpt">${truncateText(recentPost.excerpt!"No excerpt available.", 80)}</p>
                    <a href="/resources/blog/${recentPost.slug}" class="recent-post-link">Leer más →</a>
                  </div>
                </div>
              </#list>
            </#if>
          </div>
        </aside>
      </div>
    </div>
  </main>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
