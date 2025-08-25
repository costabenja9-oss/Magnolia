<#ftl output_format="HTML">

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

<#-- DATOS DE TODOS LOS BLOGS DISPONIBLES -->
<#assign blogData = {
  "identity-verification-challenge": {
    "title": "Verificación de identidad, un desafío creciente",
    "description": "En un entorno digital cada vez más complejo, la verificación de identidad y la ciberseguridad son esenciales para proteger a usuarios y empresas de las amenazas emergentes.",
    "keywords": "verificación de identidad, ciberseguridad, biometría, B-FY",
    "author": "B-FY Research Team",
    "date": "12 de enero, 2025",
    "heroImage": "identity-verification-growing-challenge.webp",
    "heroAlt": "Verificación de identidad, un desafío creciente",
    "content": [
      {
        "type": "text",
        "text": "En un entorno digital cada vez más complejo, la verificación de identidad y la ciberseguridad son esenciales para proteger a usuarios y empresas de las amenazas emergentes. De cara a 2025, tecnologías como la biometría, la inteligencia artificial y el blockchain están redefiniendo la seguridad en línea.",
        "strong": true
      },
      {
        "type": "text", 
        "text": "El mundo digital está evolucionando rápidamente, trayendo consigo tanto oportunidades como riesgos. En este contexto, la verificación de identidad y la ciberseguridad se están convirtiendo en áreas clave para proteger a usuarios y empresas de amenazas cada vez más sofisticadas."
      },
      {
        "type": "text",
        "text": "A medida que las tecnologías avanzan, soluciones como B-FY, que se centran en la identificación inequívoca de personas sin dar acceso a identidades digitales, se presentan como un avance importante para abordar estos desafíos."
      },
      {
        "type": "section_title",
        "text": "Verificación de identidad, la clave"
      },
      {
        "type": "text",
        "text": "La verificación de identidad se ha convertido en un aspecto fundamental de la seguridad en línea. A medida que las actividades digitales se multiplican, los riesgos de robo de identidad y fraude también aumentan. Las contraseñas tradicionales ya no son suficientes para proteger la información confidencial.",
        "strong": "verificación de identidad"
      },
      {
        "type": "text",
        "text": "En este sentido, la biometría (como el reconocimiento facial, las huellas dactilares y el reconocimiento de voz) está emergiendo como una herramienta clave para asegurar que solo las personas autorizadas puedan acceder a servicios en línea."
      },
      {
        "type": "image",
        "src": "human-authentication-revolutionary-approach-data-protection.webp",
        "alt": "Autenticación humana: un enfoque revolucionario"
      },
      {
        "type": "text",
        "text": "A medida que las amenazas se vuelven más complejas, la autenticación biométrica sigue ganando terreno en sectores como la banca, la salud y otros servicios críticos. No obstante, más allá de la biometría estándar, soluciones como B-FY se destacan por su capacidad para identificar inequívocamente a las personas, evitando el acceso a identidades digitales."
      },
      {
        "type": "section_title",
        "text": "El aumento de las amenazas cibernéticas"
      },
      {
        "type": "text",
        "text": "A medida que las empresas dependen más de la tecnología, las amenazas cibernéticas se vuelven cada vez más complejas. El uso de la inteligencia artificial por parte de los cibercriminales está creciendo, permitiéndoles ejecutar ataques más dirigidos y efectivos."
      },
      {
        "type": "text",
        "text": "Entre las amenazas emergentes, los deepfakes son una de las más preocupantes. Estas falsificaciones creadas con IA, pueden engañar a los sistemas de autenticación y a los empleados, lo que pone en riesgo la seguridad."
      }
    ]
  },
  "cybersecurity-trends-2025": {
    "title": "Tendencias de ciberseguridad: un panorama en evolución",
    "description": "La aceleración digital y la proliferación de amenazas cibernéticas han redefinido las prioridades empresariales en materia de seguridad.",
    "keywords": "ciberseguridad, tendencias 2025, amenazas digitales, B-FY",
    "author": "B-FY Security Team",
    "date": "15 de enero, 2025",
    "heroImage": "cybersecurity-trends-evolving-landscape.webp",
    "heroAlt": "Tendencias de ciberseguridad 2025",
    "content": [
      {
        "type": "text",
        "text": "La aceleración digital y la proliferación de amenazas cibernéticas han redefinido las prioridades empresariales en materia de seguridad. En 2025, la ciberseguridad está destinada a convertirse en un elemento crítico no solo para proteger datos, sino también para garantizar la confianza del cliente y la continuidad operacional.",
        "strong": true
      },
      {
        "type": "text",
        "text": "El panorama de la ciberseguridad está evolucionando a un ritmo sin precedentes. Las organizaciones enfrentan desafíos cada vez más complejos que requieren soluciones innovadoras y enfoques proactivos."
      },
      {
        "type": "section_title",
        "text": "Principales tendencias para 2025"
      },
      {
        "type": "text",
        "text": "Las empresas están adoptando tecnologías emergentes como la inteligencia artificial y el machine learning para detectar y prevenir amenazas en tiempo real. La autenticación biométrica se está convirtiendo en el estándar de oro para la verificación de identidad."
      }
    ]
  },
  "identity-fraud-threat": {
    "title": "Fraude de identidad: una amenaza creciente",
    "description": "A medida que el fraude de identidad se vuelve cada vez más sofisticado, las organizaciones deben estar más vigilantes que nunca.",
    "keywords": "fraude de identidad, seguridad digital, prevención de fraude, B-FY",
    "author": "B-FY Fraud Prevention Team",
    "date": "18 de enero, 2025",
    "heroImage": "identity-fraud-growing-threat.webp",
    "heroAlt": "Fraude de identidad: una amenaza creciente",
    "content": [
      {
        "type": "text",
        "text": "A medida que el fraude de identidad se vuelve cada vez más sofisticado, las organizaciones y los individuos deben estar más vigilantes que nunca en la protección de sus datos. Con el aumento de ataques impulsados por IA y deepfakes, las pérdidas financieras y los riesgos de seguridad digital continúan escalando.",
        "strong": true
      },
      {
        "type": "text",
        "text": "El fraude de identidad ha evolucionado desde simples robos de información hasta operaciones complejas que aprovechan tecnologías avanzadas para crear identidades falsas convincentes."
      },
      {
        "type": "section_title",
        "text": "El impacto del fraude de identidad"
      },
      {
        "type": "text",
        "text": "Las estadísticas muestran un aumento alarmante en los casos de fraude de identidad, con pérdidas que alcanzan billones de dólares anualmente. Las víctimas no solo sufren pérdidas financieras, sino también daños a su reputación y bienestar emocional."
      }
    ]
  },
  "biometric-myths": {
    "title": "Cinco mitos sobre la autenticación biométrica",
    "description": "Desmitifica las ideas erróneas comunes sobre la tecnología de autenticación biométrica y descubre la realidad.",
    "keywords": "autenticación biométrica, mitos, seguridad, tecnología, B-FY",
    "author": "B-FY Technology Team",
    "date": "20 de enero, 2025",
    "heroImage": "five-myths-abouth-biometric-authentication.webp",
    "heroAlt": "Cinco mitos sobre la autenticación biométrica",
    "content": [
      {
        "type": "text",
        "text": "La autenticación biométrica ha ganado popularidad como una solución de seguridad avanzada, pero también ha generado varios mitos y malentendidos. Es importante separar los hechos de la ficción para entender verdaderamente el potencial y las limitaciones de esta tecnología.",
        "strong": true
      },
      {
        "type": "text",
        "text": "En este artículo, desmitificaremos cinco conceptos erróneos comunes sobre la autenticación biométrica y proporcionaremos información precisa basada en evidencia científica y experiencia práctica."
      },
      {
        "type": "section_title",
        "text": "Mito 1: La biometría es infalible"
      },
      {
        "type": "text",
        "text": "Aunque la autenticación biométrica es altamente segura, no es completamente infalible. Como cualquier tecnología, tiene sus limitaciones y vulnerabilidades que deben ser consideradas en su implementación."
      }
    ]
  }
} />

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
  <#if blogSlug?contains("identity-verification") || blogSlug?contains("verificacion-identidad")>
    <#assign currentBlog = blogData["identity-verification-challenge"] />
  <#elseif blogSlug?contains("cybersecurity") || blogSlug?contains("ciberseguridad")>
    <#assign currentBlog = blogData["cybersecurity-trends-2025"] />
  <#elseif blogSlug?contains("fraud") || blogSlug?contains("fraude")>
    <#assign currentBlog = blogData["identity-fraud-threat"] />
  <#elseif blogSlug?contains("biometric") || blogSlug?contains("myths") || blogSlug?contains("mitos")>
    <#assign currentBlog = blogData["biometric-myths"] />
  <#else>
    <#-- Si no hay slug o no coincide, usar el blog por defecto que es identity-verification-challenge -->
    <#assign currentBlog = blogData["identity-verification-challenge"] />
  </#if>
