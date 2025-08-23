<!DOCTYPE html>
<html lang="en     <#assign fbDetailsTitle = "Our Company" />
    <#assign fbDetailsDesc = "<p>At B-FY we have revolutionized the access protocol to authenticate real people, always putting human beings at the center. For more than 18 years, we have driven a profound transformation in the field of digital and physical identity. Our objective: to change forever the way people authenticate, guaranteeing security, privacy and trust.</p><p>We have developed a new access protocol that achieves the perfect balance between simplicity, speed and security. In less than three seconds we offer you a fluid identification, robust and free of passwords, and prevents any type of digital identity fraud and protects user data privacy. At B-FY we do not identify credentials, certificates or people's devices. Our technology guarantees that each authentication process will be initiated and completed by a human, manually, and independent of passwords or fragile tokens. Thus, the user has total control of their identity. Includes connection to a human.</p><p>We believe that true security is only possible when we know with certainty who is behind each digital credential. For this reason, our solution does not validate data, but human presence. We use the best available technology and the most advanced security protocols to offer the most secure, robust and accessible system for people of all ages and backgrounds. Our technology eliminates online anonymity, blocks identity fraud and protects user privacy from the first click. We are pioneers in biometric authentication without credentials, based on personal devices. Thanks to our own model—secure, scalable and totally aligned with global regulations (such as GDPR)— we help companies and institutions convince their own identity providers. With B-FY, each access is transparent, traceable and truly secure. We are not just innovating in technology, we are redefining trust in digital and physical environments.</p>" /> <#assign fbDetailsTitle = "Our Company" />
    <#assign fbDetailsDesc = "<p>At B-FY we have revolutionized the access protocol to authenticate real people, always putting human beings at the center. For more than 18 years, we have driven a profound transformation in the field of digital and physical identity. Our objective: to change forever the way people authenticate, guaranteeing security, privacy and trust.</p><p>We have developed a new access protocol that achieves the perfect balance between simplicity, speed and security. In less than three seconds we offer you a unique digital identity, robust and free of passwords, and prevents any type of digital identity fraud and protects user data privacy. At B-FY we do not identify credentials, certificates or people's devices. Our technology guarantees that each authentication process will be initiated and completed by a human, manually, and independent of passwords or fragile tokens. Thus, the user has total control of their identity. Includes connection to a human.</p><p>We believe that true security is only possible when we know with certainty who is behind each digital credential. For this reason, our solution does not validate data, but human presence. We use the best available technology and the most advanced security protocols to offer the most secure, robust and accessible system for people of all ages and backgrounds. Our technology eliminates online anonymity, blocks identity fraud and protects user privacy from the first click. We are pioneers in biometric authentication without credentials, based on personal devices. Thanks to our own model—secure, scalable and totally aligned with global regulations (such as GDPR)— we help companies and institutions convince their own identity providers. With B-FY, each access is transparent, traceable and truly secure. We are not just innovating in technology, we are redefining trust in digital and physical environments.</p>" />
<head>
  <meta charset="UTF-8" />
  <title>${content.title!"About Us | B-FY"}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
