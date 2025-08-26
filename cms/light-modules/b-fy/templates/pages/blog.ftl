<#ftl output_format="HTML">

<#-- Incluir datos del blog desde archivo separado -->
<#include "/b-fy/templates/lib/blog-data.ftl">

<#-- DATA ASSIGNMENT BASADO EN LA RUTA ACTUAL -->
<#assign currentPath = ctx.request.requestURI!"" />
<#assign fullURL = ctx.request.requestURL!"" />
<#assign queryString = ctx.request.queryString!"" />
<#assign blogSlug = "" />

<#-- Intentar obtener la URL completa incluyendo el path completo -->
<#assign completePath = "" />
<#if ctx.request.getHeader("X-Original-URL")??>
  <#assign completePath = ctx.request.getHeader("X-Original-URL") />
<#elseif ctx.request.getServletPath()??>
  <#assign completePath = ctx.request.getServletPath() />
<#else>
  <#assign completePath = currentPath />
</#if>

<#-- Si la URL completa contiene información útil, usar esa -->
<#if fullURL?contains("/blog/")>
  <#assign startIndex = fullURL?last_index_of("/blog/") + 6 />
  <#if startIndex < fullURL?length>
    <#assign urlPart = fullURL?substring(startIndex) />
    <#-- Limpiar parámetros y extensiones -->
    <#if urlPart?contains("?")>
      <#assign urlPart = urlPart?substring(0, urlPart?index_of("?")) />
    </#if>
    <#if urlPart?contains("#")>
      <#assign urlPart = urlPart?substring(0, urlPart?index_of("#")) />
    </#if>
    <#if urlPart?has_content && urlPart != "blog-post">
      <#assign blogSlug = urlPart />
    </#if>
  </#if>
</#if>

<#-- Intentar extraer de la ruta completa si aún no tenemos slug -->
<#if !blogSlug?has_content && completePath?contains("/blog/")>
  <#assign startIndex = completePath?last_index_of("/blog/") + 6 />
  <#if startIndex < completePath?length>
    <#assign pathPart = completePath?substring(startIndex) />
    <#if pathPart?contains(".")>
      <#assign pathPart = pathPart?substring(0, pathPart?index_of(".")) />
    </#if>
    <#if pathPart?has_content && pathPart != "blog-post">
      <#assign blogSlug = pathPart />
    </#if>
  </#if>
</#if>

<#-- Si no se puede obtener de la URL, intentar obtener del content -->
<#if (!blogSlug?has_content) && content?? && content.@name??>
  <#assign contentName = content.@name />
  <#if contentName != "blog-post">
    <#assign blogSlug = contentName />
  </#if>
</#if>

<#-- Verificar si hay un parámetro en la query string que indique el blog -->
<#if !blogSlug?has_content && queryString?has_content>
  <#-- Primero verificar el parámetro 'story' -->
  <#assign storyParam = ctx.request.getParameter("story")!"" />
  <#if storyParam?has_content>
    <#assign blogSlug = storyParam />
  <#elseif queryString?contains("blog=")>
    <#assign blogParam = ctx.request.getParameter("blog")!"" />
    <#if blogParam?has_content>
      <#assign blogSlug = blogParam />
    </#if>
  </#if>
</#if>

<#-- Si TODAVÍA no tenemos slug o es el genérico, verificar el parámetro story directamente -->
<#if blogSlug == "blog-post" || blogSlug == "blog" || !blogSlug?has_content>
  <#assign storyParam = ctx.request.getParameter("story")!"" />
  <#if storyParam?has_content>
    <#assign blogSlug = storyParam />
  </#if>
</#if>

