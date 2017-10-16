<#--  Add this to your init_custom.ftl file in theme  -->
<#assign user_portrait_url = user.getPortraitURL(themeDisplay)/>
<#assign portal_url = portalUtil.getPortalURL(themeDisplay) />

<#--  Add this in a separate file, like "user_actionbar.ftl", in theme templates folder.  -->
<#if is_signed_in>
    <div class="usr-actionbar dropdown">
        <button class="usr-actionbar__btn btn btn-link dropdown-toggle" data-toggle="dropdown" type="button">
            <img class="user-portrait img-circle" src="${user_portrait_url}" alt="User Portrait">
        </button>

        <div class="dropdown-menu dropdown-menu-right">
            ${user_greeting}

            <hr/>
            <a class="btn btn-primary" href="${sign_out_url}">
                ${sign_out_text}
            </a>
        </div>
    </div>
<#else>
    <a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
</#if>