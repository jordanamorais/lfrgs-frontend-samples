<#--
Name: ADT | My ADT Name
File Path: myproject/assets/menu/my-navigation-menu-adt.ftl
-->

<div class="project-menu">
    <#if entries?has_content>
        <ul class="project-menu__wrapper">
            <#list entries as navItem>

                <#assign nav_item_css_class = navItem.getName()?lower_case?replace(" ", "-") />

                <#if navItem.isSelected()>
                    <#assign
                        nav_item_css_class = "${nav_item_css_class} selected active"
                    />
                </#if>

                <li class="project-menu__item ${nav_item_css_class}">
                    <a href="${navItem.getURL()}" class="project-link">
                        ${navItem.getName()}
                    </a>
                </li>
            </#list>
        </ul>
    </#if>
</div>


