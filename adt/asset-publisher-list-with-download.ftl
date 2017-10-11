<div class="panel">
    <ul class="list-group">
        <#if entries?has_content>
            <#list entries as curEntry>

                <#assign renderer = curEntry.getAssetRenderer() />
                <#assign url = renderer.getURLDownload(themeDisplay) />

                <li class="list-group-item">
                    ${curEntry.getTitle(locale)}

                    <span class="download-item">
                        <a href="${url}" target="_blank">Download</a>
                    </span>
                </li>
            </#list>
        </#if>
    </ul>
</div>
