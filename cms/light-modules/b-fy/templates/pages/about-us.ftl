<!DOCTYPE html>
<html lang="en">
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
    <#assign fbMsgTagline = "Message from Our Founder" />
    <#assign fbMsgTitle = "B-FY, THE UNIVERSAL BREAKTHROUGH" />
    <#assign fbMsgContent = "<p>B-FY stops online ID fraud/cybercrime, without needing passwords, passkeys, online biometrics, or multifactor identities.</p><p>Online ID fraud/cybercrime can never be stopped when continued access is given to identified identities (tools instead of humans). It is impossible for these identified tools that are given access to identify online operators who always remain anonymous and therefore can be any cybercriminal on the planet at any online transaction.</p><p>Just like the cybercriminals that empty your account with your credit card credentials are never identified either. This is why we always find out too late, when damage is already done, money is already gone, or the unmanned security gates trespassed.</p><p>Also, this is the reason behind the ever-increasing loss of 10.5 trillion dollars per annum —and why cybersecurity firms, IT giants, and governments are still being hacked on a regular basis.</p><p>B-FY changes the access protocol by giving access to identified individuals only, whereby impersonation or hacking by ID fraudsters/cybercriminals becomes impossible. The user-friendly B-FY transactions can be completed in less than three seconds.</p><p><strong>Founder and Chief Innovation Officer at B-FY</strong></p>" />
    <#assign fbDetailsTitle = "Our company" />
    <#assign fbDetailsDesc = "<p>B-FY has changed the access protocol for authenticating all human beings. Putting legitimate human users at the center.
At B-FY, we have been driving a quiet but profound revolution for over 18 years: to forever change how people are authenticated in both the digital and physical worlds.
Our new access protocol has created a perfect balance between simple, fast, and easy authentication (Less than 3 seconds), with superior security avoiding all online ID fraud and protecting and guaranteeing user’s data privacy.
B-FY Identifies real individuals as opossed to identifying identities.

B-FY makes sure there is a real human being starting and finishing a manual authentication process. Protecting their privacy, giving them the power to authenticate offline and making it the easiest and fastest passwordless experience in the market.
We were born with a firm conviction: real security is only possible when we know with certainty who is behind any digital ID credential. 
That’s why we developed a solution that validates not data, but human presence.
B-FY uses the best available technology and security protocols in the market to create the most secure, robust, and friendly protocol for users of all ages and geographies.
Our technology eliminates online anonymity, blocks identity fraud, and protects user privacy from the very first click.
We are pioneers in passwordless authentication based on biometrics and personal devices. Thanks to our proprietary model—secure, scalable, and regulatory-compliant (e.g., GDPR)—we empower companies and institutions to become their own identity providers.
With B-FY, every access is transparent, traceable, and truly secure.
We’re not just innovating in technology: we’re redefining digital and physical trust.

</p>" />
    <#assign fbCountries = ["Mexico","Colombia","Peru","Chile","Argentina","Spain"] />
    <#assign fbMissionTitle = "Our Mission" />
    <#assign fbMissionDesc = "At B-FY, our mission is clear: to authenticate legitimate users of any company or institution, eliminate fraud, and protect privacy. Our commitment is to ensure that only authentic individuals—not faked or hacked digital identities (passwords, passkeys, online biometrics, ID cards)—gain access to digital or physical environments and services.
" />
    <#assign fbVisionTitle = "Our Vision" />
    <#assign fbVisionDesc = "To become the global benchmark new access protocol for transforming digital and physical access by eliminating online anonymity and eradicating identity fraud, through the unequivocal authentication of real human beings—without passwords, without credentials that can be stolen, and without relying on centralized databases." />
    <#assign fbValuesTitle = "Our Values" />
    <#assign fbValues = [
  {"name":"Authenticity","description":"We believe in identifying real people, not impersonal data."},
  {"name":"Privacy","description":"Protecting personal information is essential for trust and the reputation of any organization."},
  {"name":"Passwordless architecture by design","description":"Our solution is built on a fraud-resistant model—no passwords, no anonymity, no risk of impersonation."},
  {"name":"Transparency","description":"Only the right person gets access, and every action has a clear owner."},
  {"name":"Continuous innovation","description":"With over 18 years of R&D, we keep evolving to anticipate future threats."},
  {"name":"User empowerment","description":"At B-FY, the user is at the center of the authentication process. Our decentralized biometric solution gives users the power to manage, protect, and control their authentication from the comfort, ease, and privacy of their own mobile device—using only their biometrics and their B-FY private key."},
  {"name":"No passwords, no friction","description":"No passwords, no friction, and no need to transmit or store biometric data."}
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
        {
          "title":"Who we are",
          "description":"We authenticate legitimate users, not digital identities.\nAt B-FY, we have been developing technology for over 18 years to solve a critical problem:\nthe inability to know who is truly behind a digital transaction.\nOur goal is clear: to eliminate online anonymity and eradicate identity fraud.",
          "image":"about-us.webp"
        },
        {
          "title":"Why we exist", 
          "description":"Because current systems fail.\nDigital access is still granted to spoofable identities, not to real people.\nPasswords, personal data, and tokens can be stolen.\nAs long as anonymity exists, fraud will persist.\nB-FY was born to change that paradigm.",
          "image":"carousel-02.webp"
        },
        {
          "title":"Our Philosophy",
          "description":"One identity, one person. Just one.\nWe believe that each access should be unequivocally linked to an authentic human being.\nNo passwords. No vulnerable databases. No room for impersonation.\nAuthentication must mean real presence, not just data matching.",
          "image":"carousel-03.webp"
        },
        {
          "title":"How We Make It Possible",
          "description":"With advanced technology and firm principles.\nB-FY works with the user's mobile phone, their biometrics, and an encrypted private key.\nA passwordless solution, with no direct interaction with databases, protecting privacy by design.\nSecure, transparent, and ethical.",
          "image":"carousel-04.webp"
        },
        {
          "title":"Our Vision",
          "description":"Redefining the access protocol.\nWe envision a future where organizations no longer guess who is accessing,\nbut know it with certainty—frictionlessly, fraud-free, and without compromising privacy.\nThat future starts now.\nAnd we're building it at B-FY.",
          "image":"carousel-05.webp"
        }
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
    <#assign pageTitle = content.title!"The End of Online Anonymity Begins with B-FY" />
    <#assign pageDesc = content.description!"B-FY changes the access protocol without the need for passwords, passkeys, or online biometrics. B-FY grants access only to identified individuals who cannot be impersonated or hacked, ensuring that both online and physical access are fully secure." />
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
