[#macro navigation]
[#-- ASSIGNMENTS --]
    [#assign navParentItem = cmsfn.contentByPath("/")]
    [#assign navItems = navfn.navItems(navParentItem)]

[#-- RENDERING --]
    <input class="lg:hidden" id="menu__toggle" type="checkbox" />
    <label class="flex lg:hidden menu__btn mr-6" for="menu__toggle">
        <span></span>
    </label>  

    <nav class="absolute top-16 left-0 w-full lg:static lg:py-0 flex flex-col lg:flex-row bg-white font-raleway text-xs font-extrabold" role="navigation">
        [#list navItems?filter(n -> !n.hideInNav!false) as __navItem]
            [#assign activeNavItem = (navfn.isActive(content, __navItem) || navfn.isOpen(content, __navItem))?then("active", "")]
            [#assign subItems = navfn.navItems(__navItem)!]
            [#assign navItem = cmsfn.wrapForI18n(__navItem)]
            [#if !subItems?hasContent]
                <a href="${cmsfn.link(navItem)!}" class="navbar__item ${activeNavItem!}"><span class="mx-auto">${navItem.navigationTitle!navItem.title!navItem.@name}</span></a>
            [#else]
                <div class="relative h-32">
                    <button class="dropdown navbar__item ${activeNavItem!} w-full lg:w-fit">
                        [#if navfn.hasTemplate(navItem, "b-fy-web:pages/navigation")]
                            <span class="mx-auto pl-7 lg:pl-0">${navItem.navigationTitle!navItem.title!navItem.@name}</span>
                        [#else]
                            <a class="mx-auto pl-7 lg:pl-0" href="${cmsfn.link(navItem)!}">${navItem.navigationTitle!navItem.title!navItem.@name}</a>
                        [/#if]
                        <svg class="-mr-1 ml-2 h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" role="collapsed">
                            <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
                        </svg>
                    </button>
                    <div class="navbar__submenu" role="dropdown-content">
                        <ul>
                            [#list subItems?filter(n -> !n.hideInNav!false) as __subItem]
                                [#assign subItem = cmsfn.wrapForI18n(__subItem)]
                                <li><a class="text-black" href="${cmsfn.link(subItem)!}">${subItem.navigationTitle!subItem.title!subItem.@name}</a></li>
                            [/#list]
                        </ul>
                    </div>
                </div>
            [/#if]
        [/#list]
    </nav>
[/#macro]