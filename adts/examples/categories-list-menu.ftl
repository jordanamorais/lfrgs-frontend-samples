<#assign
  group = themeDisplay.getScopeGroup()
  groupPublicPathURL = group.getPathFriendlyURL(false, themeDisplay)
  groupFriendly = group.getFriendlyURL()
  layoutFriendlyURL = themeDisplay.getLayoutFriendlyURL(layout)
/>

<#if entries?has_content>

  <div class="grd-sidebar-menu mt-4 mb-4">
    <h5 class="mb-3">
      ${languageUtil.get(locale, "categories")}
    </h5>

    <ul class="grd-sidebar-menu__list pl-2 mt-2">
      <li class="grd-sidebar-menu__item">
        <a href="${groupPublicPathURL}${groupFriendly}${layoutFriendlyURL}">Todas as APIs</a>
      </li>

      <#list entries as entry>

        <#assign categories = entry.getCategories() />
        <@displayCategories categories=categories />

      </#list>

    </ul>

  </div>

</#if>

<#macro displayCategories categories >
	<#if categories?has_content>

			<#list categories as category>
				<li class="grd-sidebar-menu__item">
					<a href="#category_${category.getCategoryId()}" data-scroll="#category_${category.getCategoryId()}">${category.getName()}</a>
					<#if serviceLocator??>
						<#assign
							assetCategoryService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryService")
							childCategories = assetCategoryService.getChildCategories(category.getCategoryId())
						/>
						<@displayCategories categories=childCategories />
					</#if>
				</li>
			</#list>

	</#if>
</#macro>
