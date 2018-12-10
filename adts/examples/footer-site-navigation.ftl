<div class="funcesp-footer__nav">
    <#if entries?has_content>
        <#list entries as navItem>
            <ul>
                <li class="funcesp-footer--text-uppercase">
                    <a href="${navItem.getURL()}">${navItem.getName()?upper_case}</a>
                </li>

                <#if navItem.hasChildren()>

                    <#list navItem.getChildren() as navItemChild>
                        <li><a href="${navItemChild.getURL()}">${navItemChild.getName()}</a></li>
                    </#list>

                </#if>
            </ul>
        </#list>
    </#if>
</div>