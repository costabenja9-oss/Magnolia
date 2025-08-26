<#-- Platform video component - MAIN video only (appears after links) -->

<#-- Function to get video ID based on language and video type -->
<#function getVideoId type lang="en">
  <#if type == "platform">
    <#return (lang == "es")?then("obqGpsrI1Jc", "Lh0UTtZwrdY") />
  <#elseif type == "register">
    <#return (lang == "es")?then("oOe83lObelM", "fjvPHPtZvXk") />
  <#elseif type == "login">
    <#return (lang == "es")?then("E7lQtfVMpDE", "WVHd_-rQyqQ") />
  <#else>
    <#return "Lh0UTtZwrdY" />
  </#if>
</#function>

<#macro platformVideo class="" id="" title="">
  <#-- Get current language (you may need to adjust this based on your i18n setup) -->
  <#assign currentLang = "en" /> <#-- Default to English, adjust as needed -->
  
  <#-- Video configuration - Use provided ID if available, otherwise fallback to default -->
  <#if id?has_content && id?trim != "">
    <#assign mainVideoId = id />
  <#else>
    <#assign mainVideoId = getVideoId("platform", currentLang) />
  </#if>
  
  <#if !PLATFORM_VIDEO_STYLE_INCLUDED??>
    <#global PLATFORM_VIDEO_STYLE_INCLUDED = true />
    <style>
      .platform-main-video {
        max-width: 1200px;
        margin: 3rem auto;
        padding: 0 1rem;
      }
      
      /* Single main video layout matching image - centered */
      .main-video-section {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 2rem;
      }
      
      .video-container {
        position: relative;
        aspect-ratio: 16 / 9;
        border-radius: 0.75rem;
        overflow: hidden;
        background: #f3f4f6;
        cursor: pointer;
        transition: transform 0.2s;
        width: 100%;
        max-width: 800px;
      }
      
      .video-container:hover {
        transform: scale(1.02);
      }
      
      .video-preview {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      
      .video-overlay {
        position: absolute;
        inset: 0;
        background: rgba(0, 0, 0, 0.3);
        display: flex;
        align-items: center;
        justify-content: center;
        transition: background-color 0.2s;
      }
      
      .video-container:hover .video-overlay {
        background: rgba(0, 0, 0, 0.4);
      }
      
      .play-button {
        width: 64px;
        height: 64px;
        background: rgba(234, 88, 12, 0.9);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.2s;
      }
      
      .video-container:hover .play-button {
        background: #ea580c;
        transform: scale(1.1);
      }
      
      .play-icon {
        width: 24px;
        height: 24px;
        color: white;
        margin-left: 2px;
      }
    </style>
  </#if>
  
  <div class="platform-main-video">
    <#-- Single Main Video Section - only video as shown in image -->
    <div class="main-video-section">
      <div class="video-container" onclick="loadVideo(this, '${mainVideoId}')">
        <img src="https://i.ytimg.com/vi_webp/${mainVideoId}/maxresdefault.webp" 
             alt="B-FY Platform Demo" 
             class="video-preview"
             onerror="this.src='${ctx.contextPath}/.resources/b-fy/webresources/images/platform-poster.webp'" />
        <div class="video-overlay">
          <div class="play-button">
            <svg class="play-icon" viewBox="0 0 24 24" fill="currentColor">
              <path d="M8 5v14l11-7z"/>
            </svg>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script>
    function loadVideo(element, videoId) {
      const container = element;
      container.innerHTML = '<iframe src="https://www.youtube.com/embed/' + videoId + '?autoplay=1" title="Video" allowfullscreen style="width:100%;height:100%;border:0;border-radius:0.75rem;"></iframe>';
    }
  </script>
</#macro>
