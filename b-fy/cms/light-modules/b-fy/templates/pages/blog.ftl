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
    "title": "Identity verification, a growing challenge",
    "description": "In an increasingly complex digital environment, human identity verification and cybersecurity are essential to protect users and businesses from emerging threats.",
    "keywords": "identity verification, cybersecurity, biometrics, B-FY, digital identity",
    "author": "B-FY Research Team",
    "date": "January 12, 2025",
    "heroImage": "identity-verification-growing-challenge.webp",
    "heroAlt": "Identity verification, a growing challenge",
    "content": [
      {
        "type": "text",
        "text": "In an increasingly complex digital environment, human identity verification and cybersecurity are essential to protect users and businesses from emerging threats. Looking towards 2025, technologies such as biometrics, artificial intelligence, and quantum computing will redefine online security.",
        "strong": true
      },
      {
        "type": "text", 
        "text": "The digital world is evolving rapidly, bringing with it both opportunities and risks. In this context, identity verification and cybersecurity are becoming key areas to protect users and businesses from increasingly sophisticated threats."
      },
      {
        "type": "text",
        "text": "As technologies advance, solutions like B-FY, which focus on unequivocal identification of people without giving access to digital identities, are presented as an important advance to address these challenges."
      },
      {
        "type": "section_title",
        "text": "Identity verification, the key"
      },
      {
        "type": "text",
        "text": "Identity verification has become a fundamental aspect of online security. As digital activities multiply, the risks of identity theft and fraud also increase. Traditional passwords are no longer sufficient to protect confidential information.",
        "strong": "Identity verification"
      },
      {
        "type": "text",
        "text": "In this regard, biometrics (such as facial recognition, fingerprints and voice recognition) is emerging as a key tool to ensure that only authorized people can access online services."
      },
      {
        "type": "image",
        "src": "human-authentication-revolutionary-approach-data-protection.webp",
        "alt": "Human authentication: a revolutionary approach"
      },
      {
        "type": "text",
        "text": "As threats become more complex, biometric authentication continues to gain ground in sectors such as banking, healthcare and other critical services. However, beyond standard biometrics, solutions like B-FY stand out for their ability to unequivocally identify people, avoiding access to digital identities."
      },
      {
        "type": "section_title",
        "text": "The rise of cyber threats"
      },
      {
        "type": "text",
        "text": "As companies become more dependent on technology, cyber threats become increasingly complex. The use of artificial intelligence by cybercriminals is growing, allowing them to execute more targeted and effective attacks."
      },
      {
        "type": "text",
        "text": "Among emerging threats, deepfakes are one of the most concerning. These AI-created falsifications can fool authentication systems and employees, putting security at risk."
      },
      {
        "type": "section_title",
        "text": "The future of digital security"
      },
      {
        "type": "text",
        "text": "Looking ahead to 2025 and beyond, the convergence of biometric authentication, artificial intelligence, and blockchain technology promises to create more robust and user-friendly security frameworks. Organizations that adapt early to these technologies will be better positioned to protect their assets and maintain customer trust."
      }
    ]
  },
  "cybersecurity-trends-2025": {
    "title": "Cybersecurity trends: an evolving landscape",
    "description": "Digital acceleration and the proliferation of cyber threats have redefined business priorities in security. In 2025, cybersecurity is set to become a critical element.",
    "keywords": "cybersecurity trends, 2025, digital security, AI threats, B-FY",
    "author": "B-FY Security Team",
    "date": "January 15, 2025",
    "heroImage": "cybersecurity-trends-evolving-landscape.webp",
    "heroAlt": "Cybersecurity trends: an evolving landscape",
    "content": [
      {
        "type": "text",
        "text": "Digital acceleration and the proliferation of cyber threats have redefined business priorities in security. In 2025, cybersecurity is set to become a critical element not only for protecting data but also for ensuring customer trust and operational continuity.",
        "strong": true
      },
      {
        "type": "text",
        "text": "The cybersecurity landscape is evolving at an unprecedented pace. Organizations face increasingly complex challenges that require innovative solutions and proactive approaches to stay ahead of emerging threats."
      },
      {
        "type": "section_title",
        "text": "Key trends for 2025"
      },
      {
        "type": "text",
        "text": "Companies are adopting emerging technologies such as artificial intelligence and machine learning to detect and prevent threats in real time. Biometric authentication is becoming the gold standard for identity verification.",
        "strong": "artificial intelligence and machine learning"
      },
      {
        "type": "text",
        "text": "The rise of quantum computing presents both opportunities and challenges for cybersecurity. While it promises enhanced encryption capabilities, it also threatens to render current cryptographic methods obsolete."
      },
      {
        "type": "image",
        "src": "cybersecurity-moves-toward-passwordless-future-b-fys-approach.webp",
        "alt": "Passwordless future with B-FY's approach"
      },
      {
        "type": "section_title",
        "text": "AI-powered security solutions"
      },
      {
        "type": "text",
        "text": "Artificial intelligence is revolutionizing how organizations approach cybersecurity. From predictive analytics to automated threat response, AI enables faster and more accurate security decisions than ever before."
      },
      {
        "type": "text",
        "text": "Machine learning algorithms can analyze vast amounts of data to identify patterns and anomalies that would be impossible for human analysts to detect. This capability is particularly valuable in identifying zero-day attacks and advanced persistent threats."
      },
      {
        "type": "section_title",
        "text": "The human factor"
      },
      {
        "type": "text",
        "text": "Despite technological advances, the human factor remains the weakest link in cybersecurity. Organizations are investing heavily in employee training and awareness programs to reduce the risk of social engineering attacks."
      },
      {
        "type": "text",
        "text": "Solutions like B-FY's human authentication technology address this challenge by ensuring that the person behind every digital interaction is genuine, effectively eliminating the risk of impersonation and identity fraud."
      }
    ]
  },
  "identity-fraud-threat": {
    "title": "Identity fraud: a growing threat",
    "description": "As identity fraud becomes increasingly sophisticated, organizations and individuals must be more vigilant than ever in safeguarding their data.",
    "keywords": "identity fraud, cybercrime, data protection, AI attacks, deepfakes",
    "author": "B-FY Fraud Prevention Team",
    "date": "January 18, 2025",
    "heroImage": "identity-fraud-growing-threat.webp",
    "heroAlt": "Identity fraud: a growing threat",
    "content": [
      {
        "type": "text",
        "text": "As identity fraud becomes increasingly sophisticated, organizations and individuals must be more vigilant than ever in safeguarding their data. With a rise in AI-driven attacks and deepfakes, financial losses and digital security risks continue to escalate.",
        "strong": true
      },
      {
        "type": "text",
        "text": "Identity fraud has evolved from simple information theft to complex operations that leverage advanced technologies to create convincing false identities. The financial and reputational damage caused by these attacks is reaching unprecedented levels."
      },
      {
        "type": "section_title",
        "text": "The impact of identity fraud"
      },
      {
        "type": "text",
        "text": "Statistics show an alarming increase in identity fraud cases, with losses reaching trillions of dollars annually. Victims suffer not only financial losses but also damage to their reputation and emotional well-being.",
        "strong": "trillions of dollars annually"
      },
      {
        "type": "text",
        "text": "The proliferation of digital services and online transactions has created more opportunities for fraudsters to exploit vulnerabilities. Traditional security measures are proving inadequate against sophisticated attack vectors."
      },
      {
        "type": "image",
        "src": "b-fy-introduces-revolutionary-solution-terminate-online-id-fraud-cybercrime.webp",
        "alt": "B-FY's revolutionary solution against fraud"
      },
      {
        "type": "section_title",
        "text": "AI-driven fraud techniques"
      },
      {
        "type": "text",
        "text": "Artificial intelligence has become a double-edged sword in the fight against fraud. While it enables better detection and prevention capabilities, it also empowers fraudsters with new tools to create convincing fake identities and bypass security measures."
      },
      {
        "type": "text",
        "text": "Deepfake technology, in particular, poses a significant threat to biometric authentication systems. These AI-generated videos and audio recordings can fool traditional verification methods, making it crucial to implement more sophisticated detection techniques."
      },
      {
        "type": "section_title",
        "text": "Prevention and mitigation strategies"
      },
      {
        "type": "text",
        "text": "Organizations must adopt a multi-layered approach to fraud prevention, combining advanced technology with robust policies and procedures. This includes implementing real-time monitoring, behavioral analytics, and adaptive authentication systems."
      },
      {
        "type": "text",
        "text": "B-FY's human authentication technology offers a unique solution by verifying the physical presence of individuals without storing sensitive biometric data. This approach significantly reduces the risk of fraud while maintaining user privacy and compliance with data protection regulations."
      },
      {
        "type": "section_title",
        "text": "The future of fraud prevention"
      },
      {
        "type": "text",
        "text": "As fraud techniques continue to evolve, so must our defense mechanisms. The future of fraud prevention lies in proactive, intelligent systems that can adapt to new threats in real-time while maintaining a seamless user experience."
      }
    ]
  },
  "biometric-myths": {
    "title": "Five myths about biometric authentication",
    "description": "Debunking common misconceptions about biometric authentication technology and discovering the reality behind these innovative security solutions.",
    "keywords": "biometric authentication, myths, security technology, privacy, B-FY",
    "author": "B-FY Technology Team",
    "date": "January 20, 2025",
    "heroImage": "five-myths-abouth-biometric-authentication.webp",
    "heroAlt": "Five myths about biometric authentication",
    "content": [
      {
        "type": "text",
        "text": "Biometric authentication has gained popularity as an advanced security solution, but it has also generated several myths and misunderstandings. It's important to separate facts from fiction to truly understand the potential and limitations of this technology.",
        "strong": true
      },
      {
        "type": "text",
        "text": "In this article, we'll debunk five common misconceptions about biometric authentication and provide accurate information based on scientific evidence and practical experience."
      },
      {
        "type": "section_title",
        "text": "Myth 1: Biometrics is infallible"
      },
      {
        "type": "text",
        "text": "While biometric authentication is highly secure, it is not completely infallible. Like any technology, it has limitations and vulnerabilities that must be considered in its implementation.",
        "strong": "highly secure"
      },
      {
        "type": "text",
        "text": "The key is to understand that biometrics should be part of a comprehensive security strategy, not a standalone solution. When properly implemented with additional security layers, biometric systems can achieve extremely high levels of accuracy and security."
      },
      {
        "type": "section_title",
        "text": "Myth 2: Biometric data can be easily stolen"
      },
      {
        "type": "text",
        "text": "One of the most persistent myths is that biometric data is easily compromised. In reality, modern biometric systems like B-FY's don't store raw biometric data but instead use mathematical representations that cannot be reverse-engineered."
      },
      {
        "type": "image",
        "src": "human-authentication-revolutionary-approach-data-protection.webp",
        "alt": "Secure biometric data protection"
      },
      {
        "type": "text",
        "text": "B-FY's approach goes even further by ensuring that biometric data never leaves the user's device, eliminating the risk of centralized data breaches while maintaining the highest levels of security and privacy."
      },
      {
        "type": "section_title",
        "text": "Myth 3: Biometrics violates privacy"
      },
      {
        "type": "text",
        "text": "Privacy concerns are valid but often based on outdated understanding of biometric technology. Modern solutions like B-FY prioritize privacy by design, ensuring that personal biometric information remains under the user's control at all times."
      },
      {
        "type": "text",
        "text": "The technology uses the native biometric capabilities of users' devices without transmitting or storing sensitive biometric data externally. This approach complies with the strictest data protection regulations while providing robust authentication."
      },
      {
        "type": "section_title",
        "text": "Myth 4: Biometric systems are too expensive"
      },
      {
        "type": "text",
        "text": "While the initial investment in biometric systems may seem high, the long-term benefits far outweigh the costs. Reduced fraud, improved security, and enhanced user experience lead to significant cost savings over time."
      },
      {
        "type": "text",
        "text": "Additionally, cloud-based biometric solutions like B-FY's Authentication as a Service (AaaS) model make advanced biometric authentication accessible to organizations of all sizes without requiring significant upfront investments."
      },
      {
        "type": "section_title",
        "text": "Myth 5: Biometrics is complicated to implement"
      },
      {
        "type": "text",
        "text": "Modern biometric solutions are designed for easy integration with existing systems. APIs and SDKs make it possible to implement biometric authentication without extensive technical knowledge or infrastructure changes."
      },
      {
        "type": "text",
        "text": "B-FY's platform exemplifies this approach, offering seamless integration with existing cybersecurity and 2FA systems, allowing organizations to enhance their security posture without disrupting current operations."
      },
      {
        "type": "section_title",
        "text": "The reality of biometric authentication"
      },
      {
        "type": "text",
        "text": "Biometric authentication represents a significant advancement in digital security, offering a balance of convenience, security, and privacy when properly implemented. Understanding the facts helps organizations make informed decisions about adopting this transformative technology."
      }
    ]
  },
  "human-authentication-revolutionary": {
    "title": "Human authentication: a revolutionary approach to data protection",
    "description": "Human authentication, driven by biometric technologies, is transforming digital security by offering a safer and more efficient solution to the risks posed by traditional passwords.",
    "keywords": "human authentication, biometric technology, data protection, digital security, B-FY",
    "author": "B-FY Innovation Team",
    "date": "January 22, 2025",
    "heroImage": "human-authentication-revolutionary-approach-data-protection.webp",
    "heroAlt": "Human authentication: a revolutionary approach to data protection",
    "content": [
      {
        "type": "text",
        "text": "Human authentication, driven by biometric technologies, is transforming digital security by offering a safer and more efficient solution to the risks posed by traditional passwords. In this context, B-FY stands out as a leader, developing an innovative technology that protects data without compromising user privacy.",
        "strong": true
      },
      {
        "type": "text",
        "text": "The era of passwords is coming to an end. As digital transformation accelerates, organizations worldwide are recognizing the need for more secure, user-friendly authentication methods that can adapt to the evolving threat landscape."
      },
      {
        "type": "section_title",
        "text": "The password problem"
      },
      {
        "type": "text",
        "text": "Traditional password-based authentication suffers from numerous vulnerabilities. Users often choose weak passwords, reuse them across multiple platforms, and struggle to manage the growing number of accounts they need to access."
      },
      {
        "type": "text",
        "text": "Cybercriminals exploit these weaknesses through various attack vectors including brute force attacks, credential stuffing, and social engineering. The result is a security landscape where passwords represent the weakest link in an organization's defense strategy."
      },
      {
        "type": "section_title",
        "text": "The biometric advantage"
      },
      {
        "type": "text",
        "text": "Biometric authentication leverages unique physical characteristics that cannot be easily replicated or stolen. Unlike passwords, biometric traits are inherently tied to the individual, providing a more secure foundation for digital identity verification.",
        "strong": "unique physical characteristics"
      },
      {
        "type": "image",
        "src": "b-fys-human-authentication-transforms-traveler-experience.webp",
        "alt": "B-FY transforming user experience"
      },
      {
        "type": "text",
        "text": "Modern biometric systems offer several advantages over traditional authentication methods: improved security, enhanced user experience, reduced administrative overhead, and compliance with regulatory requirements."
      },
      {
        "type": "section_title",
        "text": "B-FY's innovative approach"
      },
      {
        "type": "text",
        "text": "B-FY's human authentication technology goes beyond conventional biometric solutions by ensuring that biometric data never leaves the user's device. This approach addresses privacy concerns while maintaining the highest levels of security."
      },
      {
        "type": "text",
        "text": "The technology works by utilizing the native biometric capabilities of users' smartphones and other devices, creating a seamless authentication experience that doesn't compromise on security or privacy."
      },
      {
        "type": "section_title",
        "text": "Real-world applications"
      },
      {
        "type": "text",
        "text": "Human authentication technology is being successfully deployed across various industries, from healthcare and banking to logistics and events. Each sector benefits from reduced fraud, improved security, and enhanced user satisfaction."
      },
      {
        "type": "text",
        "text": "In the travel industry, for example, B-FY's technology is transforming the passenger experience by enabling secure, contactless authentication at various touchpoints throughout the journey, from check-in to boarding and beyond."
      },
      {
        "type": "section_title",
        "text": "The future of authentication"
      },
      {
        "type": "text",
        "text": "As we move towards an increasingly connected world, human authentication will play a crucial role in securing digital interactions. The technology's ability to provide strong authentication while preserving privacy makes it ideal for the challenges ahead."
      },
      {
        "type": "text",
        "text": "Organizations that adopt human authentication technology today will be better positioned to face future security challenges while providing their users with a superior digital experience."
      }
    ]
  },
  "bfy-consolidates-presence-worldwide": {
    "title": "B-FY consolidates its presence worldwide",
    "description": "B-FY's solution has already proven its effectiveness in various sectors, reinforcing its commitment to the battle against cybercrime and identity fraud.",
    "keywords": "B-FY expansion, global presence, cybersecurity, identity fraud prevention",
    "author": "B-FY Communications Team",
    "date": "January 25, 2025",
    "heroImage": "b-fy-consolidates-presence-worldwide.webp",
    "heroAlt": "B-FY consolidates its presence worldwide",
    "content": [
      {
        "type": "text",
        "text": "B-FY's solution has already proven its effectiveness in various sectors, including healthcare, banking, logistics, and events, among others, in countries like Spain and Mexico. By launching its solution in the US market, B-FY consolidates its worldwide presence and reinforces its commitment to the battle against cybercrime and identity fraud.",
        "strong": true
      },
      {
        "type": "text",
        "text": "The company's global expansion represents a significant milestone in the fight against digital fraud, bringing advanced human authentication technology to new markets and industries worldwide."
      },
      {
        "type": "section_title",
        "text": "Proven track record"
      },
      {
        "type": "text",
        "text": "B-FY's technology has demonstrated remarkable success across diverse industries and geographical locations. From preventing identity fraud in banking transactions to securing access in healthcare facilities, the solution has consistently delivered outstanding results."
      },
      {
        "type": "text",
        "text": "The company's success in Spain and Mexico has provided valuable insights into different market requirements and regulatory environments, preparing B-FY for successful expansion into other regions."
      },
      {
        "type": "section_title",
        "text": "Global market opportunity"
      },
      {
        "type": "text",
        "text": "The global cybersecurity market is experiencing unprecedented growth, driven by increasing digitalization and rising cyber threats. B-FY's unique approach to human authentication positions it to capture a significant share of this expanding market."
      },
      {
        "type": "image",
        "src": "b-fy-enters-us-market.webp",
        "alt": "B-FY enters the US market"
      },
      {
        "type": "text",
        "text": "With the potential to address cybercrime losses estimated at $145 billion annually, B-FY's technology represents not just a security solution but a significant economic opportunity for organizations worldwide."
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
  <#if blogSlug?contains("identity-verification") || blogSlug?contains("verification")>
    <#assign currentBlog = blogData["identity-verification-challenge"] />
  <#elseif blogSlug?contains("cybersecurity") || blogSlug?contains("trends")>
    <#assign currentBlog = blogData["cybersecurity-trends-2025"] />
  <#elseif blogSlug?contains("fraud") || blogSlug?contains("threat")>
    <#assign currentBlog = blogData["identity-fraud-threat"] />
  <#elseif blogSlug?contains("biometric") || blogSlug?contains("myths")>
    <#assign currentBlog = blogData["biometric-myths"] />
  <#elseif blogSlug?contains("human-authentication") || blogSlug?contains("revolutionary")>
    <#assign currentBlog = blogData["human-authentication-revolutionary"] />
  <#elseif blogSlug?contains("bfy-consolidates") || blogSlug?contains("worldwide")>
    <#assign currentBlog = blogData["bfy-consolidates-presence-worldwide"] />
  <#else>
    <#-- Si no hay slug o no coincide, usar el blog por defecto -->
    <#assign currentBlog = blogData["identity-verification-challenge"] />
  </#if>
</#if>

<#-- SIDEBAR DATA - Lista de otros blogs -->
<#assign sidebarBlogs = [
  {
    "title": "IDENTITY FRAUD: A GROWING THREAT",
    "excerpt": "As identity fraud becomes increasingly sophisticated, organizations and individuals must be more vigilant...",
    "image": "identity-fraud-growing-threat.webp",
    "alt": "Identity fraud: a growing threat",
    "url": "identity-fraud-threat"
  },
  {
    "title": "CYBERSECURITY TRENDS: AN EVOLVING LANDSCAPE",
    "excerpt": "Digital acceleration and the proliferation of cyber threats have redefined business priorities...",
    "image": "cybersecurity-trends-evolving-landscape.webp",
    "alt": "Cybersecurity trends: an evolving landscape",
    "url": "cybersecurity-trends-2025"
  },
  {
    "title": "FIVE MYTHS ABOUT BIOMETRIC AUTHENTICATION",
    "excerpt": "Debunking common misconceptions about biometric authentication technology and discovering the reality...",
    "image": "five-myths-abouth-biometric-authentication.webp",
    "alt": "Five myths about biometric authentication",
    "url": "biometric-myths"
  },
  {
    "title": "HUMAN AUTHENTICATION: A REVOLUTIONARY APPROACH",
    "excerpt": "Human authentication is transforming digital security by offering a safer solution to password risks...",
    "image": "human-authentication-revolutionary-approach-data-protection.webp",
    "alt": "Human authentication: a revolutionary approach",
    "url": "human-authentication-revolutionary"
  },
  {
    "title": "B-FY CONSOLIDATES ITS PRESENCE WORLDWIDE",
    "excerpt": "B-FY's solution has proven its effectiveness in various sectors, reinforcing its global commitment...",
    "image": "b-fy-consolidates-presence-worldwide.webp",
    "alt": "B-FY consolidates its presence worldwide",
    "url": "bfy-consolidates-presence-worldwide"
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
