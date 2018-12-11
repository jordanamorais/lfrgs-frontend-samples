<#assign blogsEntryLocalService = serviceLocator.findService("com.liferay.blogs.service.BlogsEntryLocalService")/>

<#if entries?has_content>

    <div class="funcesp-blogs-entries">

        <div class="funcesp-blogs-entries__header text-center">
            <h2>Blog</h2>
            <p>Novidades, artigos, educação financeira, prevenção de saúde, tudo sobre longevidade.</p>
        </div>
    
        <div class="row">
            <#list entries as curEntry>
                <div class="col-md-4">
                    <#assign blog = blogsEntryLocalService.getBlogsEntry(curEntry.getClassPK()) />

                    <#assign assetRenderer = curEntry.getAssetRenderer() />
                    <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />

                    <#if assetLinkBehavior != "showFullContent">
                        <#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
                    </#if>

                    <img class="funcesp-blogs-entries__image" src="${blog.getSmallImageURL(themeDisplay)}" alt="">

                    <a class="funcesp-blogs-entries__title" href="${viewURL}">
                        <h3>
                            ${blog.getTitle()}
                        </h3>
                        <b class="funcesp-blogs-entries__date">
                            ${blog.getModifiedDate()?date}
                        </b>
                    </a>

                    <p class="funcesp-blogs-entries__subtitle">
                        ${blog.getSubtitle()}
                    </p>
                    
                </div>
            </#list>
        </div>
    </div>
</#if>