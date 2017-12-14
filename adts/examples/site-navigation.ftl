<#assign sign_out_url = "/c/portal/logout" />
<#assign user_screenname_size = themeDisplay.getUser().getScreenName()?length />
<#assign user_rut_persona_size = user_screenname_size - 2 />
<#assign user_screename = themeDisplay.getUser().getScreenName() />
<#assign user_rut_persona = user_screename[0..user_rut_persona_size] />
<#assign user_rut_dv = user_screename[user_screenname_size - 1] />

<div class="msl-user-panel">
    <#if entries?has_content>
        <ul class="msl-user-panel__list">
            <#list entries as navItem>

                <#assign nav_item_css_class = navItem.getName()?lower_case?replace(" ", "-") />

                <#if navItem.isSelected()>
                    <#assign
                        nav_item_css_class = "${nav_item_css_class} selected active"
                    />
                </#if>

                <#if navItem.getName() == "Preferencias">

                    <li class="msl-user-panel__heading">
                        <h5 class="msl-user-panel__name text-uppercase">
                            ${themeDisplay.getUser().getFullName()}
                        </h5>

                        <div class="msl-user-panel__info">
                            <span class="msl-user-panel__numnber">
                                ${user_rut_persona}-${user_rut_dv}
                            </span>
                            <a href="${navItem.getURL()}" class="btn btn-link msl-user-panel__preferences">
                                <span class="msl-icon icon-cog"></span>
                                ${navItem.getName()}
                            </a>
                            <a class="btn btn-link" href="${sign_out_url}">
                                <span class="msl-icon icon-signout"></span>
                                Salir
                            </a>
                        </div>
                    </li>
                </#if>

                <li class="msl-user-panel__item ${nav_item_css_class}">
                    <a href="${navItem.getURL()}" class="msl-user-panel-item__link">
                        ${navItem.getName()}
                    </a>
                </li>
            </#list>
        </ul>
    </#if>
</div>