<#-- Platform Links: match image (uppercase, grey inactive, orange active with underline) -->
<#macro platformLinks active="">
  <#-- Fallback (EN) -->
  <#assign fallback = [
    {"name":"customer-authentication","title":"CUSTOMER AUTHENTICATION"},
    {"name":"employee-authentication","title":"EMPLOYEE AUTHENTICATION"},
    {"name":"user-controlled-biometrics","title":"USER-CONTROLLED BIOMETRICS"},
    {"name":"ato-protection","title":"EFFECTIVE AGAINST ATO, AI-DRIVEN FRAUD AND PHISHING"},
    {"name":"compliance","title":"REGULATORY COMPLIANCE"},
    {"name":"decentralized-authentication","title":"DECENTRALIZED AUTHENTICATION"}
  ] />

  <#assign nodes = [] />
  <#if content.features??>
    <#assign c = (content.features?children)![] />
    <#if c?size gt 0><#assign nodes = c /></#if>
  </#if>
  <#assign links = (nodes?size gt 0)?then(nodes, fallback) />
  <#assign activeName = (active?has_content)?then(active, "") />

  <#-- Scoped styles, included once -->
  <#if !BFY_PLINKS_STYLE_INCLUDED??>
    <#global BFY_PLINKS_STYLE_INCLUDED = true />
    <style>
      .bfy-tabs{border-top:1px solid #eee;padding-top:26px}
      .bfy-tabs__nav{display:flex;flex-wrap:wrap;justify-content:center;gap:28px;align-items:center}
      .bfy-tab{position:relative;text-transform:uppercase;letter-spacing:.02em;
               font-weight:600;font-size:14px;line-height:1;color:#9ca3af;text-decoration:none;
               padding:.5rem .25rem;transition:color .2s ease}
      .bfy-tab:hover{color:#ea580c;text-decoration:none}
      .bfy-tab:hover::after{content:"";position:absolute;left:0;right:0;bottom:-10px;height:3px;
                            background:#ea580c;border-radius:2px}
      .bfy-tab--active{color:#ea580c}
      .bfy-tab--active:hover{color:#ea580c}
      .bfy-tab--active::after{content:"";position:absolute;left:0;right:0;bottom:-10px;height:3px;
                              background:#ea580c;border-radius:2px}
      @media (min-width:1024px){ .bfy-tab{font-size:15px} }
    </style>
  </#if>

  <div class="bfy-tabs">
    <nav class="bfy-tabs__nav max-w-6xl mx-auto px-4">
      <#list links as l>
        <#assign name = l.name!l["name"]!"" />
        <#assign title = l.title!l["title"]!name />
        <#assign isActive = (name == activeName) />
        <#-- Generate correct URL based on platform section -->
        <#assign platformUrl = "" />
        <#if name == "customer-authentication">
          <#assign platformUrl = "${ctx.contextPath}/platform/client-authentication" />
        <#elseif name == "employee-authentication">
          <#assign platformUrl = "${ctx.contextPath}/platform/employee-authentication" />
        <#elseif name == "user-controlled-biometrics">
          <#assign platformUrl = "${ctx.contextPath}/platform/user-controlled-biometrics" />
        <#elseif name == "ato-protection">
          <#assign platformUrl = "${ctx.contextPath}/platform/ato-protection" />
        <#elseif name == "compliance">
          <#assign platformUrl = "${ctx.contextPath}/platform/regulatory-compliance" />
        <#elseif name == "decentralized-authentication">
          <#assign platformUrl = "${ctx.contextPath}/platform/decentralized-authentication" />
        <#else>
          <#assign platformUrl = "${ctx.contextPath}/platform/${name}" />
        </#if>
        <a href="${platformUrl}"
           class="bfy-tab ${isActive?then('bfy-tab--active','')}">
          <span>${title}</span>
        </a>
      </#list>
    </nav>
  </div>
</#macro>
