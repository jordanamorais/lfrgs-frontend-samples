<#assign
	<#--  Get Vocabulary Service-->
	assetVocabularyService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetVocabularyLocalService")
  categoryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryLocalService")
  vocabularies = assetVocabularyService.getGroupVocabularies(themeDisplay.getScopeGroupId())
/>
<div class="ptb-news ptb-news__news-list">

  <#macro asset_entries_include assetEntryContext>
    <#assign

      <#--  Needed in order to get the img url  -->
      dlAppService = serviceLocator.findService("com.liferay.document.library.kernel.service.DLAppService")
      dlUtil = serviceLocator.findService("com.liferay.document.library.kernel.util.DLUtil")

      <#--  Get access to the journal article context and content  -->
      renderer = assetEntryContext.getAssetRenderer()
      journalArticle = renderer.getArticle()
      document = saxReaderUtil.read(journalArticle.getContent())
      rootElement = document.getRootElement()

      <#--  Get custom web content structure fields  -->
      xPathSelectorImage = saxReaderUtil.createXPath("dynamic-element[@name='newsImage']")
      imageSrc = xPathSelectorImage.selectSingleNode(rootElement).getStringValue()?trim

      <#--  Needed in order to get the img url field of a custom structure associated to a journal article -->
      jsonData =  jsonFactoryUtil.createJSONObject(imageSrc)
      fileEntryId =  getterUtil.getInteger(jsonData.get('fileEntryId'))

      <#--  Get entry categories list-->
      entryCategories = assetEntryContext.getCategories()
    />

    <#--  Create urlImage  -->
    <#if fileEntryId?? && fileEntryId!=0>
        <#assign
          fileEntry = dlAppService.getFileEntry(fileEntryId)
          urlImage = dlUtil.getDownloadURL(fileEntry, fileEntry.getFileVersion(), themeDisplay, null)
        />
    <#else>
        <#assign urlImage = "#">
    </#if>

    <#--  To get the context of viewUrl in order to open on configured content display page  -->
    <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, assetEntryContext) />

    <#if assetLinkBehavior != "showFullContent">
      <#assign viewURL = renderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
    </#if>

  </#macro>

  <#macro get_not_segmented_categories categoryIdsContext>

    <#if vocabularies?has_content>
      <#list vocabularies as vocabulary>
        <#if vocabulary.getTitle(locale) != "Segmentação de Conteúdo">

          <#assign vocabularyCategories = vocabulary.getCategories() >

          <#if vocabularyCategories?has_content>

            <#list vocabularyCategories as vocabularyCategory >

              <#if categoryIdsContext?has_content>

                <#list categoryIdsContext as categoryId>
                  <#if vocabularyCategory.getCategoryId() == categoryId>
                    <div class="ptb-news__label col-md-12">
                      <#assign category = categoryLocalService.getCategory(categoryId) >
                        <span class="label label-default ptb-label ptb-news__category bottom-gap">
                          ${category.getTitle(locale)}
                        </span>
                    </div>
                  </#if>
                </#list>

              </#if>
            </#list>
          </#if>

        </#if>
      </#list>

    </#if>

  </#macro>

  <#if entries?has_content>
    <#list entries as curEntry>

      <@asset_entries_include assetEntryContext=curEntry />

      <#assign title = curEntry.getTitle(locale)/>

      <#assign title_description = curEntry.getSummary(locale)/>

      <#assign title_str_max_length = 100 />

      <#if title?length gt title_str_max_length>
        <#assign title = title?substring(0,title_str_max_length)/>
        <#assign title += "..."/>
      </#if>

      <#assign title_description_max_length = 250 />

      <#if title_description?length gt title_description_max_length>
        <#assign title_description = title_description?substring(0,title_description_max_length)/>
        <#assign title_description += "..."/>
      </#if>

      <#assign title_content_with_image_grid_class = ""/>

      <div class="ptb-news__item ptb-news__item--list ptb-news__item--list-horizontal">
        <div class="row">
          <div class="col-md-12">
            <div class="row">
              <#if imageSrc?? && imageSrc!="">

                <#assign title_content_with_image_grid_class = "col-md-7 ptb-news--pl0"/>

                <div class="ptb-news__image-wrap col-md-5 col-xs-12">
                  <div class="ptb-news__thumbnail">
                    <a href="${viewURL}" class="ptb-link ptb-link--dark-blue">
                      <picture class="ptb-news__picture mb-2">
                        <img class="ptb-news__image" src="${urlImage}" alt="">
                      </picture>
                    </a>
                  </div>
                </div>
              </#if>
              <div class="ptb-news__title ${title_content_with_image_grid_class} col-xs-12">
                <div class="row">
                  <div class="col-md-12">
                    <h2 class="ptb-news__title__heading">
                      <a href="${viewURL}" class="ptb-link ptb-link--dark-blue">
                        ${title}
                      </a>
                    </h2>
                  </div>
                  <div class="col-md-12">
                    <span class="ptb-news__description">
                      <a href="${viewURL}" class="ptb-link ptb-link--summary">
                        ${title_description}
                      </a>
                    </span>
                  </div>

                  <#assign categoryIds = curEntry.getCategoryIds() >

                  <@get_not_segmented_categories categoryIdsContext=categoryIds />

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </#list>
  </#if>

</div>
