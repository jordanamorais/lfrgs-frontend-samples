<#list entries as entry>
  <#assign assetRenderer = entry.getAssetRenderer() />
  <#assign article = renderer.getArticle() />
  <#assign articleDDMStructure = article.getDDMStructure() />
  <#assign specificRadioField = articleDDMStructure.getDDMFormField('FIELD-NAME-HERE') />
  <#assign specificRadioFieldLabel = specificRadioField.getLabel().getString(locale) />
</#list>
