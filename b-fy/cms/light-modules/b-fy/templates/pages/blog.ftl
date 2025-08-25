<#ftl output_format="HTML">
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>${content.title!"Blog | B-FY"}</title>
  <meta name="description" content="${content.description!"B-FY blog posts about biometric authentication and cybersecurity."}" />
  <meta name="keywords" content="${content.keywords!"biometric authentication, cybersecurity, B-FY"}" />
  
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
        <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/identity-verification-growing-challenge.webp" 
             alt="Verificación de identidad, un desafío creciente" 
             class="blog-hero-image"
             onerror="this.style.display='none'" />
        
        <div class="blog-content">
          <!-- Título Principal -->
          <h1 class="blog-title">Verificación de identidad, un desafío creciente</h1>
          
          <!-- Meta información -->
          <div class="blog-meta">
            Por B-FY Research Team • 12 de enero, 2025
          </div>
          
          <!-- Contenido del Blog -->
          <p class="blog-text">
            <strong>En un entorno digital cada vez más complejo, la verificación de identidad y la ciberseguridad son esenciales para proteger a usuarios y empresas de las amenazas emergentes.</strong> De cara a 2025, tecnologías como la biometría, la inteligencia artificial y el blockchain están redefiniendo la seguridad en línea.
          </p>
          
          <p class="blog-text">
            El mundo digital está evolucionando rápidamente, trayendo consigo tanto oportunidades como riesgos. En este contexto, la verificación de identidad y la ciberseguridad se están convirtiendo en áreas clave para proteger a usuarios y empresas de amenazas cada vez más sofisticadas.
          </p>
          
          <p class="blog-text">
            A medida que las tecnologías avanzan, soluciones como B-FY, que se centran en la identificación inequívoca de personas sin dar acceso a identidades digitales, se presentan como un avance importante para abordar estos desafíos.
          </p>
          
          <h2 class="blog-section-title">Verificación de identidad, la clave</h2>
          
          <p class="blog-text">
            La <strong>verificación de identidad</strong> se ha convertido en un aspecto fundamental de la seguridad en línea. A medida que las actividades digitales se multiplican, los riesgos de robo de identidad y fraude también aumentan. Las contraseñas tradicionales ya no son suficientes para proteger la información confidencial.
          </p>
          
          <p class="blog-text">
            En este sentido, la biometría (como el reconocimiento facial, las huellas dactilares y el reconocimiento de voz) está emergiendo como una herramienta clave para asegurar que solo las personas autorizadas puedan acceder a servicios en línea.
          </p>
          
          <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/human-authentication-revolutionary-approach-data-protection.webp" 
               alt="Autenticación humana: un enfoque revolucionario" 
               class="blog-image"
               onerror="this.style.display='none'" />
          
          <p class="blog-text">
            A medida que las amenazas se vuelven más complejas, la autenticación biométrica sigue ganando terreno en sectores como la banca, la salud y otros servicios críticos. No obstante, más allá de la biometría estándar, soluciones como B-FY se destacan por su capacidad para identificar inequívocamente a las personas, evitando el acceso a identidades digitales.
          </p>
          
          <h2 class="blog-section-title">El aumento de las amenazas cibernéticas</h2>
          
          <p class="blog-text">
            A medida que las empresas dependen más de la tecnología, las amenazas cibernéticas se vuelven cada vez más complejas. El uso de la inteligencia artificial por parte de los cibercriminales está creciendo, permitiéndoles ejecutar ataques más dirigidos y efectivos.
          </p>
          
          <p class="blog-text">
            Entre las amenazas emergentes, los deepfakes son una de las más preocupantes. Estas falsificaciones creadas con IA, pueden engañar a los sistemas de autenticación y a los empleados, lo que pone en riesgo la seguridad.
          </p>
          
        </div>
      </article>
      
      <!-- Sidebar -->
      <aside class="sidebar">
        <h3 class="sidebar-title">Otras Entradas</h3>
        
        <div class="sidebar-item">
          <a href="${ctx.contextPath}/blog/identity-fraud-threat">
            <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/identity-fraud-growing-threat.webp" 
                 alt="Fraude de identidad: una amenaza creciente"
                 onerror="this.style.display='none'" />
            <h4 class="sidebar-item-title">FRAUDE DE IDENTIDAD: UNA AMENAZA CRECIENTE</h4>
            <p class="sidebar-item-excerpt">A medida que el fraude de identidad se vuelve cada vez más sofisticado, las organizaciones...</p>
          </a>
        </div>
        
        <div class="sidebar-item">
          <a href="${ctx.contextPath}/blog/cybersecurity-trends-2025">
            <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/cybersecurity-trends-evolving-landscape.webp" 
                 alt="Tendencias de ciberseguridad 2025"
                 onerror="this.style.display='none'" />
            <h4 class="sidebar-item-title">TENDENCIAS DE CIBERSEGURIDAD: UN PANORAMA EN EVOLUCIÓN</h4>
            <p class="sidebar-item-excerpt">La aceleración digital y la proliferación de amenazas cibernéticas han redefinido...</p>
          </a>
        </div>
        
        <div class="sidebar-item">
          <a href="${ctx.contextPath}/blog/biometric-myths">
            <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/five-myths-abouth-biometric-authentication.webp" 
                 alt="Cinco mitos sobre la autenticación biométrica"
                 onerror="this.style.display='none'" />
            <h4 class="sidebar-item-title">CINCO MITOS SOBRE LA AUTENTICACIÓN BIOMÉTRICA</h4>
            <p class="sidebar-item-excerpt">Desmitifica las ideas erróneas comunes sobre la tecnología de autenticación biométrica...</p>
          </a>
        </div>
      </aside>
    </div>
  </main>

  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
