<div class="panel">
    <ul class="list-group">

        <#if entries?has_content>
            <#list entries as curEntry>
                <li class="list-group-item">
                    <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />

                    <a class="mv-link mv-asset__title" href="${viewURL}">
                        ${curEntry.getTitle(locale)}
                    </a>
                    <span class="mv-asset__description">
                        ${curEntry.getDescription(locale)}
                    </span>
                </li>
            </#list>
        </#if>
    </ul>
</div>
