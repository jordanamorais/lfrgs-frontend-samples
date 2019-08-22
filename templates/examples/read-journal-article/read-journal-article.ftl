<#assign
    journalArticleService  = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")
    assetVocabularyService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetVocabularyLocalService")
    categoryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryLocalService")
    vocabularies = assetVocabularyService.getGroupVocabularies(themeDisplay.getScopeGroupId())
    tagsLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetTagLocalService")
/>

<#assign articleId = .vars['reserved-article-id'].data >
<#assign groupId = themeDisplay.getScopeGroupId()>
<#assign journalArticle = journalArticleService.getArticle(getterUtil.getLong(groupId), articleId) >
<#assign articlePrimKey = journalArticle.getResourcePrimKey() >

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

                  <#assign category = categoryLocalService.getCategory(categoryId) >

                  <div class="ptb-news__categories">
                    <span class="label ptb-label label-default my-0">
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

<div class="ptb-news__read-news">
  <div class="ptb-news__read-news-post col-md-12 mt-2">

    <div class="row">

      <div class="ptb-news__read-title-header">

        <a class="ptb-news__read-back ptb-link ptb-link--back" href="javascript:history.go(-1)">
          <span class="icon icon-arrow-left"></span>
        </a>

        <h1>${.vars['reserved-article-title'].data}</h1>

        <div class="d-block my-3">
          <i class="ptb-news__publish-date">
              <#assign publishDate = journalArticle.getCreateDate()>
              Publicado em: ${publishDate?datetime?string("dd/MM/yyyy HH:MM")}
          </i>
        </div>

        <div class="d-flex align-items-center">

          <#assign tags = tagsLocalService.getTags("com.liferay.journal.model.JournalArticle", getterUtil.getLong(articlePrimKey)) >

          <#assign categoryIds = categoryLocalService.getCategoryIds("com.liferay.journal.model.JournalArticle", getterUtil.getLong(articlePrimKey)) >

          <@get_not_segmented_categories categoryIdsContext=categoryIds />

          <#if tags?has_content>

            <span class="ptb-separator"></span>

            <#list tags as tag>
              <div class="ptb-news__tags">
                <span class="label ptb-label ptb-label--tag label-default my-0">
                  ${tag.name}
                </span>
              </div>
            </#list>
          </#if>
        </div>

      </div>

      <div class="ptb-news__read-content">
        <p>
          ${newsContent.getData()}
        </p>
      </div>
    </div>

  </div>
</div>
