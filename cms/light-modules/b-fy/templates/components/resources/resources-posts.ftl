<#-- Resources Posts - UI only refresh to match the screenshot -->
<#import "/b-fy/templates/components/util/icons.ftl" as icons>

<#macro resourcesPosts>
<#-- Complete blog posts data matching all available content -->
<#assign blogPosts = [
  {"title":"Cybersecurity trends: an evolving landscape","description":"Digital acceleration and the proliferation of cyber threats have redefined business priorities in security. In 2025, cybersecurity is set to become a critical element not only for protecting data but also for ensuring customer trust and operational continuity.","category":"cybersecurity","slug":"cybersecurity-trends-evolving-landscape","image":"cybersecurity-trends-evolving-landscape.webp","name":"cybersecurity-trends-2025"},
  {"title":"Identity verification, a growing challenge","description":"In an increasingly complex digital environment, human identity verification and cybersecurity are essential to protect users and businesses from emerging threats. Looking towards 2025, technologies such as biometrics, artificial intelligence, and quantum computing will redefine online security.","category":"biometrics","slug":"identity-verification-growing-challenge","image":"identity-verification-growing-challenge.webp","name":"identity-verification-challenge"},
  {"title":"Identity fraud: a growing threat","description":"As identity fraud becomes increasingly sophisticated, organizations and individuals must be more vigilant than ever in safeguarding their data. With a rise in AI-driven attacks and deepfakes, financial losses and digital security risks continue to escalate.","category":"cybersecurity","slug":"identity-fraud-growing-threat","image":"identity-fraud-growing-threat.webp","name":"identity-fraud-growing-threat"},
  {"title":"Human authentication: a revolutionary approach to data protection","description":"Human authentication, driven by biometric technologies, is transforming digital security by offering a safer and more efficient solution to the risks posed by traditional passwords. In this context, B-FY stands out as a leader, developing an innovative technology that protects data without compromising user privacy.","category":"biometrics","slug":"human-authentication-revolutionary-approach-data-protection","image":"human-authentication-revolutionary-approach-data-protection.webp","name":"human-authentication-revolutionary"},
  {"title":"B-FY consolidates its presence worldwide","description":"B-FY's solution has already proven its effectiveness in various sectors, including healthcare, banking logistics, and events, among others, in countries like Spain and Mexico. By launching its solution in the US market, B-FY consolidates its worldwide presence and reinforces its commitment to the battle against cybercrime and identity fraud.","category":"regulation","slug":"b-fy-consolidates-presence-worldwide","image":"b-fy-consolidates-presence-worldwide.webp","name":"bfy-consolidates-presence-worldwide"},
  {"title":"How B-FY's human authentication transforms the traveler experience","description":"The tourism industry is at the forefront of technological innovation, transforming both traveler experiences and resource management. Today, advancements such as artificial intelligence (AI), augmented reality, and biometric human authentication solutions like those offered by B-FY are revolutionizing the interaction between travelers and service providers.","category":"biometrics","slug":"b-fys-human-authentication-transforms-traveler-experience","image":"b-fys-human-authentication-transforms-traveler-experience.webp","name":"bfy-transforms-traveler-experience"},
  {"title":"Cybersecurity moves toward a passwordless future with B-FY's approach","description":"In an increasingly threatened digital world, companies are seeking alternatives to eliminate one of the most vulnerable elements of their systems: passwords. Through a strategy centered on biometric authentication and a passwordless approach, B-FY aims to eliminate risks associated with stolen or compromised credentials.","category":"cybersecurity","slug":"cybersecurity-moves-toward-passwordless-future-b-fy-approach","image":"cybersecurity-moves-toward-passwordless-future-b-fys-approach.webp","name":"passwordless-future-bfy-approach"},
  {"title":"B-FY enters the U.S. market","description":"After its successful global launch in Amsterdam, B-FY will present its innovative Authentication as a Service (AaaS) tool at Identity Week in Washington DC. With this move, B-FY consolidates its international presence and reinforces its commitment to combating cybercrime and identity fraud.","category":"regulation","slug":"b-fy-enters-us-market","image":"b-fy-enters-us-market.webp","name":"bfy-enters-us-market"},
  {"title":"B-FY Introduces Revolutionary Solution to Terminate Online ID Fraud and Cybercrime","description":"B-FY's technology provides a foolproof method to identify real operators behind online transactions, ensuring 100% secure interactions. It is a solution designed for easy integration with existing cybersecurity and 2FA systems, offering a potential revenue of $145 billion annually by addressing cybercrime losses.","category":"cybersecurity","slug":"b-fy-introduces-revolutionary-solution-terminate-online-id-fraud-cybercrime","image":"b-fy-introduces-revolutionary-solution-terminate-online-id-fraud-cybercrime.webp","name":"bfy-revolutionary-solution-terminate-fraud"},
  {"title":"B-FY's global launch at Identity Week Amsterdam","description":"B-FY participates in Identity Week Amsterdam, the premier event on identity and trust, presenting its revolutionary biometric authentication solution to the global market. This event marks a milestone in B-FY's international expansion strategy.","category":"regulation","slug":"b-fys-global-launch-identity-week-amsterdam","image":"b-fys-global-launch-identity-week-amsterdam.webp","name":"bfy-global-launch-amsterdam"},
  {"title":"B-FY participates in Identity Week Amsterdam: premier event on identity and trust","description":"Identity Week Amsterdam showcases the latest innovations in digital identity and trust. B-FY's participation highlights the company's commitment to advancing biometric authentication technologies on a global scale.","category":"regulation","slug":"b-fy-participate-identity-week-amsterdam-premier-event-identity-trust","image":"b-fy-participate-identity-week-amsterdam-premier-event-identity-trust.webp","name":"bfy-participate-identity-week"},
  {"title":"B-FY's passwordless solution to stop online identity fraud","description":"Discover how B-FY's innovative passwordless authentication solution provides a robust defense against online identity fraud, offering businesses and users a secure alternative to traditional password-based systems.","category":"cybersecurity","slug":"b-fy-passwordless-solution-stop-online-identity-fraud","image":"b-fy-passwordless-solution-stop-online-identity-fraud.webp","name":"bfy-passwordless-solution"},
  {"title":"B-FY at Pulse: key event for cybersecurity trends","description":"B-FY's presence at Pulse demonstrates the company's leadership in cybersecurity innovation. This key industry event brings together experts to discuss the latest trends and solutions in digital security.","category":"cybersecurity","slug":"b-fy-pulse-key-event-cybersecurity-trends","image":"b-fy-pulse-key-event-cybersecurity-trends.webp","name":"bfy-pulse-cybersecurity"},
  {"title":"B-FY and Serban Group join forces to drive biometric identification","description":"The strategic partnership between B-FY and Serban Group aims to accelerate the adoption of advanced biometric identification solutions across multiple industries and geographic markets.","category":"biometrics","slug":"b-fy-serban-group-join-forces-drive-biometric-identification","image":"b-fy-serban-group-join-forces-drive-biometric-identification.webp","name":"bfy-serban-partnership"},
  {"title":"B-FY sponsors 5th edition Cybersecurity Data Innovation Summit 2024","description":"As a proud sponsor of the Cybersecurity Data Innovation Summit 2024, B-FY demonstrates its commitment to advancing cybersecurity innovation and supporting industry collaboration.","category":"cybersecurity","slug":"b-fy-sponsor-5th-edition-cybersecurity-data-innovation-summit-2024","image":"b-fy-sponsor-5th-edition-cybersecurity-data-innovation-summit-2024.webp","name":"bfy-sponsor-summit-2024"},
  {"title":"B-FY stands at V Cybersecurity Data Innovation Summit 2024 with leading solution for decentralized biometric identification","description":"At the V Cybersecurity Data Innovation Summit 2024, B-FY showcases its cutting-edge decentralized biometric identification solution, setting new standards for security and privacy.","category":"biometrics","slug":"b-fy-stands-v-cybersecurity-data-innovation-summit-2024-leading-solution-decentralized-biometric-identification","image":"b-fy-stands-v-cybersecurity-data-innovation-summit-2024-leading-solution-decentralized-biometric-identification.webp","name":"bfy-summit-2024-solution"},
  {"title":"B-FY transforming experience and security in higher education with biometric authentication","description":"Explore how B-FY's biometric authentication solutions are revolutionizing security and user experience in higher education institutions, providing seamless and secure access management.","category":"biometrics","slug":"b-fy-transforming-experience-security-higher-education-biometric-authentication","image":"b-fy-transforming-experience-security-higher-education-biometric-authentication.webp","name":"bfy-higher-education"},
  {"title":"B-FY's biometric authentication revolutionizing security in fuel industry in Mexico","description":"Discover how B-FY's advanced biometric authentication technology is transforming security protocols in Mexico's fuel industry, providing enhanced protection and operational efficiency.","category":"biometrics","slug":"b-fys-biometric-authentication-revolutionizing-security-fuel-industry-mexico","image":"b-fys-biometric-authentication-revolutionizing-security-fuel-industry-mexico.webp","name":"bfy-fuel-industry-mexico"},
  {"title":"B-FY's biometric solution: complying with EUDI regulation for safer digital identity in Europe","description":"Learn how B-FY's biometric solutions ensure compliance with the European Union Digital Identity (EUDI) regulation, paving the way for safer and more secure digital identities across Europe.","category":"regulation","slug":"b-fys-biometric-solution-complying-eudi-regulation-safer-digital-identity-europe","image":"b-fys-biometric-solution-complying-eudi-regulation-safer-digital-identity-europe.webp","name":"bfy-eudi-compliance"},
  {"title":"Better, secure and agile banking experiences with B-FY's decentralized biometric solution","description":"Explore how B-FY's decentralized biometric solution is transforming banking experiences by providing enhanced security, improved user experience, and greater operational agility.","category":"biometrics","slug":"better-secure-agile-banking-experiences-b-fy-decentralized-biometric-solution","image":"better-secure-agile-banking-experiences-b-fy-decentralized-biometric-solution.webp","name":"bfy-banking-experiences"},
  {"title":"Biometric edge in the educational industry","description":"Discover the competitive advantages that biometric technology brings to the educational sector, from enhanced security to streamlined administrative processes and improved student experiences.","category":"biometrics","slug":"biometric-edge-educational-industry","image":"biometric-edge-educational-industry.webp","name":"biometric-edge-education"},
  {"title":"Biometric identification can revolutionize UX while complying with norms","description":"Explore how biometric identification technology can dramatically improve user experience while maintaining full compliance with regulatory standards and privacy requirements.","category":"biometrics","slug":"biometric-identification-can-revolutionize-ux-complying-norm","image":"biometric-identification-can-revolutionize-ux-complying-norm.webp","name":"biometric-ux-compliance"},
  {"title":"Biometric leverage in the financial industry","description":"Understand how biometric technologies are creating new opportunities and competitive advantages in the financial services sector, from fraud prevention to enhanced customer authentication.","category":"biometrics","slug":"biometric-leverage-financial-industry","image":"biometric-leverage-financial-industry.webp","name":"biometric-financial-leverage"},
  {"title":"Biometric technology: effective solution for IAM","description":"Learn how biometric technology serves as a highly effective solution for Identity and Access Management (IAM), providing robust security while simplifying user authentication processes.","category":"biometrics","slug":"biometric-technology-effective-solution-iam","image":"biometric-technology-effective-solution-iam.webp","name":"biometric-iam-solution"},
  {"title":"Biometrics can help solve 2FA flaws","description":"Discover how biometric authentication addresses the inherent weaknesses of traditional two-factor authentication (2FA) systems, providing a more secure and user-friendly alternative.","category":"biometrics","slug":"biometrics-can-help-solving-2fa-flaws","image":"biometrics-can-help-solving-2fa-flaws.webp","name":"biometrics-2fa-flaws"},
  {"title":"Biometrics helping healthcare industry secure patients' data","description":"Explore how biometric technologies are revolutionizing healthcare data security, ensuring patient privacy while enabling efficient and secure access to medical information.","category":"biometrics","slug":"biometrics-helping-healthcare-industry-secure-patients-data","image":"biometrics-helping-healthcare-industry-secure-patients-data.webp","name":"biometrics-healthcare-security"},
  {"title":"Enhancing cybersecurity in healthcare with biometrics","description":"Discover how biometric authentication is strengthening cybersecurity measures in healthcare settings, protecting sensitive patient data and medical systems from cyber threats.","category":"biometrics","slug":"enhancing-cybersecurity-healthcare-biometrics","image":"enhancing-cybersecurity-healthcare-biometrics.webp","name":"healthcare-cybersecurity-biometrics"},
  {"title":"Five IAM trends for 2023","description":"Stay ahead of the curve with the top five Identity and Access Management trends that are shaping the cybersecurity landscape in 2023 and beyond.","category":"cybersecurity","slug":"five-iam-trends-2023","image":"five-iam-trends-2023.webp","name":"iam-trends-2023"},
  {"title":"Five myths about biometric authentication","description":"Debunk common misconceptions about biometric authentication technology and learn the truth about its security, privacy, and practical implementation benefits.","category":"biometrics","slug":"five-myths-abouth-biometric-authentication","image":"five-myths-abouth-biometric-authentication.webp","name":"biometric-myths"},
  {"title":"Five reasons biometrics is finally the next big thing","description":"Explore the compelling reasons why biometric technology has reached its tipping point and is poised to become the dominant authentication method across industries.","category":"biometrics","slug":"five-reasons-biometrics-finally-next-big-thing","image":"five-reasons-biometrics-finally-next-big-thing.webp","name":"biometrics-next-big-thing"},
  {"title":"Healthcare industry investing in biometrics","description":"Learn about the growing investment trends in biometric technologies within the healthcare sector and their impact on patient care and data security.","category":"biometrics","slug":"healthcare-industry-investing-biometrics","image":"healthcare-industry-investing-biometrics.webp","name":"healthcare-biometric-investment"},
  {"title":"Hidden costs of identity fraud to avoid","description":"Understand the often-overlooked financial and operational costs of identity fraud and learn strategies to protect your organization from these hidden expenses.","category":"cybersecurity","slug":"hidden-costs-identity-fraud-avoid","image":"hidden-costs-identity-fraud-avoid.webp","name":"hidden-costs-fraud"},
  {"title":"Higher education challenged by Gen Z and Alphas","description":"Explore how educational institutions are adapting their security and authentication systems to meet the unique technological expectations of Gen Z and Alpha students.","category":"biometrics","slug":"higher-education-challenged-zs-alphas","image":"higher-education-challenged-zs-alphas.webp","name":"higher-education-gen-z"},
  {"title":"Multi-factor authentication with biometrics","description":"Discover how combining biometric technology with multi-factor authentication creates robust security solutions that balance protection with user convenience.","category":"biometrics","slug":"multi-factor-authentication-biometrics","image":"multi-factor-authentication-biometrics.webp","name":"mfa-biometrics"},
  {"title":"Passwords: key to cybercriminals' access to identity","description":"Learn how traditional passwords remain the weakest link in cybersecurity and why organizations must move beyond password-based authentication systems.","category":"cybersecurity","slug":"passwords-key-cybercriminals-access-identity","image":"passwords-key-cybercriminals-access-identity.webp","name":"passwords-cybercriminals"},
  {"title":"Protecting your company from cyber threats","description":"Essential strategies and best practices for safeguarding your organization against the evolving landscape of cyber threats and security vulnerabilities.","category":"cybersecurity","slug":"protect-company","image":"protect-company.webp","name":"protect-company-threats"},
  {"title":"Protecting digital identity in the online world","description":"Navigate the complexities of digital identity protection in an increasingly connected world with practical solutions and security frameworks.","category":"cybersecurity","slug":"protect-digital-identity-online-world","image":"protect-digital-identity-online-world.webp","name":"protect-digital-identity"},
  {"title":"Securing privacy for users","description":"Explore innovative approaches to user privacy protection that balance security requirements with user rights and regulatory compliance standards.","category":"regulation","slug":"securing-privacy-users","image":"securing-privacy-users.webp","name":"securing-user-privacy"},
  {"title":"Subscription-based platforms go passwordless","description":"Understand how subscription services are adopting passwordless authentication to improve user experience while maintaining robust security standards.","category":"cybersecurity","slug":"subscription-based-platforms-go-passwordless","image":"subscription-based-platforms-go-passwordless.webp","name":"subscription-passwordless"},
  {"title":"Ten reasons to secure your business with biometrics","description":"Discover the top ten compelling reasons why biometric security solutions are essential for modern business protection and operational efficiency.","category":"biometrics","slug":"ten-reasons-secure-business-biometrics","image":"ten-reasons-secure-business-biometrics.webp","name":"ten-reasons-biometrics"},
  {"title":"Three ways B-FY's biometric authentication adds value to healthcare sector","description":"Explore three specific ways that B-FY's biometric authentication technology creates measurable value for healthcare organizations and patient outcomes.","category":"biometrics","slug":"three-ways-b-fys-biometric-authentication-adds-value-healthcare-sector","image":"three-ways-b-fys-biometric-authentication-adds-value-healthcare-sector.webp","name":"bfy-healthcare-value"},
  {"title":"Use biometric security for events","description":"Learn how biometric security solutions enhance event management, from access control to attendee verification and overall security management.","category":"biometrics","slug":"use-biometric-security-event","image":"use-biometric-security-event.webp","name":"biometric-event-security"},
  {"title":"Users prefer biometric authentication methods","description":"Research insights into user preferences for biometric authentication, including adoption rates, satisfaction metrics, and usability comparisons.","category":"biometrics","slug":"users-prefer-biometric-authentication-methods","image":"users-prefer-biometric-authentication-methods.webp","name":"users-prefer-biometrics"},
  {"title":"7 questions to avoid legal trouble involving biometric data","description":"Navigate the legal complexities of biometric data handling with these essential questions that every organization must address to ensure compliance and avoid legal issues.","category":"regulation","slug":"7-questions-avoid-legal-trouble-involving-biometric-data","image":"7-questions-avoid-legal-trouble-involving-biometric-data.webp","name":"biometric-legal-questions"},
  {"title":"B-FY adding value to online banking with 24/7 biometric authentication","description":"Discover how B-FY's round-the-clock biometric authentication service is revolutionizing online banking by providing enhanced security and improved customer experience.","category":"biometrics","slug":"b-fy-adding-value-online-banking-247-biometric-authentication","image":"b-fy-adding-value-online-banking-247-biometric-authentication.webp","name":"bfy-online-banking"},
  {"title":"B-FY's biometric solution aligned with new provisions from AEPD","description":"Learn how B-FY's biometric authentication solution meets the latest requirements and provisions set forth by the Spanish Data Protection Agency (AEPD).","category":"regulation","slug":"b-fy-biometric-solution-aligned-new-provisions-aepd","image":"b-fy-biometric-solution-aligned-new-provisions-aepd.webp","name":"bfy-aepd-compliance"},
  {"title":"B-FY brought together leaders in Mexico event on innovation challenges in credential usurpation","description":"Explore how B-FY facilitated a groundbreaking event in Mexico, bringing together industry leaders to address innovation challenges in preventing credential theft and usurpation.","category":"regulation","slug":"b-fy-brought-together-leaders-mexico-event-innovation-challenges-credential-usurpation","image":"b-fy-brought-together-leaders-mexico-event-innovation-challenges-credential-usurpation.webp","name":"bfy-mexico-leaders-event"},
  {"title":"B-FY's innovative secure alternative to meet AEPD demands","description":"Discover B-FY's innovative biometric security solution designed specifically to meet the stringent demands and requirements of the Spanish Data Protection Agency.","category":"regulation","slug":"b-fy-innovative-secure-alternative-meet-aepd-demands","image":"b-fy-innovative-secure-alternative-meet-aepd-demands.webp","name":"bfy-aepd-secure-alternative"},
  {"title":"Embracing new identification technologies","description":"Explore the transformative potential of emerging identification technologies and how organizations can successfully adopt and integrate these innovations into their security frameworks.","category":"biometrics","slug":"embracing-new-identification","image":"embracing-new-identification.webp","name":"embracing-new-identification"},
  {"title":"Optimizing hospital processes with B-FY's decentralized biometric solution","description":"Learn how B-FY's decentralized biometric technology is streamlining hospital operations, improving patient care efficiency, and enhancing overall healthcare delivery.","category":"biometrics","slug":"optimizing-hospital-processes-b-fys-decentralized-biometric-solution","image":"optimizing-hospital-processes-b-fys-decentralized-biometric-solution.webp","name":"bfy-hospital-optimization"},
  {"title":"Simplified online site access to hospital services with B-FY's decentralized biometric solution","description":"Discover how B-FY's biometric solution simplifies patient access to online hospital services while maintaining the highest standards of security and privacy protection.","category":"biometrics","slug":"simplified-online-site-access-hospital-services-b-fy-decentralized-biometric-solution","image":"simplified-online-site-access-hospital-services-b-fy-decentralized-biometric-solution.webp","name":"bfy-hospital-access"}
] />

