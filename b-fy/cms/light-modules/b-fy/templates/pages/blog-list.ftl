<#-- Blog List Template -->
<#import "/b-fy/templates/components/nav.ftl" as nav />

<#-- Query all blog posts ordered by date -->
<#assign query = "SELECT * FROM [nt:base] AS t WHERE ISDESCENDANTNODE(t, '/blog') ORDER BY t.date DESC" />
<#assign blogPosts = cmsfn.search("blog", query) />

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
  <title>Blog | B-FY</title>
  <meta name="description" content="Read the latest insights, updates and news from B-FY's blog." />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  
  <style>
    /* Blog List Styles */
    .blog-list-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 2rem 1rem;
    }
    
    .blog-list-header {
      text-align: center;
      margin-bottom: 3rem;
    }
    
    .blog-list-title {
      font-size: 3rem;
      font-weight: 700;
      color: #F97316;
      margin-bottom: 1rem;
    }
    
    .blog-list-description {
      font-size: 1.25rem;
      color: #6B7280;
      max-width: 600px;
      margin: 0 auto;
    }
    
    .blog-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
      gap: 2rem;
    }
    
    .blog-card {
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s ease, box-shadow 0.2s ease;
    }
    
    .blog-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }
    
    .blog-card-image {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }
    
    .blog-card-content {
      padding: 1.5rem;
    }
    
    .blog-card-category {
      font-size: 0.75rem;
      font-weight: 600;
      text-transform: uppercase;
      color: #F97316;
      margin-bottom: 0.5rem;
    }
    
    .blog-card-title {
      font-size: 1.25rem;
      font-weight: 600;
      color: #1F2937;
      margin-bottom: 0.75rem;
      line-height: 1.3;
    }
    
    .blog-card-excerpt {
      font-size: 0.875rem;
      color: #6B7280;
      line-height: 1.5;
      margin-bottom: 1rem;
    }
    
    .blog-card-meta {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-size: 0.75rem;
      color: #9CA3AF;
    }
    
    .blog-card-link {
      color: #F97316;
      text-decoration: none;
      font-weight: 500;
    }
    
    .blog-card-link:hover {
      text-decoration: underline;
    }
    
    .no-posts {
      text-align: center;
      padding: 4rem 2rem;
      color: #6B7280;
    }
    
    /* Responsive Design */
    @media (max-width: 768px) {
      .blog-list-title {
        font-size: 2rem;
      }
      
      .blog-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>

<body class="font-sans antialiased text-neutral-900">
  <@nav.nav currentPage="resources" />
  
  <main style="margin-top: 70px;">
    <div class="blog-list-container">
      <header class="blog-list-header">
        <h1 class="blog-list-title">B-FY Blog</h1>
        <p class="blog-list-description">
          Stay updated with the latest insights, news, and developments in biometric authentication and cybersecurity.
        </p>
      </header>
      
      <#if blogPosts?size == 0>
        <div class="no-posts">
          <h2>No blog posts available</h2>
          <p>Check back soon for new content.</p>
        </div>
      <#else>
        <div class="blog-grid">
          <#list blogPosts as post>
            <article class="blog-card">
              <img src="${getPostImage(post.heroImage)}" alt="${post.title!""}" class="blog-card-image" />
              <div class="blog-card-content">
                <#if post.category??>
                  <div class="blog-card-category">${post.category}</div>
                </#if>
                <h2 class="blog-card-title">
                  <a href="/resources/blog/${post.slug}" class="blog-card-link">
                    ${post.title!"Untitled Post"}
                  </a>
                </h2>
                <p class="blog-card-excerpt">
                  ${truncateText(post.excerpt!"No excerpt available.", 120)}
                </p>
                <div class="blog-card-meta">
                  <span>${formatDate(post.date)}</span>
                  <a href="/resources/blog/${post.slug}" class="blog-card-link">Read more →</a>
                </div>
              </div>
            </article>
          </#list>
        </div>
      </#if>
    </div>
  </main>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
