<#if is_signed_in>
    <a class="btn btn-primary" href="${sign_out_url}">
        ${sign_out_text}
    </a>
<#else>
    <a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">
        ${sign_in_text}
    </a>
<#if>