<#-- Mapeo manual para el entorno de Magnolia Author -->
<#if blogSlug == "blog-post" || blogSlug == "blog" || !blogSlug?has_content>
  <#-- PRIORIDAD 1: Parámetro 'story' de la query string -->
  <#assign storyParam = ctx.request.getParameter("story")!"" />
  <#if storyParam?has_content>
    <#assign blogSlug = storyParam />
  <#else>
    <#-- PRIORIDAD 2: Título del contenido -->
    <#if content?? && content.title??>
      <#assign pageTitle = content.title?lower_case />
      <#if pageTitle?contains("ciberseguridad") || pageTitle?contains("cybersecurity") || pageTitle?contains("tendencias")>
        <#assign blogSlug = "cybersecurity-trends-2025" />
      <#elseif pageTitle?contains("fraude") || pageTitle?contains("fraud") || pageTitle?contains("amenaza")>
        <#assign blogSlug = "identity-fraud-threat" />
      <#elseif pageTitle?contains("mitos") || pageTitle?contains("myths") || pageTitle?contains("biométrica") || pageTitle?contains("biometric")>
        <#assign blogSlug = "biometric-myths" />
      <#elseif pageTitle?contains("verificación") || pageTitle?contains("verification") || pageTitle?contains("identidad") || pageTitle?contains("identity")>
        <#assign blogSlug = "identity-verification-challenge" />
      </#if>
    </#if>
    
    <#-- PRIORIDAD 3: Parámetros de testing -->
    <#if !blogSlug?has_content || blogSlug == "blog-post">
      <#assign blogParam = ctx.request.getParameter("blog")!"" />
      <#if blogParam?has_content>
        <#assign blogSlug = blogParam />
      <#else>
        <#assign testBlog = ctx.request.getParameter("test")!"" />
        <#if testBlog == "cyber" || testBlog == "cybersecurity">
          <#assign blogSlug = "cybersecurity-trends-2025" />
        <#elseif testBlog == "fraud">
          <#assign blogSlug = "identity-fraud-threat" />
        <#elseif testBlog == "myths" || testBlog == "biometric">
          <#assign blogSlug = "biometric-myths" />
        <#else>
          <#-- Usar el slug por defecto -->
          <#assign blogSlug = "identity-verification-challenge" />
        </#if>
      </#if>
    </#if>
  </#if>
</#if>

<#-- Si aún no hay slug válido, usar el predeterminado -->
<#if !blogSlug?has_content>
  <#assign blogSlug = "identity-verification-challenge" />
</#if>

<#-- DATOS PREDETERMINADOS SI NO SE ENCUENTRA EL BLOG -->
<#assign defaultBlog = {
  "title": "Blog | B-FY",
  "description": "B-FY blog posts about biometric authentication and cybersecurity.",
  "keywords": "biometric authentication, cybersecurity, B-FY",
  "author": "B-FY Team",
  "date": "2025",
  "heroImage": "identity-verification-growing-challenge.webp",
  "heroAlt": "B-FY Blog",
  "content": [
    {
      "type": "text",
      "text": "Bienvenido al blog de B-FY, donde exploramos las últimas tendencias en autenticación biométrica y ciberseguridad.",
      "strong": true
    }
  ]
} />

<#-- SELECCIONAR EL BLOG ACTUAL O USAR EL PREDETERMINADO -->
<#assign currentBlog = defaultBlog />

<#-- Intentar obtener el blog específico -->
<#if blogSlug?has_content && blogData[blogSlug]??>
  <#assign currentBlog = blogData[blogSlug] />
