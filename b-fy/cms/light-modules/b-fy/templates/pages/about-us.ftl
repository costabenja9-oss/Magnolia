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
    <#assign fbMsgTagline = "We authenticate legitimate users, not digital identities." />
    <#assign fbMsgTitle = "At B-FY, we have been developing technology for over 18 years to solve a critical problem: the inability to know who is truly behind a digital transaction." />
    <#assign fbMsgContent = "<p>Our goal is clear: to eliminate online anonymity and eradicate identity fraud.</p>" />
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
    <#assign detailsImage = ctx.contextPath + '/.resources/b-fy/webresources/images/about-us.webp' />
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
