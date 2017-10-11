<#assign themeDisplay = request['theme-display'] />
<#assign layout = themeDisplay['plid'] />
<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign layoutObject = layoutService.getLayout(layout?number) />
<#assign pageTitle = layoutObject.getName(locale) />

<h2 class="my-title">
    ${pageTitle}
</h2>