<#assign categories = ["all","regulation","biometrics","cybersecurity"] />
<#assign categoryLabels = ["All","Regulation","Biometrics","Cybersecurity"] />

<section class="res-posts" aria-labelledby="res-posts-title">
  <div class="res-posts__head">
    <h2 id="res-posts-title" class="res-posts__title">Other posts</h2>

    <nav class="res-posts__tabs" aria-label="Post categories">
      <#list categories as category>
        <#assign isFirst = category?index == 0 />
        <button
          class="res-posts__tab ${isFirst?then('is-active','')}"
          data-category="${category}"
          aria-current="${isFirst?then('true','false')}"
        >
          ${categoryLabels[category?index]?upper_case}
        </button>
      </#list>
    </nav>
  </div>

  <div class="res-posts__grid" id="posts-grid">
    <#list blogPosts as post>
      <article class="res-posts__card post-item" data-category="${post.category}">
        <a href="${ctx.contextPath}/blog/${post.name}" class="res-posts__media">
          <img
            src="${ctx.contextPath}/.resources/b-fy/webresources/images/${post.image}"
            alt="${post.title}"
            onerror="this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/cybersecurity-trends-evolving-landscape.webp'"
            loading="lazy"
          />
        </a>

        <h3 class="res-posts__card-title">${post.title?upper_case}</h3>
        <p class="res-posts__desc">${post.description}</p>

        <a class="res-posts__more" href="${ctx.contextPath}/blog/${post.name}">
          <span>Read more</span>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
            <path d="M8.59 16.59 13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z"/>
          </svg>
        </a>
      </article>
    </#list>
  </div>

  <div class="res-posts__footer">
    <button class="res-posts__cta" id="view-more-btn">View more</button>
  </div>
