<div class="icons-menu" id="menu-direcoes">
  <#if entries?has_content>

    <ul class="icons-menu__items">

      <#list entries as navItem>

        <#assign nav_item_css_class = navItem.getName()?lower_case?replace(" ", "-") />
        <#assign nav_item_has_children = navItem.hasBrowsableChildren() />

        <#if nav_item_has_children>
          <#assign nav_item_has_children_class = "nav-item-has-children" />
        <#else>
          <#assign nav_item_has_children_class = ""/>
        </#if>

        <li class="card icons-menu__item ${nav_item_has_children_class}">

          <a href="${navItem.getURL()}" class="${nav_item_css_class} icons-menu__icon">
            <img class="icons-menu__icon__img" src="${navItem.iconURL()}" />
            <div class="icons-menu__icon__label">
              ${navItem.getName()}
            </div>
          </a>

          <#assign showChildren = (displayDepth != 1) && navItem.hasBrowsableChildren() />

          <#if showChildren>
            <ul class="icons-menu__items">
              <#list navItem.getBrowsableChildren() as childNavigationItem>
                <li class="icons-menu__item">
                  <a href="${childNavigationItem.getURL()}" class="icons-menu__icon">
                    <img class="icons-menu__icon__img" src="${childNavigationItem.iconURL()}"/>
                    <div class="icons-menu__icon__label">
                      ${childNavigationItem.getName()}
                    </div>
                  </a>
                </li>
              </#list>
            </ul>
          </#if>
        </li>

      </#list>

    </ul>
  </#if>
</div>