<#else>
  <#-- Si no encuentra por slug exacto, intentar por coincidencias parciales -->
  <#if blogSlug?contains("identity-verification") || blogSlug?contains("verification")>
    <#assign currentBlog = blogData["identity-verification-challenge"] />
  <#elseif blogSlug?contains("cybersecurity-trends") || blogSlug?contains("trends")>
    <#assign currentBlog = blogData["cybersecurity-trends-2025"] />
  <#elseif blogSlug?contains("identity-fraud") || blogSlug?contains("fraud") || blogSlug?contains("threat")>
    <#assign currentBlog = blogData["identity-fraud-threat"] />
  <#elseif blogSlug?contains("biometric") && (blogSlug?contains("myths") || blogSlug?contains("five-myths"))>
    <#assign currentBlog = blogData["biometric-myths"] />
  <#elseif blogSlug?contains("human-authentication") || blogSlug?contains("revolutionary")>
    <#assign currentBlog = blogData["human-authentication-revolutionary"] />
  <#elseif blogSlug?contains("bfy-consolidates") || blogSlug?contains("consolidates") || blogSlug?contains("worldwide")>
    <#assign currentBlog = blogData["bfy-consolidates-presence-worldwide"] />
  <#elseif blogSlug?contains("bfy-transforms") || blogSlug?contains("transforms") || blogSlug?contains("traveler")>
    <#assign currentBlog = blogData["bfy-transforms-traveler-experience"] />
  <#elseif blogSlug?contains("passwordless-future") || blogSlug?contains("passwordless") && blogSlug?contains("future")>
    <#assign currentBlog = blogData["passwordless-future-bfy-approach"] />
  <#elseif blogSlug?contains("bfy-enters") || blogSlug?contains("enters") || blogSlug?contains("us-market")>
    <#assign currentBlog = blogData["bfy-enters-us-market"] />
  <#elseif blogSlug?contains("bfy-revolutionary") || blogSlug?contains("revolutionary-solution") || blogSlug?contains("terminate")>
    <#assign currentBlog = blogData["bfy-revolutionary-solution-terminate-fraud"] />
  <#elseif blogSlug?contains("bfy-global-launch") || blogSlug?contains("global-launch") || blogSlug?contains("amsterdam")>
    <#assign currentBlog = blogData["bfy-global-launch-amsterdam"] />
  <#elseif blogSlug?contains("bfy-participate") || blogSlug?contains("participate") || blogSlug?contains("identity-week")>
    <#assign currentBlog = blogData["bfy-participate-identity-week"] />
  <#elseif blogSlug?contains("bfy-passwordless") || blogSlug?contains("passwordless-solution") || blogSlug?contains("stop-online")>
    <#assign currentBlog = blogData["bfy-passwordless-solution"] />
  <#elseif blogSlug?contains("bfy-pulse") || blogSlug?contains("pulse") || blogSlug?contains("cybersecurity-trends")>
    <#assign currentBlog = blogData["bfy-pulse-cybersecurity"] />
  <#elseif blogSlug?contains("bfy-serban") || blogSlug?contains("serban") || blogSlug?contains("partnership")>
    <#assign currentBlog = blogData["bfy-serban-partnership"] />
  <#elseif blogSlug?contains("bfy-sponsor") || blogSlug?contains("sponsor") || blogSlug?contains("summit-2024")>
    <#assign currentBlog = blogData["bfy-sponsor-summit-2024"] />
  <#elseif blogSlug?contains("bfy-summit") || blogSlug?contains("summit-2024-solution") || blogSlug?contains("decentralized")>
    <#assign currentBlog = blogData["bfy-summit-2024-solution"] />
  <#elseif blogSlug?contains("bfy-higher-education") || blogSlug?contains("higher-education") || blogSlug?contains("university")>
    <#assign currentBlog = blogData["bfy-higher-education"] />
  <#elseif blogSlug?contains("bfy-fuel-industry") || blogSlug?contains("fuel-industry") || blogSlug?contains("mexico")>
    <#assign currentBlog = blogData["bfy-fuel-industry-mexico"] />
  <#elseif blogSlug?contains("bfy-eudi") || blogSlug?contains("eudi") || blogSlug?contains("compliance")>
    <#assign currentBlog = blogData["bfy-eudi-compliance"] />
  <#elseif blogSlug?contains("bfy-banking") || blogSlug?contains("banking-experiences") || blogSlug?contains("decentralized-biometric")>
    <#assign currentBlog = blogData["bfy-banking-experiences"] />
  <#elseif blogSlug?contains("biometric-edge") || blogSlug?contains("edge-education") || blogSlug?contains("educational-industry")>
    <#assign currentBlog = blogData["biometric-edge-education"] />
  <#elseif blogSlug?contains("biometric-ux") || blogSlug?contains("ux-compliance") || blogSlug?contains("revolutionize-ux")>
    <#assign currentBlog = blogData["biometric-ux-compliance"] />
  <#elseif blogSlug?contains("biometric-financial") || blogSlug?contains("financial-leverage") || blogSlug?contains("leverage-financial")>
    <#assign currentBlog = blogData["biometric-financial-leverage"] />
  <#elseif blogSlug?contains("biometric-iam") || blogSlug?contains("iam-solution") || blogSlug?contains("effective-iam")>
    <#assign currentBlog = blogData["biometric-iam-solution"] />
  <#elseif blogSlug?contains("healthcare-biometric") || blogSlug?contains("healthcare-investment") || blogSlug?contains("medical-biometric")>
    <#assign currentBlog = blogData["healthcare-biometric-investment"] />
  <#elseif blogSlug?contains("hidden-costs") || blogSlug?contains("fraud-costs") || blogSlug?contains("identity-fraud")>
    <#assign currentBlog = blogData["hidden-costs-fraud"] />
  <#elseif blogSlug?contains("higher-education") || blogSlug?contains("gen-z") || blogSlug?contains("generation-alpha")>
    <#assign currentBlog = blogData["higher-education-gen-z"] />
  <#elseif blogSlug?contains("mfa-biometric") || blogSlug?contains("multi-factor") || blogSlug?contains("authentication-biometric")>
    <#assign currentBlog = blogData["mfa-biometrics"] />
  <#elseif blogSlug?contains("password-cybercriminal") || blogSlug?contains("passwords-key") || blogSlug?contains("cybercriminal-access")>
    <#assign currentBlog = blogData["passwords-cybercriminals"] />
  <#elseif blogSlug?contains("protect-company") || blogSlug?contains("cyber-threat") || blogSlug?contains("company-protection")>
    <#assign currentBlog = blogData["protect-company-threats"] />
  <#else>
    <#-- Si no hay slug o no coincide, usar el blog por defecto -->
    <#assign currentBlog = blogData["identity-verification-challenge"] />
  </#if>