</section>

<#-- Styles scoped -->
<#if !RES_POSTS_STYLE_INCLUDED??>
  <#global RES_POSTS_STYLE_INCLUDED = true />
  <style>
    .res-posts{padding:clamp(48px,7vw,80px) 20px 40px}
    .res-posts__head{
      max-width:1180px;margin:0 auto 28px;
      display:flex;align-items:center;justify-content:space-between;gap:24px
    }
    .res-posts__title{font-weight:800;font-size:28px;line-height:1;letter-spacing:-.01em;color:#0f172a}
    .res-posts__tabs{display:flex;gap:18px;flex-wrap:wrap}
    .res-posts__tab{
      position:relative;background:transparent;border:0;padding:8px 4px;
      font-size:12px;font-weight:700;letter-spacing:.04em;color:#6b7280;cursor:pointer;
      text-transform:uppercase;transition:color .15s ease
    }
    .res-posts__tab:hover{color:#ea580c}
    .res-posts__tab.is-active{color:#ea580c}
    .res-posts__tab.is-active::after{
      content:"";position:absolute;left:0;right:0;bottom:-8px;height:2px;background:#ea580c;border-radius:2px
    }

    .res-posts__grid{
      max-width:1180px;margin:0 auto;
      display:grid;grid-template-columns:1fr;gap:28px 20px
    }
    @media(min-width:640px){.res-posts__grid{grid-template-columns:repeat(2,1fr)}}
    @media(min-width:1024px){.res-posts__grid{grid-template-columns:repeat(3,1fr)}}

    .res-posts__card{display:flex;flex-direction:column}
    .res-posts__media{display:block;border-radius:12px;overflow:hidden;box-shadow:0 8px 18px rgba(0,0,0,.06)}
    .res-posts__media img{display:block;width:100%;height:100%;object-fit:cover;aspect-ratio:16/9}

    .res-posts__card-title{
      margin:10px 0 8px;color:#ea580c;font-weight:800;letter-spacing:.02em;
      text-transform:uppercase;font-size:13px;line-height:1.2
    }
    .res-posts__desc{
      color:#374151;font-size:14px;line-height:1.45;margin-bottom:10px;
      display:-webkit-box;-webkit-line-clamp:3;-webkit-box-orient:vertical;overflow:hidden
    }
    .res-posts__more{
      display:inline-flex;align-items:center;gap:6px;color:#ea580c;font-size:12px;font-weight:600;
      text-decoration:none;transition:color .15s ease
    }
    .res-posts__more:hover{color:#991b1b}

    .res-posts__footer{max-width:1180px;margin:36px auto 0;display:flex;justify-content:center}
    .res-posts__cta{
      padding:10px 16px;border-radius:10px;background:#ea580c;color:#fff;font-weight:700;
      font-size:16px;letter-spacing:.01em;border:0;cursor:pointer;transition:background .15s ease, box-shadow .15s ease
    }
    .res-posts__cta:hover{background:#c2410c;box-shadow:0 12px 22px rgba(234,88,12,.25)}
  </style>
</#if>

<#-- JS (misma lógica; sólo cambia toggling de clase) -->
<script>
document.addEventListener('DOMContentLoaded', function() {
  const filterButtons = document.querySelectorAll('.res-posts__tab');
  const postItems = document.querySelectorAll('.post-item');
  const viewMoreBtn = document.getElementById('view-more-btn');

  let currentCategory = 'all';
  let visiblePosts = 6;
  const postsPerPage = 6;

  updatePostsDisplay();

  filterButtons.forEach(button => {
    button.addEventListener('click', function() {
      currentCategory = this.dataset.category;
      visiblePosts = postsPerPage;

      filterButtons.forEach(btn => btn.classList.remove('is-active'));
      this.classList.add('is-active');

      updatePostsDisplay();
    });
  });

  viewMoreBtn.addEventListener('click', function() {
    visiblePosts += postsPerPage;
    updatePostsDisplay();
  });

  function updatePostsDisplay() {
    const filtered = Array.from(postItems).filter(i =>
      currentCategory === 'all' || i.dataset.category === currentCategory
    );

    postItems.forEach(i => i.style.display = 'none');
    filtered.slice(0, visiblePosts).forEach(i => i.style.display = 'flex');

    viewMoreBtn.style.display = (visiblePosts >= filtered.length) ? 'none' : 'inline-block';
  }
});
</script>
</#macro>
