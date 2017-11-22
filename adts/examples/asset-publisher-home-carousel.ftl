<#--  Carousel plugin used: http://kenwheeler.github.io/slick/  -->

<#if entries?has_content>
    <div class="uj-slider uj-hero js-slider-full">
        <#list entries as curEntry>
            <#assign renderer = curEntry.getAssetRenderer()>
            <#assign journalArticle = renderer.getArticle()>
            <#assign document = saxReaderUtil.read(journalArticle.getContent())>
            <#assign rootElement = document.getRootElement()>
            <#assign xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='imagen']")>
            <#assign imagen = xPathSelector.selectSingleNode(rootElement).getStringValue()>
            <#assign xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='enlaceExterno']")>
            <#--  Trim is needed to avoid blank spaces when the filed is empty  -->
            <#assign enlaceExterno = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim>
            <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />

            <div class="uj-slider__item">
                <img src="${imagen}" alt="">

                <div class="uj-slider-item__info uj-wrap">
                    <h2 class="uj-slider-item__title">
                        ${curEntry.getTitle(locale)}
                    </h2>
                    <p class="uj-slider-item__description">
                        ${curEntry.getSummary(locale)}
                    </p>

                    <#if enlaceExterno?? && enlaceExterno!="">
                        <a class="btn btn-default btn-inverse" href="${enlaceExterno}" target="_blank">
                            sepa mas
                        </a>
                    <#else>
                        <#--  in order to open on configured content display page  -->
                        <#if assetLinkBehavior != "showFullContent">
                            <#assign viewURL = renderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />
                        </#if>
                        <a class="btn btn-default btn-inverse" href="${viewURL}">
                            sepa mas
                        </a>
                    </#if>
                </div>
            </div>
        </#list>
    </div>
</#if>