<#if entries?has_content>
    <div class="uj-wrap">
        <h3>
            Servicios

            <a href="#" class="btn btn-xs btn-default"> Todos los servicios</a>
        </h3>

        <div class="uj-slider js-slider-multiple">
            <#list entries as curEntry>
                <#assign renderer = curEntry.getAssetRenderer()>
                <#assign journalArticle = renderer.getArticle()>
                <#assign document = saxReaderUtil.read(journalArticle.getContent())>
                <#assign rootElement = document.getRootElement()>
                <#assign xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='enlaceExterno']")>
                <#--  Trim is needed to avoid blank spaces when the field is empty  -->
                <#assign enlaceExterno = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim>
                <#assign xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='enlacePaginaPortal']")>
                <#assign enlacePaginaPortal = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim>

                <#if enlacePaginaPortal?? && enlacePaginaPortal!="">
                    
                    <#list rootElement.elements() as dynamicElement>
                        <#if "enlacePaginaPortal" == dynamicElement.attributeValue("name")>
                            <#assign getURL = dynamicElement.element("dynamic-content").getData() />

                            <#-- split the string to just get the page layout id , groupID and if its a private layout-->
                            <#list enlacePaginaPortal?split("@") as item>
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
                            <#assign layoutLocalService = staticUtil["com.liferay.portal.kernel.service.LayoutLocalServiceUtil"]>
                            <#assign pageLayout = layoutLocalService.getLayout(getterUtil.getLong(linkGroupId), linkPrivate, getterUtil.getLong(linkPageId))>

                            <#-- get Friendly URL -->
                            <#assign portalUtil = staticUtil["com.liferay.portal.kernel.util.PortalUtil"]>
                            <#assign friendly_page_link = portalUtil.getLayoutFriendlyURL(pageLayout, themeDisplay)>

                        </#if>
                    </#list>
   
                </#if>

                <div class="uj-card">

                    <#if enlaceExterno?? && enlaceExterno!="">
                        <a href="${enlaceExterno}">
                            <h4 class="uj-card__title">
                                ${curEntry.getTitle(locale)}
                            </h4>
                            <p class="uj-card__description">
                                ${curEntry.getSummary(locale)}
                            </p>
                        </a>
                    <#else>
                        <a href="${friendly_page_link}">
                            <h4 class="uj-card__title">
                                ${curEntry.getTitle(locale)}
                            </h4>
                            <p class="uj-card__description">
                                ${curEntry.getSummary(locale)}
                            </p>
                        </a>
                    </#if>
                </div>

            </#list>
        </div>
    </div>
</#if>