</#if>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>${currentBlog.title!"Blog | B-FY"}</title>
  <meta name="description" content="${currentBlog.description!"B-FY blog posts about biometric authentication and cybersecurity."}" />
  <meta name="keywords" content="${currentBlog.keywords!"biometric authentication, cybersecurity, B-FY"}" />
  
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  
  <style>
    .blog-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 2rem 1rem;
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 3rem;
    }
    
    .main-content {
      background: white;
      border-radius: 8px;
      overflow: hidden;
    }
    
    .blog-hero-image {
      width: 100%;
      height: 300px;
      object-fit: cover;
      border-radius: 8px 8px 0 0;
    }
    
    .blog-content {
      padding: 2rem;
    }
    
    .blog-title {
      font-size: 2.5rem;
      font-weight: 700;
      color: #ea580c;
      margin-bottom: 1rem;
      line-height: 1.2;
    }
    
    .blog-meta {
      font-size: 0.875rem;
      color: #6b7280;
      margin-bottom: 2rem;
    }
    
    .blog-text {
      font-size: 1rem;
      line-height: 1.7;
      color: #374151;
      margin-bottom: 1.5rem;
    }
    
    .blog-text strong {
      color: #1f2937;
      font-weight: 600;
    }
    
    .blog-section-title {
      font-size: 1.5rem;
      font-weight: 600;
      color: #1f2937;
      margin: 2rem 0 1rem 0;
    }
    
    .blog-image {
      width: 100%;
      height: 250px;
      object-fit: cover;
      border-radius: 8px;
      margin: 2rem 0;
    }
    
    .sidebar {
      background: #f9fafb;
      padding: 1.5rem;
      border-radius: 8px;
      height: fit-content;
    }
    
    .sidebar-title {
      font-size: 1.25rem;
      font-weight: 700;
      color: #ea580c;
      margin-bottom: 1.5rem;
      text-transform: uppercase;
    }
    
    .sidebar-item {
      background: white;
      border-radius: 8px;
      padding: 1rem;
      margin-bottom: 1rem;
      box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s ease;
    }
    
    .sidebar-item:hover {
      transform: translateY(-2px);
    }
    
    .sidebar-item img {
      width: 100%;
      height: 120px;
      object-fit: cover;
      border-radius: 6px;
      margin-bottom: 0.75rem;
    }
    
    .sidebar-item-title {
      font-size: 0.875rem;
      font-weight: 600;
      color: #1f2937;
      line-height: 1.3;
      margin-bottom: 0.5rem;
    }
    
    .sidebar-item-excerpt {
      font-size: 0.75rem;
      color: #6b7280;
      line-height: 1.4;
    }
    
    .sidebar-item a {
      text-decoration: none;
      color: inherit;
    }
    
    @media (max-width: 1024px) {
      .blog-container {
        grid-template-columns: 1fr;
        gap: 2rem;
      }
    }
    
    @media (max-width: 768px) {
      .blog-container {
        padding: 1rem 0.5rem;
      }
      
      .blog-title {
        font-size: 2rem;
      }
      
      .blog-content {
        padding: 1.5rem;
      }
    }
  </style>
