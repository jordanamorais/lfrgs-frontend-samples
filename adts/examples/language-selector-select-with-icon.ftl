
<#--  SCSS to put in yout theme -->
// Language selector UI clay adjust
// --
.myproject-language-selector {

  align-items: center;
  display: flex;

  .myproject-icon {
    padding-right: 12px;
    color: #FFF;
  }

  // Globe icon
  .myproject-icon {
    font-family: 'fontawesome-alloy';
    padding-right: 12px;

    &::before {
      content: "\f0ac";
    }
  }

  .form-group {
    margin-bottom: 0;
  }

  select.form-control:not([multiple]):not([size]) {
    background: inherit;
    border: 0;
    color: $white;
    padding: 0;
  }
}

.accessibility__language {
  .myproject-language-selector {
    .myproject-icon {
      color: inherit;
    }
  }

  select.form-control:not([multiple]):not([size]) {
    color: inherit;
  }
}


<#--  ADT  -->
<#if entries?has_content>
	<#assign languageId = localeUtil.toLanguageId(locale) />
  <style>

    .taglib-language-option {
      background: none no-repeat 5px center;
      padding-left: 25px;
    }

    <#list entries as entry>

    .taglib-language-option-${entry.getW3cLanguageId()} {
      background-image: url(${themeDisplay.getPathThemeImages()}/language/${entry.getLanguageId()}.png);
    }

    </#list>
  </style>
  <div class="myproject-language-selector">
    <span class="myproject-icon icon icon-globle"></span>
    <@liferay_aui["form"] action=formAction method="post" name='${namespace + formName}' useNamespace=false >
    <@liferay_aui["select"] changesContext=true id='${namespace + formName}' label="" name='${name}' onChange='${namespace + "changeLanguage();"}' title="language" >

    <#list entries as entry>
    <@liferay_aui["option"] cssClass="taglib-language-option taglib-language-option-${entry.getW3cLanguageId()}" disabled=entry.isDisabled() label=entry.getLongDisplayName() lang=entry.getW3cLanguageId() selected=entry.isSelected() value=entry.getLanguageId() />
    </#list> </@> </@> <@liferay_aui["script"]> function ${namespace}changeLanguage() { var languageId = AUI.$(document.${namespace + formName}.${name}).val(); submitForm(document.${namespace + formName}); } </@>
  </div>
</#if>