</head>
<body class="font-sans antialiased text-neutral-900">
  <#import "/b-fy/templates/components/nav.ftl" as ui />
  <@ui.nav currentPage="about-us" />
  <main style="margin-top:70px;">
    <#function firstChild nodeName>
      <#if (content[nodeName])??>
        <#assign children = (content[nodeName]?children)![] />
        <#if children?size gt 0><#return children[0] /></#if>
      </#if>
      <#return {} />
    </#function>
    <#import "/b-fy/templates/components/about/about-carousel.ftl" as aboutCarouselCmp />
    <#import "/b-fy/templates/components/about/about-message.ftl" as aboutMessageCmp />
    <#import "/b-fy/templates/components/about/about-details.ftl" as aboutDetailsCmp />
    <#import "/b-fy/templates/components/about/about-mission.ftl" as aboutMissionCmp />
    <#import "/b-fy/templates/components/about/about-vision.ftl" as aboutVisionCmp />
    <#import "/b-fy/templates/components/about/about-values.ftl" as aboutValuesCmp />
    <#import "/b-fy/templates/components/cta.ftl" as ctaCmp />
    <#assign fbMsgTagline = "Message from our founder" />
    <#assign fbMsgTitle = "B-FY: Universal innovation" />
    <#assign fbMsgContent = "<p>B-FY stops identity fraud and cybercrime online without the need for passwords, access keys, online biometrics or multi-factor identification.</p><p>Identity fraud and online cybercrime can never be stopped as long as access is granted to identified identities (tools instead of people). It is impossible for these identified tools, to which access is granted, to identify online operators, who always remain anonymous and, therefore, can be any cybercriminal on the planet in any digital transaction.</p><p>In the same way that cybercriminals who empty your account using your credit card credentials are also identified.</p><p>That's why we're always too late, when the damage is done, the money has already disappeared and the access doors have automatically closed.</p><p>This is also the cause of the increasing annual loss of 10.5 billion dollars, and that cybersecurity companies, technology giants and governments continue to be hacked regularly.</p><p>B-FY changes the access protocol by allowing access only to identified people, which makes identity impersonation or hacking by scammers or cybercriminals impossible.</p><p>Transactions with B-FY, in addition to being secure, can be completed in less than three seconds.</p>" />
    <#assign fbDetailsTitle = "Our company" />
    <#assign fbDetailsDesc = "<p>B-FY has changed the access protocol... We’re not just innovating in technology: we’re redefining digital and physical trust.</p>" />
    <#assign fbCountries = ["Mexico","Colombia","Peru","Chile","Argentina","Spain"] />
    <#assign fbMissionTitle = "Mission" />
    <#assign fbMissionDesc = "Authenticate legitimate users, eliminate fraud, and protect privacy by ensuring only real individuals gain access." />
    <#assign fbVisionTitle = "Vision" />
    <#assign fbVisionDesc = "Become the global benchmark access protocol by eliminating online anonymity and eradicating identity fraud." />
    <#assign fbValuesTitle = "Values" />
    <#assign fbValues = [
      {"name":"Authenticity","description":"Identify real people, not impersonal data."},
      {"name":"Privacy","description":"Protecting personal information is essential for trust."},
      {"name":"Passwordless architecture","description":"Fraud-resistant: no passwords, no anonymity, no impersonation."},
      {"name":"Transparency","description":"Only the right person gets access; every action has an owner."},
      {"name":"Continuous innovation","description":"18+ years of R&D anticipating future threats."},
      {"name":"User empowerment","description":"Decentralized biometric solution centered on user control."}
    ] />
    <#assign msgNode = firstChild('message') />
    <#assign msgTagline = msgNode.tagline!fbMsgTagline />
    <#assign msgTitle = msgNode.title!fbMsgTitle />
    <#assign msgHtml = (msgNode.content)!fbMsgContent />
    <#assign detailsNode = firstChild('details') />
    <#assign detailsTitle = detailsNode.title!fbDetailsTitle />
    <#assign detailsDesc = (detailsNode.description)!fbDetailsDesc />
    <#assign detailsCountries = fbCountries />
    <#if detailsNode.countries?has_content><#assign detailsCountries = detailsNode.countries /></#if>
    <#assign missionNode = firstChild('mission') />
    <#assign missionTitle = missionNode.title!fbMissionTitle />
    <#assign missionDesc = missionNode.description!fbMissionDesc />
    <#assign missionImage = ctx.contextPath + '/.resources/b-fy/webresources/images/mission.webp' />
    <#if missionNode.image?? && (damfn??)><#attempt><#assign missionImage = (damfn.link(missionNode.image))!missionImage /><#recover></#attempt></#if>
    <#assign visionNode = firstChild('vision') />
    <#assign visionTitle = visionNode.title!fbVisionTitle />
    <#assign visionDesc = visionNode.description!fbVisionDesc />
    <#assign visionImage = ctx.contextPath + '/.resources/b-fy/webresources/images/vision.webp' />
    <#if visionNode.image?? && (damfn??)><#attempt><#assign visionImage = (damfn.link(visionNode.image))!visionImage /><#recover></#attempt></#if>
    <#assign valuesNode = firstChild('values') />
    <#assign valuesTitle = valuesNode.title!fbValuesTitle />
    <#assign valuesImage = ctx.contextPath + '/.resources/b-fy/webresources/images/values.webp' />
    <#if valuesNode.image?? && (damfn??)><#attempt><#assign valuesImage = (damfn.link(valuesNode.image))!valuesImage /><#recover></#attempt></#if>
    <#assign valuesList = fbValues />
    <#if valuesNode.list?has_content><#assign valuesList = valuesNode.list /></#if>
    <#assign slides = [] />
    <#if (content.carousel)??><#assign slides = (content.carousel?children)![] /></#if>
    <#if slides?size == 0>
      <#assign slides = [
        {"title":"18+ years of R&D","description":"Continuous innovation anticipating threats.","image":"carousel-02.webp"},
        {"title":"Global presence","description":"Teams and clients across multiple regions.","image":"carousel-03.webp"},
        {"title":"Security & Privacy","description":"Architecture that preserves biometric privacy.","image":"carousel-04.webp"}
      ] />
    </#if>
    <#-- Normalize slides and resolve images locally -->
    <#assign normalizedSlides = [] />
    <#list slides as s>
      <#assign img = s.image!'carousel-02.webp' />
      <#-- If DAM reference and damfn available try resolve to absolute URL; leave relative filenames untouched -->
      <#if (damfn??) && (s.image??) && !(img?starts_with('http')) && !img?contains('/')><#attempt><#assign img = (damfn.link(s.image))!img /><#recover></#attempt></#if>
      <#assign normalizedSlides = normalizedSlides + [{"title": s.title!"","description": s.description!"","image": img}] />
    </#list>
    <#assign slides = normalizedSlides />
    <#-- Intro section (title, description, carousel) -->
    <#if !ABOUT_INTRO_STYLE_INCLUDED??>
      <#global ABOUT_INTRO_STYLE_INCLUDED = true />
      <style>
        .about-intro{margin-top:48px;padding:0 20px;text-align:center}
        @media (min-width:640px){.about-intro{padding-left:40px;padding-right:40px}}
        @media (min-width:1024px){.about-intro{padding-left:52px;padding-right:52px;margin-top:96px}}
        .about-intro h1{margin:0 auto;font-weight:700;font-size:1.875rem;line-height:1.1;max-width:48rem}
        @media (min-width:1280px){.about-intro h1{font-size:3rem}}
        .about-intro p{max-width:944px;margin:32px auto 0;font-size:1.125rem;line-height:1.4}
        @media (min-width:1280px){.about-intro p{font-size:1.25rem}}
      </style>
    </#if>
    <#assign pageTitle = content.title!msgTitle />
    <#assign pageDesc = content.description!msgHtml />
    <section class="about-intro">
      <h1>${pageTitle}</h1>
      <p>${content.description!""}</p>
      <@aboutCarouselCmp.aboutCarousel slides=slides />
    </section>
    <@aboutMessageCmp.aboutMessage tagline=msgTagline title=msgTitle htmlContent=msgHtml />
    <#assign detailsImage = ctx.contextPath + '/.resources/b-fy/webresources/images/map.webp' />
    <#if detailsNode.image?? && (damfn??)><#attempt><#assign detailsImage = (damfn.link(detailsNode.image))!detailsImage /><#recover></#attempt></#if>
    <@aboutDetailsCmp.aboutDetails title=detailsTitle description=detailsDesc imageUrl=detailsImage countries=detailsCountries />
    <@aboutMissionCmp.aboutMission title=missionTitle description=missionDesc imageUrl=missionImage />
    <@aboutVisionCmp.aboutVision title=visionTitle description=visionDesc imageUrl=visionImage />
    <@aboutValuesCmp.aboutValues title=valuesTitle imageUrl=valuesImage values=valuesList />
    <@ctaCmp.callToAction tagline="What are you waiting for?" />
  </main>
  <#import "/b-fy/templates/components/footer.ftl" as layout />
  <@layout.siteFooter />
</body>
</html>
