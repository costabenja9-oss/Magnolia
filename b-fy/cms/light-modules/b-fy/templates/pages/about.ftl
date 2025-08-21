<#-- Import shared CMS utilities -->
<#import "/b-fy/templates/components/util/cms-helpers.ftl" as cms>

<#-- Funciones de emergencia inline -->
<#function hasRealContent value>
  <#if !value??>
    <#return false />
  </#if>
  <#return (value?has_content && value?is_string && value?trim != '') || (value?is_hash) />
</#function>

<#function cmsOrDefault cmsValue defaultValue>
  <#if hasRealContent(cmsValue!'')>
    <#return cmsValue />
  <#else>
    <#return defaultValue />
  </#if>
</#function>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>${cmsOrDefault(content.title!'', "About Us | B-FY")}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" type="image/png" href="${ctx.contextPath}/.resources/b-fy/webresources/favicon.png" />
  <link rel="stylesheet" href="${ctx.contextPath}/.resources/b-fy/webresources/styles.css" />
</head>
<body class="font-sans antialiased text-neutral-900">

<#import "/b-fy/templates/components/nav.ftl" as ui>
<@ui.nav currentPage="about" />

<#-- Import About components -->
<#import "/b-fy/templates/components/about/about-hero.ftl" as aboutHeroCmp>
<#import "/b-fy/templates/components/about/about-message.ftl" as aboutMsgCmp>
<#import "/b-fy/templates/components/about/about-details.ftl" as aboutDetailsCmp>
<#import "/b-fy/templates/components/about/about-mission.ftl" as aboutMissionCmp>
<#import "/b-fy/templates/components/about/about-vision.ftl" as aboutVisionCmp>
<#import "/b-fy/templates/components/about/about-values.ftl" as aboutValuesCmp>
<#import "/b-fy/templates/components/cta.ftl" as ctaCmp>

<#-- Helper to fetch DAM image by path or return empty -->
<#function damImage path>
  <#attempt>
    <#if path?has_content>
      <#assign node = cmsfn.contentByPath(path, "dam")! />
      <#if node?? && (damfn??)>
        <#return (damfn.link(node))!"" />
      </#if>
    </#if>
  <#recover>
  </#attempt>
  <#return "" />
</#function>

<main style="margin-top:70px;">
  <#-- Hero & Carousel -->
  <#assign heroTitle = cmsOrDefault(content.title!'', "About B-FY") />
  <#assign heroDescription = cmsOrDefault(content.description!'', "") />
  <#assign carouselNode = cmsfn.contentByPath(content.@path + "/carousel", content.@workspace)! />
  <#assign carouselItems = [] />
  <#if carouselNode??>
    <#assign carouselItems = (cmsfn.children(carouselNode))![] />
  </#if>
  <@aboutHeroCmp.aboutHero title=heroTitle description=heroDescription carouselItems=carouselItems />

  <#-- Message -->
  <#assign msgNode = cmsfn.contentByPath(content.@path + "/message", content.@workspace)! />
  <#if msgNode??>
    <@aboutMsgCmp.aboutMessage tagline=msgNode.tagline!"" title=msgNode.title!"" htmlContent=msgNode.content!"" />
  </#if>

  <#-- Details -->
  <#assign detailsNode = cmsfn.contentByPath(content.@path + "/details", content.@workspace)! />
  <#if detailsNode??>
    <#assign countriesNode = cmsfn.contentByPath(detailsNode.@path + "/countries", detailsNode.@workspace)! />
    <#assign countries = [] />
    <#if countriesNode??>
      <#assign countries = (cmsfn.children(countriesNode))![] />
      <#assign countries = countries?map(c -> c.field!"") />
    </#if>
    <#assign detailsImage = damImage(detailsNode.imagePath!"") />
    <@aboutDetailsCmp.aboutDetails title=detailsNode.title!"" description=detailsNode.description!"" imageUrl=detailsImage countries=countries />
  </#if>

  <#-- Mission -->
  <#assign missionNode = cmsfn.contentByPath(content.@path + "/mission", content.@workspace)! />
  <#if missionNode??>
    <#assign missionImage = damImage(missionNode.imagePath!"") />
    <@aboutMissionCmp.aboutMission title=missionNode.title!"" description=missionNode.description!"" imageUrl=missionImage />
  </#if>

  <#-- Vision -->
  <#assign visionNode = cmsfn.contentByPath(content.@path + "/vision", content.@workspace)! />
  <#if visionNode??>
    <#assign visionImage = damImage(visionNode.imagePath!"") />
    <@aboutVisionCmp.aboutVision title=visionNode.title!"" description=visionNode.description!"" imageUrl=visionImage />
  </#if>

  <#-- Values -->
  <#assign valuesNode = cmsfn.contentByPath(content.@path + "/values", content.@workspace)! />
  <#if valuesNode??>
    <#assign valuesListNode = cmsfn.contentByPath(valuesNode.@path + "/list", valuesNode.@workspace)! />
    <#assign valuesList = [] />
    <#if valuesListNode??>
      <#assign valuesList = (cmsfn.children(valuesListNode))![] />
      <#assign valuesList = valuesList?map(v -> {"name": v.name!, "description": v.description!""}) />
    </#if>
    <#assign valuesImage = damImage(valuesNode.imagePath!"") />
    <@aboutValuesCmp.aboutValues title=valuesNode.title!"" imageUrl=valuesImage values=valuesList />
  </#if>

  <@ctaCmp.callToAction tagline="Experience the new era of authentication." title="Ready to get started?" ctaLabel="Get started" ctaLink="/contact" />
</main>

<#import "/b-fy/templates/components/footer.ftl" as footerCmp>
<@footerCmp.footer />

</body>
</html>
