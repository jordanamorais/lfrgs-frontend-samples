<div class="panel">
    <ul class="list-group">
        <#if entries?has_content>
            <#list entries as curEntry>

                <li class="list-group-item">
                    <#assign assetRenderer = curEntry.getAssetRenderer() />
                    <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />
                    
                    <#if assetLinkBehavior != "showFullContent">
                        <#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
                    </#if>

                    <a href="${viewURL}">
                        ${curEntry.getTitle(locale)}
                    </a>
                </li>
            </#list>
        </#if>
    </ul>
</div>
