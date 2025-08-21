<#import "/b-fy/templates/components/nav.ftl" as ui>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${content.title!"Contact"}</title>
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
            line-height: 1.5;
        }
        
        .container {
            max-width: 1200px;
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
    </style>
</head>
<body>
    <@ui.nav currentPage="contact" />
    
    <main>
        <section class="hero-section">
            <div class="container">
                <h1 class="hero-title">${content.title!"Contact Us"}</h1>
                <#if content.description??>
                    <p class="hero-description">${content.description}</p>
                </#if>
            </div>
        </section>
        
        <section class="content-section">
            <div class="container">
                <#if content.contactInfo??>
                    <div class="contact-info">
                        ${content.contactInfo}
                    </div>
                </#if>
                
                <#if content.formEmbed??>
                    <div class="contact-form">
                        ${content.formEmbed}
                    </div>
                </#if>
            </div>
        </section>
    </main>
</body>
</html>
