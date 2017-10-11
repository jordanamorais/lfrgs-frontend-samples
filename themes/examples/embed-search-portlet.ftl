<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone")>

<#--  TIP: You have to hide the Search Portlet Header title with CSS  -->

<div class="my-embed-search-example">
    <@liferay.search default_preferences="${freeMarkerPortletPreferences}" />
</div>