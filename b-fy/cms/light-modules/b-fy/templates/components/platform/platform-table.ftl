<#-- Platform comparison table matching the reference image design -->
<#import "/b-fy/templates/components/util/icons.ftl" as ic />
<#macro platformTable features=[]>
	<#assign fallbackFeatures = [
		"Passwordless by design",
		"Decentralized security", 
		"Fraud and AI attack prevention",
		"Frictionless user experience",
		"Protection against ATO",
		"User transparency",
		"Easy integration"
	] />
	<#assign list = (features?size gt 0)?then(features, fallbackFeatures) />
	
	<div class="my-12 bg-white rounded-xl shadow-lg overflow-hidden">
		<div class="overflow-x-auto">
			<table class="w-full">
				<thead class="bg-gray-50">
					<tr>
						<th class="px-6 py-3 text-left text-sm font-semibold text-gray-900 w-2/5"></th>
						<th class="px-4 py-3 text-center text-sm font-semibold text-gray-500 w-1/5">
							<div class="flex flex-col items-center">
								<span class="text-xs uppercase tracking-wide">Traditional 2FA</span>
								<span class="text-xs text-gray-400">(SMS, OTP, Apps)</span>
							</div>
						</th>
						<th class="px-4 py-3 text-center text-sm font-semibold text-gray-500 w-1/5">
							<span class="text-xs uppercase tracking-wide">Passwords</span>
						</th>
						<th class="px-6 py-3 text-center w-1/5">
							<div class="flex justify-center">
								<svg class="h-6 w-auto text-orange-600" fill="currentColor" viewBox="0 0 103 40">
									<path d="M13.85 8.77c3.7 0 6.6 2.87 6.6 6.54s-2.9 6.54-6.6 6.54H8.4v8.12H4.89V8.77h8.96zm-1.31 9.84c1.75 0 3.08-1.31 3.08-3.3 0-1.98-1.33-3.29-3.08-3.29H8.4v6.59h4.14zM33.86 21.67v8.32h-3.52v-8.32l-8.25-12.9h4.14l6.07 9.75 6.07-9.75h4.14l-8.65 12.9z"/>
									<path d="M57.45 8.77c7.15 0 12.15 5.23 12.15 10.6S64.6 29.97 57.45 29.97c-7.16 0-12.16-5.23-12.16-10.6S50.29 8.77 57.45 8.77zm0 17.74c4.69 0 8.4-3.74 8.4-7.14S62.14 12.23 57.45 12.23s-8.4 3.74-8.4 7.14 3.71 7.14 8.4 7.14z"/>
								</svg>
							</div>
						</th>
					</tr>
				</thead>
				<tbody class="divide-y divide-gray-200">
					<#list list as feature>
						<tr class="hover:bg-gray-50 transition-colors">
							<td class="px-6 py-3 text-sm text-gray-900 font-medium">
								<div class="flex items-center">
									<span class="w-1.5 h-1.5 bg-orange-500 rounded-full mr-3"></span>
									${feature}
								</div>
							</td>
							<td class="px-4 py-3 text-center">
								<div class="flex justify-center">
									<span class="text-red-400 font-bold text-lg">✕</span>
								</div>
							</td>
							<td class="px-4 py-3 text-center">
								<div class="flex justify-center">
									<span class="text-red-400 font-bold text-lg">✕</span>
								</div>
							</td>
							<td class="px-6 py-3 text-center">
								<div class="flex justify-center">
									<span class="text-green-500 font-bold text-lg">✓</span>
								</div>
							</td>
						</tr>
					</#list>
				</tbody>
			</table>
		</div>
	</div>
</#macro>
