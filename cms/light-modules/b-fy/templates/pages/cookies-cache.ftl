<#import "/b-fy/templates/components/nav.ftl" as ui>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${content.title!"Cookies & Cache Policy"}</title>
    <style>
        :root {
            --primary-color: #F97316;
            --primary-hover: #EA580C;
            --text-color: #1F2937;
            --text-light: #6B7280;
            --border-color: #D1D5DB;
            --bg-light: #F9FAFB;
            --white: #FFFFFF;
        }
        
        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-color);
            line-height: 1.6;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .hero-section {
            padding: 4rem 0;
            text-align: center;
            background: linear-gradient(180deg, #FEE2E2 0%, #FEF3C7 56%);
        }
        
        .hero-title {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }
        
        .hero-description {
            font-size: 1.25rem;
            color: var(--text-light);
            margin-bottom: 2rem;
        }
        
        .content-section {
            padding: 4rem 0;
        }
        
        .policy-content {
            background: var(--white);
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .policy-content h2 {
            color: var(--primary-color);
            margin-top: 2rem;
            margin-bottom: 1rem;
        }
        
        .policy-content p {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <@ui.nav currentPage="cookies-cache" />
    
    <main>
        <section class="hero-section">
            <div class="container">
                <h1 class="hero-title">${content.title!"Cookies & Cache Policy"}</h1>
                <#if content.description??>
                    <p class="hero-description">${content.description}</p>
                </#if>
            </div>
        </section>
        
        <section class="content-section">
            <div class="container">
                <div class="policy-content">
                    <#if content.policyContent??>
                        ${content.policyContent}
                    <#else>
                        <h2>Cookie Policy</h2>
                        <p>This website uses cookies to enhance user experience and provide personalized services.</p>
                        
                        <h2>Cache Policy</h2>
                        <p>We implement caching strategies to improve website performance and loading times.</p>
                        
                        <h2>Data Processing</h2>
                        <p>Information about how we process and store cached data and cookie information.</p>
                    </#if>
                </div>
            </div>
        </section>
    </main>
</body>
</html>