</#if>

<#-- SIDEBAR DATA - Lista de otros blogs -->
<#assign sidebarBlogs = [
  {
    "title": "FRAUDE DE IDENTIDAD: UNA AMENAZA CRECIENTE",
    "excerpt": "A medida que el fraude de identidad se vuelve cada vez más sofisticado, las organizaciones...",
    "image": "identity-fraud-growing-threat.webp",
    "alt": "Fraude de identidad: una amenaza creciente",
    "url": "identity-fraud-threat"
  },
  {
    "title": "TENDENCIAS DE CIBERSEGURIDAD: UN PANORAMA EN EVOLUCIÓN",
    "excerpt": "La aceleración digital y la proliferación de amenazas cibernéticas han redefinido...",
    "image": "cybersecurity-trends-evolving-landscape.webp",
    "alt": "Tendencias de ciberseguridad 2025",
    "url": "cybersecurity-trends-2025"
  },
  {
    "title": "CINCO MITOS SOBRE LA AUTENTICACIÓN BIOMÉTRICA",
    "excerpt": "Desmitifica las ideas erróneas comunes sobre la tecnología de autenticación biométrica...",
    "image": "five-myths-abouth-biometric-authentication.webp",
    "alt": "Cinco mitos sobre la autenticación biométrica",
    "url": "biometric-myths"
  }
] />

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
          
          <!-- DEBUG INFO (remover en producción) -->
          <div style="background: #f0f0f0; padding: 10px; margin: 10px 0; font-size: 12px; color: #666;">
            <strong>DEBUG:</strong><br>
            Request URI: ${currentPath!"N/A"}<br>
            Full URL: ${fullURL!"N/A"}<br>
            Query String: ${queryString!"N/A"}<br>
            Story Param: ${ctx.request.getParameter("story")!"N/A"}<br>
            Complete Path: ${completePath!"N/A"}<br>
            Blog Slug: ${blogSlug!"N/A"}<br>
            Content Name: ${(content.@name)!"N/A"}<br>
            Content Title: ${(content.title)!"N/A"}<br>
            Selected Blog: ${currentBlog.title!"N/A"}<br>
            Content Items: ${(currentBlog.content![])?size}<br>
            Available Blog Keys: identity-verification-challenge, cybersecurity-trends-2025, identity-fraud-threat, biometric-myths
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
        
        <#list sidebarBlogs as sidebarBlog>
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
