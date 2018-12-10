<#--
Application display templates can be used to modify the look of a
specific application.
Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->
<#macro asset_entries_include assetEntryContext>
    <#assign

      <#--  Get access to the journal article context and content  -->
      renderer = assetEntryContext.getAssetRenderer()
      journalArticle = renderer.getArticle()
      document = saxReaderUtil.read(journalArticle.getContent())
      rootElement = document.getRootElement()

      <#--  Get custom web content structure fields  -->
      xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='servicePageLink']")
      servicePageLink = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim

      xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='textoComplementar']")
      textoComplementar = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim

      <#--  Get entry categories list-->
      entryCategories = assetEntryContext.getCategories()
    />

    <#--  To get the context of viewUrl in order to open on configured content display page  -->
    <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, assetEntryContext) />

    <#if assetLinkBehavior != "showFullContent">
      <#assign viewURL = renderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
    </#if>

    <#if servicePageLink?? && servicePageLink!="">
          <#list rootElement.elements() as dynamicElement>
              <#if "servicePageLink" == dynamicElement.attributeValue("name")>
                  <#assign getURL = dynamicElement.element("dynamic-content").getData() />

                  <#-- split the string to just get the page layout id , groupID and if its a private layout-->
                  <#list servicePageLink?split("@") as item>
                      <#if item_index == 0>
                          <#assign linkPageId = item>
                      </#if>
                      <#if item_index == 1>
                          <#if item == "private">
                              <#assign linkPrivate = true>
                          <#else>
                              <#assign linkPrivate = false>
                          </#if>
                      </#if>
                      <#if item_index = 2>
                          <#assign linkGroupId = item>
                      </#if>
                  </#list>

                  <#-- get layout -->
                  <#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService")>
                  <#assign pageLayout = layoutLocalService.getLayout(getterUtil.getLong(linkGroupId), linkPrivate, getterUtil.getLong(linkPageId))>

                  <#-- get Friendly URL -->
                  <#assign portalUtil = serviceLocator.findService("com.liferay.portal.kernel.util.PortalUtil")>
                  <#assign friendly_page_link = portalUtil.getLayoutFriendlyURL(pageLayout, themeDisplay)>

              </#if>
          </#list>
    </#if>

</#macro>

<#if entries?has_content>
    <div class="funcesp-service-cards">
        <div class="row">
            <#list entries as curEntry>

                <@asset_entries_include assetEntryContext=curEntry />

                <div class="col-md-4">
                    <div class="funcesp-service-card card">
                        <div class="row">
                            <div class="col-md-2">
                                <span class="funcesp-service-card__type-of-service"> <span class="fa icon-user"></span> </span>
                            </div>

                            <div class="col-md-10">
                                 <div class="funcesp-service-card__header">
                                    <ul class="funcesp-service-card__categories">
                                        <li>
                                            <span class="text-bold">
                                                <#if textoComplementar??>
                                                    ${textoComplementar}
                                                </#if>
                                            </span>
                                        </sli>
                                    </ul>
                                </div>
                                <div class="funcesp-service-card__content">
                                    <h3 class="funcesp-service-card__title">${curEntry.getTitle(locale)}</h3>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="funcesp-service-card__footer">
                                    <a href="${friendly_page_link}" class="funcesp-btn btn btn-primary btn-sm"> Acessar os serviços </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </div>
</#if>
