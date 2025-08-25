[#-- BLOG DATA ASSIGNMENTS - Multiple hardcoded blogs by route --]
[#include "/b-fy/templates/shared/functions.ftl"]

[#-- Get blog name from URL parameter --]
[#assign blogName = ctx.getParameter('story')!]

[#-- HARDCODED BLOG POSTS DATA --]
[#assign blogPosts = {
  "cybersecurity-trends-2025": {
    "title": "Cybersecurity trends: an evolving landscape",
    "description": "Digital acceleration and the proliferation of cyber threats have redefined business priorities in security. In 2025, cybersecurity is set to become a critical element not only for protecting data but also for ensuring customer trust and operational continuity.",
    "category": "cybersecurity",
    "image": "cybersecurity-trends-evolving-landscape.webp",
    "author": "B-FY Security Team",
    "date": "2025-01-15",
    "content": "<h2>The Current Cybersecurity Landscape</h2><p>As we advance into 2025, the cybersecurity landscape continues to evolve at an unprecedented pace. Organizations worldwide are facing increasingly sophisticated threats that challenge traditional security paradigms.</p><h3>Emerging Threats</h3><p>The rise of AI-powered attacks has fundamentally changed how we approach cybersecurity. <strong>Machine learning algorithms</strong> are now being weaponized by cybercriminals to create more convincing phishing attempts and bypass traditional security measures.</p><blockquote>\"The future of cybersecurity lies not just in defending against known threats, but in anticipating and preparing for the unknown.\" - B-FY Research Team</blockquote><h3>Key Trends for 2025</h3><ul><li><strong>Zero Trust Architecture:</strong> Moving beyond perimeter security to verify every user and device</li><li><strong>Quantum-Safe Cryptography:</strong> Preparing for the quantum computing era</li><li><strong>AI-Driven Defense:</strong> Using artificial intelligence to combat AI-powered attacks</li><li><strong>Biometric Authentication:</strong> Enhanced security through human verification</li></ul><p>Organizations must adapt their security strategies to address these evolving challenges while maintaining operational efficiency and user experience.</p>"
  },
  "identity-verification-challenge": {
    "title": "Identity verification, a growing challenge",
    "description": "In an increasingly complex digital environment, human identity verification and cybersecurity are essential to protect users and businesses from emerging threats. Looking towards 2025, technologies such as biometrics, artificial intelligence, and quantum computing will redefine online security.",
    "category": "biometrics",
    "image": "identity-verification-growing-challenge.webp",
    "author": "B-FY Research Team",
    "date": "2025-01-10",
    "content": "<h2>The Challenge of Digital Identity</h2><p>Identity verification has become one of the most critical challenges in our digital-first world. As businesses increasingly move online, the need for secure, reliable, and user-friendly identity verification solutions has never been greater.</p><h3>Current Challenges</h3><p>Traditional authentication methods are proving inadequate against modern threats:</p><ul><li><strong>Password vulnerabilities:</strong> Over 80% of data breaches involve compromised passwords</li><li><strong>Social engineering attacks:</strong> Sophisticated phishing and deepfake technologies</li><li><strong>Regulatory compliance:</strong> Increasing requirements for KYC and AML processes</li><li><strong>User experience:</strong> Balancing security with convenience</li></ul><h3>The Biometric Revolution</h3><p>Biometric technologies are emerging as the gold standard for identity verification. <strong>B-FY's innovative approach</strong> combines multiple biometric factors to create an unbreakable authentication system.</p><blockquote>\"Biometric authentication isn't just about fingerprints anymore. It's about creating a comprehensive digital identity that's impossible to fake.\" - B-FY CTO</blockquote><h3>Looking Ahead</h3><p>The future of identity verification will be shaped by:</p><ul><li>Advanced liveness detection</li><li>Multi-modal biometric fusion</li><li>Privacy-preserving authentication</li><li>Seamless user experiences</li></ul>"
  },
  "identity-fraud-growing-threat": {
    "title": "Identity fraud: a growing threat",
    "description": "As identity fraud becomes increasingly sophisticated, organizations and individuals must be more vigilant than ever in safeguarding their data. With a rise in AI-driven attacks and deepfakes, financial losses and digital security risks continue to escalate.",
    "category": "cybersecurity",
    "image": "identity-fraud-growing-threat.webp",
    "author": "B-FY Security Analysts",
    "date": "2025-01-05",
    "content": "<h2>The Rising Tide of Identity Fraud</h2><p>Identity fraud has evolved from simple impersonation to sophisticated, technology-driven schemes that can fool even the most advanced security systems. The financial and reputational costs are staggering.</p><h3>The Numbers Don't Lie</h3><p>Recent statistics paint a concerning picture:</p><ul><li><strong>$56 billion</strong> in losses due to identity fraud in 2024</li><li><strong>15 million</strong> consumers affected by identity fraud annually</li><li><strong>300%</strong> increase in synthetic identity fraud over the past five years</li></ul><h3>AI-Powered Attacks</h3><p>Cybercriminals are leveraging artificial intelligence to create more convincing fraud attempts:</p><blockquote>\"Deepfakes and AI-generated content have made it nearly impossible to distinguish between real and fake identities using traditional methods.\" - B-FY Fraud Prevention Team</blockquote><h3>Defense Strategies</h3><p>To combat these evolving threats, organizations need:</p><ul><li><strong>Real-time verification:</strong> Instant authentication at the point of interaction</li><li><strong>Behavioral analytics:</strong> Understanding normal user patterns</li><li><strong>Multi-factor authentication:</strong> Combining something you know, have, and are</li><li><strong>Continuous monitoring:</strong> Ongoing verification throughout the user journey</li></ul><p>B-FY's comprehensive authentication platform addresses all these requirements, providing unparalleled protection against identity fraud.</p>"
  },
  "human-authentication-revolutionary": {
    "title": "Human authentication: a revolutionary approach to data protection",
    "description": "Human authentication, driven by biometric technologies, is transforming digital security by offering a safer and more efficient solution to the risks posed by traditional passwords. In this context, B-FY stands out as a leader, developing an innovative technology that protects data without compromising user privacy.",
    "category": "biometrics",
    "image": "human-authentication-revolutionary-approach-data-protection.webp",
    "author": "B-FY Innovation Team",
    "date": "2024-12-28",
    "content": "<h2>Revolutionizing Authentication</h2><p>The era of passwords is coming to an end. Human authentication represents a paradigm shift in how we think about digital security, moving from what you know to who you are.</p><h3>The B-FY Advantage</h3><p>B-FY's revolutionary approach to human authentication combines cutting-edge biometric technologies with privacy-preserving techniques:</p><ul><li><strong>Liveness detection:</strong> Ensuring the person is physically present</li><li><strong>Multi-modal biometrics:</strong> Combining facial, voice, and behavioral patterns</li><li><strong>Edge processing:</strong> Keeping biometric data on-device for privacy</li><li><strong>Zero-knowledge proofs:</strong> Verifying identity without exposing data</li></ul><h3>Privacy by Design</h3><p>Unlike traditional biometric systems that store templates in centralized databases, B-FY's approach ensures that sensitive biometric information never leaves the user's device.</p><blockquote>\"We believe that strong security and user privacy are not mutually exclusive. Our technology proves that you can have both.\" - B-FY CEO</blockquote><h3>Real-World Applications</h3><p>B-FY's human authentication technology is already transforming industries:</p><ul><li><strong>Healthcare:</strong> Secure patient identification and medical record access</li><li><strong>Banking:</strong> Fraud prevention and secure transactions</li><li><strong>Travel:</strong> Streamlined airport security and border control</li><li><strong>Corporate:</strong> Employee access control and time tracking</li></ul><h3>The Future is Now</h3><p>As we move towards a passwordless future, human authentication will become the cornerstone of digital security. B-FY is leading this transformation, providing the tools and technologies needed to create a safer, more secure digital world.</p>"
  },
  "bfy-consolidates-presence-worldwide": {
    "title": "B-FY consolidates its presence worldwide",
    "description": "B-FY's solution has already proven its effectiveness in various sectors, including healthcare, banking logistics, and events, among others, in countries like Spain and Mexico. By launching its solution in the US market, B-FY consolidates its worldwide presence and reinforces its commitment to the battle against cybercrime and identity fraud.",
    "category": "regulation",
    "image": "b-fy-consolidates-presence-worldwide.webp",
    "author": "B-FY Global Team",
    "date": "2024-12-20",
    "content": "<h2>Global Expansion Milestone</h2><p>B-FY's journey from a Spanish startup to a global cybersecurity leader represents more than just business growth—it's a testament to the universal need for secure, reliable identity verification solutions.</p><h3>Proven Success Across Industries</h3><p>Our technology has demonstrated remarkable effectiveness across diverse sectors:</p><h4>Healthcare Sector</h4><ul><li>Secure patient identification in hospitals</li><li>HIPAA-compliant access to medical records</li><li>Telemedicine authentication</li></ul><h4>Banking and Financial Services</h4><ul><li>Customer onboarding and KYC processes</li><li>Transaction authentication</li><li>Fraud prevention systems</li></ul><h4>Logistics and Supply Chain</h4><ul><li>Secure facility access</li><li>Driver verification systems</li><li>Cargo tracking and authentication</li></ul><h3>International Presence</h3><p>B-FY's global footprint continues to expand:</p><blockquote>\"Our success in Spain and Mexico has shown that secure authentication is a universal need. The US market represents our next major milestone.\" - B-FY International Director</blockquote><h3>US Market Entry</h3><p>The American market presents both opportunities and challenges:</p><ul><li><strong>Regulatory landscape:</strong> Navigating complex compliance requirements</li><li><strong>Market size:</strong> Massive potential for growth and impact</li><li><strong>Innovation ecosystem:</strong> Collaboration with leading tech companies</li><li><strong>Customer expectations:</strong> High standards for security and usability</li></ul><h3>Commitment to Cybersecurity</h3><p>Our worldwide expansion reinforces our commitment to fighting cybercrime and identity fraud on a global scale. With each new market we enter, we bring cutting-edge security solutions that protect millions of users and thousands of businesses.</p>"
  }
}]

[#-- Get current blog data based on route --]
[#if blogName?hasContent && blogPosts[blogName]?hasContent]
  [#assign currentBlog = blogPosts[blogName]]
[#else]
  [#-- Default to first blog if route not found --]
  [#assign currentBlog = blogPosts["cybersecurity-trends-2025"]]
[/#if]

[#-- Author and date processing --]
[#assign authorName = currentBlog.author!"B-FY Team"]
[#assign authorBio = "Especialista en cyberseguridad y tecnología biométrica de B-FY"]
[#assign blogDate = currentBlog.date?date('yyyy-MM-dd')!.now]

[#-- RENDERING --]
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>${currentBlog.title!content.title!"Blog Post | B-FY"}</title>
  <meta name="description" content="${currentBlog.description!content.description!""}" />
  <meta name="keywords" content="${currentBlog.category!content.keywords!""}" />
  
  <meta property="og:image" content="${ctx.contextPath}/.resources/b-fy/webresources/images/${currentBlog.image!""}" />
  <meta property="og:title" content="${currentBlog.title!content.title!""}" />
  <meta property="og:description" content="${currentBlog.description!content.description!""}" />
  
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
  
  <style>
    /* Blog Post Styles - Modern Design */
    .blog-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 2rem 1rem;
    }
    
    .blog-hero {
      width: 100%;
      height: 400px;
      object-fit: cover;
      border-radius: 16px;
      margin-bottom: 2rem;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    
    .blog-content {
      display: grid;
      grid-template-columns: 2fr 1fr;
      gap: 4rem;
    }
    
    .blog-title {
      font-size: 2.75rem;
      font-weight: 800;
      color: #ea580c;
      margin-bottom: 1rem;
      line-height: 1.1;
      text-transform: uppercase;
      letter-spacing: -0.02em;
    }
    
    .blog-lead {
      font-size: 1.25rem;
      font-weight: 600;
      color: #64748b;
      margin-bottom: 2rem;
      line-height: 1.5;
    }
    
    .blog-meta {
      display: flex;
      align-items: center;
      gap: 2rem;
      margin-bottom: 3rem;
      padding-bottom: 2rem;
      border-bottom: 2px solid #f1f5f9;
      font-size: 0.875rem;
      color: #6b7280;
    }
    
    .blog-meta-item {
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .blog-category {
      background: linear-gradient(135deg, #ea580c, #f97316);
      color: white;
      padding: 0.5rem 1rem;
      border-radius: 20px;
      font-weight: 700;
      text-transform: uppercase;
      font-size: 0.75rem;
      letter-spacing: 0.05em;
    }
    
    .blog-body {
      font-size: 1.125rem;
      line-height: 1.8;
      color: #374151;
    }
    
    /* Blog Block Styles */
    .blog-post__text {
      margin-bottom: 2rem;
    }
    
    .blog-post__text h2 {
      font-size: 1.875rem;
      font-weight: 700;
      margin: 2.5rem 0 1.5rem 0;
      color: #1f2937;
    }
    
    .blog-post__text h3 {
      font-size: 1.5rem;
      font-weight: 600;
      margin: 2rem 0 1rem 0;
      color: #374151;
    }
    
    .blog-post__text p {
      margin-bottom: 1.5rem;
    }
    
    .blog-post__text ul, .blog-post__text ol {
      margin-bottom: 1.5rem;
      padding-left: 2rem;
    }
    
    .blog-post__text li {
      margin-bottom: 0.5rem;
    }
    
    .blog-post__text strong {
      color: #ea580c;
      font-weight: 700;
    }
    
    .blog-post__text a {
      color: #ea580c;
      text-decoration: underline;
      text-underline-offset: 2px;
    }
    
    .blog-post__text a:hover {
      color: #c2410c;
    }
    
    .blog-post__text blockquote {
      border-left: 4px solid #ea580c;
      padding: 1rem 1.5rem;
      margin: 2rem 0;
      background: #fef7f0;
      font-style: italic;
      color: #7c2d12;
    }
    
    /* Blog Post Image Block */
    .blog-post__image {
      margin: 2rem 0;
      text-align: center;
    }
    
    .blog-post__image img {
      max-width: 100%;
      height: auto;
      border-radius: 12px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.1);
    }
    
    .blog-post__image .image-caption {
      font-size: 0.875rem;
      color: #6b7280;
      margin-top: 0.75rem;
      font-style: italic;
    }
    
    /* Blog Post YouTube Block */
    .blog-post__youtube {
      margin: 2rem 0;
    }
    
    .blog-post__youtube .youtube-container {
      position: relative;
      width: 100%;
      height: 0;
      padding-bottom: 56.25%; /* 16:9 aspect ratio */
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 8px 24px rgba(0,0,0,0.1);
    }
    
    .blog-post__youtube iframe {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      border: none;
    }
    
    .blog-post__youtube .video-title {
      font-size: 1.125rem;
      font-weight: 600;
      color: #1f2937;
      margin-bottom: 1rem;
    }
    
    .blog-post__youtube .video-description {
      font-size: 0.875rem;
      color: #6b7280;
      margin-top: 0.75rem;
      line-height: 1.5;
    }
    
    /* Blog Post CTA Block */
    .blog-post__cta {
      background: linear-gradient(135deg, #ea580c, #f97316);
      color: white;
      padding: 2rem;
      border-radius: 16px;
      margin: 2rem 0;
      text-align: center;
      box-shadow: 0 8px 24px rgba(234, 88, 12, 0.2);
    }
    
    .blog-post__cta h3 {
      font-size: 1.5rem;
      font-weight: 700;
      margin-bottom: 1rem;
      color: white !important;
    }
    
    .blog-post__cta p {
      font-size: 1.125rem;
      margin-bottom: 1.5rem;
      opacity: 0.9;
    }
    
    .blog-post__cta .cta-button {
      background: white;
      color: #ea580c;
      padding: 0.75rem 2rem;
      border-radius: 8px;
      text-decoration: none;
      font-weight: 700;
      display: inline-block;
      transition: all 0.2s ease;
    }
    
    .blog-post__cta .cta-button:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }
    
    /* Blog Post Social Block */
    .blog-post__social {
      background: #f8fafc;
      border: 1px solid #e2e8f0;
      border-radius: 12px;
      padding: 1.5rem;
      margin: 2rem 0;
    }
    
    .blog-post__social h4 {
      font-size: 1.125rem;
      font-weight: 700;
      color: #1f2937;
      margin-bottom: 1rem;
    }
    
    .blog-post__social .social-links {
      display: flex;
      gap: 1rem;
      align-items: center;
    }
    
    .blog-post__social .social-link {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.5rem 1rem;
      background: white;
      border: 1px solid #d1d5db;
      border-radius: 8px;
      text-decoration: none;
      color: #374151;
      font-weight: 500;
      transition: all 0.2s ease;
    }
    
    .blog-post__social .social-link:hover {
      border-color: #ea580c;
      color: #ea580c;
      background: #fef7f0;
    }
      margin: 2.5rem 0 1.5rem 0;
      color: #1f2937;
    }
    
    .blog-post__text h3 {
      font-size: 1.5rem;
      font-weight: 600;
      margin: 2rem 0 1rem 0;
      color: #374151;
    }
    
    .blog-post__text p {
      margin-bottom: 1.5rem;
    }
    
    .blog-post__text ul, .blog-post__text ol {
      margin-bottom: 1.5rem;
      padding-left: 2rem;
    }
    
    .blog-post__text li {
      margin-bottom: 0.5rem;
    }
    
    .blog-post__text strong {
      color: #ea580c;
      font-weight: 700;
    }
    
    .blog-post__text a {
      color: #ea580c;
      text-decoration: underline;
      text-underline-offset: 2px;
    }
    
    .blog-post__text a:hover {
      color: #c2410c;
    }
    
    .blog-post__text blockquote {
      border-left: 4px solid #ea580c;
      padding: 1rem 1.5rem;
      margin: 2rem 0;
      background: #fef7f0;
      font-style: italic;
      color: #7c2d12;
    }
    
    .blog-sidebar {
      background: linear-gradient(135deg, #f8fafc, #f1f5f9);
      border-radius: 16px;
      padding: 2rem;
      height: fit-content;
      position: sticky;
      top: 2rem;
      border: 1px solid #e2e8f0;
    }
    
    .sidebar-title {
      font-size: 1.25rem;
      font-weight: 800;
      color: #ea580c;
      margin-bottom: 1.5rem;
      text-transform: uppercase;
      letter-spacing: 0.05em;
    }
    
    .back-link {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      color: #ea580c;
      text-decoration: none;
      font-weight: 600;
      margin-bottom: 2rem;
      transition: all 0.2s ease;
      padding: 0.5rem 0;
    }
    
    .back-link:hover {
      color: #c2410c;
      transform: translateX(-2px);
    }
    
    .author-card {
      display: flex;
      align-items: center;
      border: 1px solid #e5e7eb;
      border-radius: 12px;
      padding: 2rem;
      margin-top: 3rem;
      background: linear-gradient(135deg, #ffffff, #f9fafb);
      box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    }
    
    .author-image {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 1.5rem;
      border: 3px solid #ea580c;
    }
    
    .author-info h4 {
      font-size: 1.125rem;
      font-weight: 700;
      color: #1f2937;
      margin-bottom: 0.5rem;
    }
    
    .author-info p {
      font-size: 0.875rem;
      color: #6b7280;
      line-height: 1.6;
    }
    
    .related-post {
      color: #374151;
      text-decoration: none;
      padding: 1rem;
      border: 1px solid #e5e7eb;
      border-radius: 8px;
      transition: all 0.2s ease;
      display: block;
      margin-bottom: 1rem;
    }
    
    .related-post:hover {
      border-color: #ea580c;
      background: #fef7f0;
      transform: translateY(-1px);
      box-shadow: 0 4px 8px rgba(234, 88, 12, 0.1);
    }
    
    .related-post-title {
      font-weight: 600;
      font-size: 0.875rem;
      margin-bottom: 0.25rem;
      color: #1f2937;
    }
    
    .related-post-excerpt {
      font-size: 0.75rem;
      color: #6b7280;
      line-height: 1.4;
    }
    
    /* Responsive Design */
    @media (max-width: 1024px) {
      .blog-content {
        grid-template-columns: 1fr;
        gap: 2rem;
      }
      
      .blog-title {
        font-size: 2.25rem;
      }
      
      .blog-sidebar {
        position: static;
      }
    }
    
    @media (max-width: 768px) {
      .blog-container {
        padding: 1rem 0.5rem;
      }
      
      .blog-title {
        font-size: 1.875rem;
      }
      
      .blog-hero {
        height: 250px;
        border-radius: 12px;
      }
      
      .blog-meta {
        flex-direction: column;
        align-items: flex-start;
        gap: 1rem;
      }
      
      .author-card {
        flex-direction: column;
        text-align: center;
      }
      
      .author-image {
        margin-right: 0;
        margin-bottom: 1rem;
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
      [#if currentBlog.image?hasContent]
        <img src="${ctx.contextPath}/.resources/b-fy/webresources/images/${currentBlog.image}" alt="${currentBlog.title!}" class="blog-hero" />
      [/#if]
      
      <div class="blog-content">
        <article class="blog-main">
          <!-- Title -->
          <h1 class="blog-title">${currentBlog.title!content.title!"Untitled Blog Post"}</h1>
          
          <!-- Lead/Description -->
          [#if currentBlog.description?hasContent]
            <p class="blog-lead">${currentBlog.description}</p>
          [/#if]
          
          <!-- Meta -->
          <div class="blog-meta">
            <div class="blog-meta-item">
              <i class="fas fa-user"></i>
              <span>${authorName!"B-FY Team"}</span>
            </div>
            [#if blogDate?hasContent]
            <div class="blog-meta-item">
              <i class="fas fa-calendar"></i>
              <span>${blogDate?string('dd/MM/yyyy')}</span>
            </div>
            [/#if]
            [#if currentBlog.category?hasContent]
              <div class="blog-category">${currentBlog.category?cap_first}</div>
            [/#if]
          </div>
          
          <!-- Content -->
          <div class="blog-body">
            [#if currentBlog.content?hasContent]
              <div class="blog-post__text">
                ${currentBlog.content}
              </div>
            [#else]
              <div class="blog-post__text">
                <p>Contenido no disponible para esta entrada del blog.</p>
              </div>
            [/#if]
          </div>
          
          <!-- Author Card -->
          <div class="author-card">
            <img src="/webresources/assets/team/default-avatar.jpg" alt="${authorName}" class="author-image" />
            <div class="author-info">
              <h4>${authorName}</h4>
              <p>${authorBio}</p>
            </div>
          </div>
        </article>
        
        <!-- Sidebar -->
        <aside class="blog-sidebar">
          <h2 class="sidebar-title">Posts Relacionados</h2>
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            [#-- Generate related posts from hardcoded data --]
            [#assign relatedCount = 0]
            [#list blogPosts?keys as postKey]
              [#if relatedCount < 3 && postKey != blogName]
                [#assign relatedPost = blogPosts[postKey]]
                <a href="${ctx.contextPath}/blog/${postKey}" class="related-post">
                  <div class="related-post-title">${relatedPost.title!"Post sin título"}</div>
                  <div class="related-post-excerpt">${relatedPost.description?truncate(80)!"Descripción no disponible"}</div>
                </a>
                [#assign relatedCount = relatedCount + 1]
              [/#if]
            [/#list]
            [#if relatedCount == 0]
              <p style="color: #6b7280; font-size: 0.875rem;">No hay posts relacionados disponibles.</p>
            [/#if]
          </div>
        </aside>
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
