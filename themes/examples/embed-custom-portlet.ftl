<#--  Inject the portlet id inside portletName  -->

<div class="la-sidebar sidenav-menu-slider">
    <div class="sidebar sidebar-default sidenav-menu">
        <div class="sidebar-body">
            <#assign VOID =
                freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId",
                "barebone")>

            <@liferay_portlet["runtime"]
                defaultPreferences="${freeMarkerPortletPreferences}"
                portletName="com_liferay_lvhn_navigation_web_portlet_NavigationPortlet"
            />

            <#assign VOID = freeMarkerPortletPreferences.reset()>
        </div>
    </div>
</div>
