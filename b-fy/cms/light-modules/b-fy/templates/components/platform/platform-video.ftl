<#-- Platform video component with enhanced styling matching reference image -->
<#macro platformVideo class="" id="" title="Reproducir video">
	<#assign fallbackVideoId = 'dQw4w9WgXcQ' />
	<#assign vid = id />
	<#if !vid?has_content>
		<#-- attempt to resolve from content.video -->
		<#assign node = {} />
		<#if content.video??>
			<#if content.video?is_sequence && content.video?size gt 0>
				<#assign node = content.video[0] />
			<#elseif content.video.videoId??>
				<#assign node = content.video />
			<#else>
				<#assign ch = (content.video?children)![] />
				<#if ch?size gt 0><#assign node = ch[0] /></#if>
			</#if>
		</#if>
		<#assign vid = node.videoId!fallbackVideoId />
	</#if>
	
	<div class="${class!'max-w-4xl mx-auto my-16'}">
		<div class="relative aspect-video w-full rounded-2xl overflow-hidden bg-gradient-to-br from-orange-100 to-orange-200 shadow-xl">
			<#-- Video placeholder with play button overlay -->
			<div class="absolute inset-0 bg-gradient-to-br from-gray-900/80 to-gray-900/60">
				<img src="${ctx.contextPath}/.resources/b-fy/webresources/images/platform-poster.webp" 
				     alt="Video preview" 
				     class="w-full h-full object-cover"
				     onerror="this.style.display='none'" />
			</div>
			
			<#-- Play button overlay -->
			<div class="absolute inset-0 flex items-center justify-center group cursor-pointer" onclick="loadVideo(this, '${vid}')">
				<div class="bg-white/90 hover:bg-white rounded-full p-6 shadow-2xl transform group-hover:scale-110 transition-all duration-300">
					<svg class="w-12 h-12 text-orange-600 ml-1" fill="currentColor" viewBox="0 0 24 24">
						<path d="M8 5v14l11-7z"/>
					</svg>
				</div>
				
				<#-- Video title overlay -->
				<div class="absolute bottom-6 left-6 right-6">
					<div class="bg-black/50 backdrop-blur-sm rounded-lg p-4">
						<h3 class="text-white font-semibold text-lg">${title}</h3>
						<p class="text-gray-200 text-sm mt-1">Haz clic para reproducir</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		function loadVideo(element, videoId) {
			const container = element.parentElement;
			container.innerHTML = '<iframe src="https://www.youtube.com/embed/' + videoId + '?autoplay=1" title="' + '${title}' + '" allowfullscreen class="w-full h-full border-0 rounded-2xl"></iframe>';
		}
	</script>
</#macro>