</head>

<body class="font-sans antialiased text-neutral-900">
  <#import "/b-fy/templates/components/nav.ftl" as nav />
  <@nav.nav currentPage="resources" />
  
  <main style="margin-top: 70px;">
    <div class="blog-container">
      <!-- Contenido Principal del Blog -->
      <article class="main-content">
        <!-- Imagen Hero -->
        <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/${currentBlog.heroImage}" 
             alt="${currentBlog.heroAlt}" 
             class="blog-hero-image"
             onerror="this.style.display='none'" />
        
        <div class="blog-content">
          <!-- Título Principal -->
          <h1 class="blog-title">${currentBlog.title}</h1>
          
          <!-- Meta información -->
          <div class="blog-meta">
            Por ${currentBlog.author} • ${currentBlog.date}
          </div>
          
          <!-- Contenido del Blog Dinámico -->
          <#if currentBlog.content??>
            <#list currentBlog.content as contentItem>
              <#if contentItem.type == "text">
                <p class="blog-text">
                  <#if contentItem.strong?? && contentItem.strong?is_boolean && contentItem.strong>
                    <strong>${contentItem.text}</strong>
                  <#elseif contentItem.strong?? && contentItem.strong?is_string>
                    ${contentItem.text?replace(contentItem.strong, "<strong>" + contentItem.strong + "</strong>")}
                  <#else>
                    ${contentItem.text}
                  </#if>
                </p>
              <#elseif contentItem.type == "section_title">
                <h2 class="blog-section-title">${contentItem.text}</h2>
              <#elseif contentItem.type == "image">
                <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/${contentItem.src}" 
                     alt="${contentItem.alt}" 
                     class="blog-image"
                     onerror="this.style.display='none'" />
              </#if>
            </#list>
          </#if>
          
        </div>
      </article>
      
      <!-- Sidebar -->
      <aside class="sidebar">
        <h3 class="sidebar-title">Otras Entradas</h3>
        
        <#-- Crear lista aleatoria de máximo 5 blogs -->
        <#assign randomSidebarBlogs = [] />
        <#assign maxSidebarBlogs = 5 />
        <#assign totalBlogs = sidebarBlogs?size />
        
        <#-- Si hay menos de 5 blogs, mostrar todos -->
        <#if totalBlogs <= maxSidebarBlogs>
          <#assign randomSidebarBlogs = sidebarBlogs />
        <#else>
          <#-- Crear índices aleatorios únicos -->
          <#assign usedIndices = [] />
          <#assign randomSidebarBlogs = [] />
          <#assign currentTime = .now?long />
          
          <#list 0..<maxSidebarBlogs as i>
            <#assign randomIndex = (currentTime + i * 37) % totalBlogs />
            <#-- Evitar duplicados simples -->
            <#list 0..10 as attempt>
              <#if !usedIndices?seq_contains(randomIndex)>
                <#assign usedIndices = usedIndices + [randomIndex] />
                <#assign randomSidebarBlogs = randomSidebarBlogs + [sidebarBlogs[randomIndex]] />
                <#break />
              <#else>
                <#assign randomIndex = (randomIndex + 1) % totalBlogs />
              </#if>
            </#list>
          </#list>
        </#if>
        
        <#list randomSidebarBlogs as sidebarBlog>
          <div class="sidebar-item">
            <a href="${ctx.contextPath}/blog/${sidebarBlog.url}">
              <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/${sidebarBlog.image}" 
                   alt="${sidebarBlog.alt}"
                   onerror="this.style.display='none'" />
              <h4 class="sidebar-item-title">${sidebarBlog.title}</h4>
              <p class="sidebar-item-excerpt">${sidebarBlog.excerpt}</p>
            </a>
          </div>
        </#list>
        
      </aside>
    </div>
  </main>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
