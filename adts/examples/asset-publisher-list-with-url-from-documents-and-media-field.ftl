<#macro asset_entries_include assetEntryContext>
    <#assign
    
        <#--  Needed in order to get the url  -->
        dlAppService = serviceLocator.findService("com.liferay.document.library.kernel.service.DLAppService")
        dlUtil = serviceLocator.findService("com.liferay.document.library.kernel.util.DLUtil")
    
        <#--  Get access to the journal article context and content  -->
        renderer = assetEntryContext.getAssetRenderer()
        journalArticle = renderer.getArticle()
        document = saxReaderUtil.read(journalArticle.getContent())
        rootElement = document.getRootElement()
    
        <#--  Get custom web content structure fields   -->
        xPathSelectorDocument = saxReaderUtil.createXPath("dynamic-element[@name='documentoNoticia']")
        documentSrc = xPathSelectorDocument.selectSingleNode(rootElement)
    
        <#--  Get groupId and uuid -->
        jsonDataDocument =  jsonFactoryUtil.createJSONObject(documentSrc.getStringValue())
        documentGroupId =  getterUtil.getInteger(jsonDataDocument.get('groupId'))
        documentUuid =  getterUtil.getString(jsonDataDocument.get('uuid'))
    
        <#--  Get fileEntryId from the document  -->
        dlFileEntryUtil = serviceLocator.findService("com.liferay.document.library.kernel.service.DLFileEntryLocalService")
        documentFileEntry = dlFileEntryUtil.getDLFileEntryByUuidAndGroupId(documentUuid,documentGroupId)
        documentFileEntryId = documentFileEntry.getFileEntryId()
    
    />
    
    <#--  Create urlDocument  -->
    <#if documentFileEntryId?? && documentFileEntryId!=0>
        <#assign
            documentFileEntry = dlAppService.getFileEntry(documentFileEntryId)
              
            <#--  Download url  -->
            urlDocument = dlUtil.getDownloadURL(documentFileEntry, documentFileEntry.getFileVersion(), themeDisplay, null)
    
            <#--  Preview url  -->
            urlDocumentPreview = dlUtil.getPreviewURL(documentFileEntry, documentFileEntry.getFileVersion(), themeDisplay, "")
        />
    <#else>
        <#assign urlDocument = "#">
        <#assign urlDocumentPreview = "#">
    </#if>
</#macro>
    
<#if entries?has_content>
    <#list entries as curEntry>
        <@asset_entries_include assetEntryContext=curEntry />
    
        <a href="${urlDocument}">Download</a><br>
        <a href="${urlDocumentPreview}">Preview</a>

    </#list>
</#if>

