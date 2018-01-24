<#assign portalCurrentURL = themeDisplay.getPortalURL() + themeDisplay.getURLCurrent()>

<#if change_menu_url != "false">
    <#assign change_menu_url_boolean = true>
<#else>
    <#assign change_menu_url_boolean = false>
</#if>

<nav class="${project_prefix}-menu hidden-xs">
	<#if nav_items?has_content>
		<ul class="${project_prefix}-menu__main-list">
			<#list nav_items as navItem>
				<#assign has_child_class = "" >
				<#if navItem.hasChildren()>
					<#assign has_child_class = "has-child">
				</#if>
				<#if !is_signed_in>
					<li class="${project_prefix}-menu__item ${has_child_class}">
						<#if navItem.hasChildren()>
              <a href="#" onclick="return false;" class="${project_prefix}-menu__link">${navItem.getName()}</a>
							<div class="${project_prefix}-menu__submenu-list-wrapper">
								<ul class="${project_prefix}-menu__submenu-list">
									<#list navItem.getChildren() as childItem>

										<li class="${project_prefix}-submenu__item">
                      <#if childItem.hasChildren()>
                        <a href="#" onclick="return false;" class="${project_prefix}-submenu__link">
                      <#else>
                        <#assign routeURLChild = portalCurrentURL + childItem.getLayout().getFriendlyURL(locale)?replace("/", "#")>

                        <a href="${change_menu_url_boolean?then(routeURLChild , childItem.getURL())}" class="${project_prefix}-submenu__link">
                      </#if>
												  <img class="${project_prefix}-menu__group-icon" src="${childItem.iconURL()?replace('img_id', 'img_id=')}" alt="">
												  ${childItem.getName()}
											  </a>
											<#if childItem.hasChildren()>
                        <ul class="${project_prefix}-menu__submenu-children-list">
												  <#list childItem.getChildren() as grandChild>
														<li>
                              <#assign routeURLgrandChild = portalCurrentURL + grandChild.getLayout().getFriendlyURL(locale)?replace("/", "#")>

															<a href="${change_menu_url_boolean?then(routeURLgrandChild , grandChild.getURL())}">${grandChild.getName()}</a>
														</li>
												  </#list>
                        </ul>
											</#if>
										</li>
									</#list>
								</ul>
							</div>
            <#else>
              <#assign routeURLnavItem = portalCurrentURL + navItem.getLayout().getFriendlyURL(locale)?replace("/", "#")>

  						<a href="${change_menu_url_boolean?then(routeURLnavItem , navItem.getURL())}" class="${project_prefix}-menu__link">${navItem.getName()}</a>
						</#if>
					</li>
				<#else>
					<li class="${project_prefix}-menu__item ${has_child_class}">
						<#if navItem.hasChildren()>
              <a href="#" onclick="return false;" class="${project_prefix}-menu__link">
                <img class="${project_prefix}-menu__main-icon" src="${navItem.iconURL()?replace('img_id', 'img_id=')}" alt="">
                ${navItem.getName()}
              </a>
							<div class="${project_prefix}-menu__submenu-list-wrapper">
								<ul class="${project_prefix}-menu__submenu-list">
									<#list navItem.getChildren() as childItem>
										<li class="${project_prefix}-submenu__item">
                      <#if childItem.hasChildren()>
											  <a href="#" onclick="return false;" class="${project_prefix}-submenu__link">
                      <#else>
                        <#assign routeURLChild = portalCurrentURL + childItem.getLayout().getFriendlyURL(locale)?replace("/", "#")>

                        <a href="${change_menu_url_boolean?then(routeURLChild , childItem.getURL())}" class="${project_prefix}-submenu__link">
                      </#if>
                          <img class="${project_prefix}-menu__group-icon" src="${childItem.iconURL()?replace('img_id', 'img_id=')}" alt="">
                          ${childItem.getName()}
                        </a>
											<#if childItem.hasChildren()>
												<#list childItem.getChildren() as grandChild>
													<ul class="${project_prefix}-menu__submenu-children-list">
														<li>
                              <#assign routeURLgrandChild = portalCurrentURL + grandChild.getLayout().getFriendlyURL(locale)?replace("/", "#")>

															<a href="${change_menu_url_boolean?then(routeURLgrandChild , grandChild.getURL())}">${grandChild.getName()}</a>
														</li>
													</ul>
												</#list>
											</#if>
										</li>
									</#list>
								</ul>
							</div>
            <#else>
              <#assign routeURLnavItem = portalCurrentURL + navItem.getLayout().getFriendlyURL(locale)?replace("/", "#")>

              <a href="${change_menu_url_boolean?then(routeURLnavItem , navItem.getURL())}" class="${project_prefix}-menu__link">
                <img class="${project_prefix}-menu__group-icon" src="${navItem.iconURL()?replace('img_id', 'img_id=')}" alt="">
                ${navItem.getName()}
              </a>
						</#if>
					</li>
				</#if>
			</#list>
		</ul>
	</#if>
</nav>

