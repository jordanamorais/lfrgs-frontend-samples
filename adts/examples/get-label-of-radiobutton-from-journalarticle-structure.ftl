<#--  Ex1: Get radiobutton's label of journal article structure  -->
<#list entries as entry>

  <#assign assetRenderer = entry.getAssetRenderer()  />
  <#assign article = assetRenderer.getArticle() />
  <#assign articleDDMStructure = article.getDDMStructure() />
  <#assign specificRadioField = articleDDMStructure.getDDMFormField('FIELD-NAME-HERE') />
  <#assign specificRadioFieldLabel = specificRadioField.getLabel().getString(locale) />
  
</#list>

<#--  Ex2: Get value and label of each radiobutton of the structure -->
<#if entries?has_content>
    <#list entries as entry>
        <#assign
        dlAppService = serviceLocator.findService("com.liferay.document.library.kernel.service.DLAppService")
        dlUtil = serviceLocator.findService("com.liferay.document.library.kernel.util.DLUtil")
        
        <#--  Get access to the journal article context and content  -->
        renderer = entry.getAssetRenderer()
        journalArticle = renderer.getArticle()
        document = saxReaderUtil.read(journalArticle.getContent())
        rootElement = document.getRootElement()
        
        <#--  Get custom web content structure fields   -->
        xPathSelectorDocument = saxReaderUtil.createXPath("dynamic-element[@name='radio']")
        radioContent = xPathSelectorDocument.selectSingleNode(rootElement).getStringValue()?trim
        
        <#--  Get custom web content opiton label  -->
        articleDDMStructure = journalArticle.getDDMStructure()
        specificRadioField = articleDDMStructure.getDDMFormField('radio').getDDMFormFieldOptions()
        specificRadioFieldLabel = specificRadioField.getOptionLabels(radioContent).getString(locale) 
        />
        
        <h1>Radio Value: ${radioContent}</h1>
        <h1>Radio Label: ${specificRadioFieldLabel}</h1>
    </#list>
</#if>
