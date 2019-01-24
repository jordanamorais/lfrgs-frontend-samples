<#--  Add this to your init_custom.ftl file in theme  -->
<#assign user_portrait_url = user.getPortraitURL(themeDisplay)/>
<#assign portal_url = portalUtil.getPortalURL(themeDisplay) />

<#-- CSS - Put this CSS in your SCSS files, like a _user-actionbar.scss partial sass file -->
// User actionbar
// --
.usr-actionbar {

  align-self: center;

  img {
    @include simple-animate;

    box-shadow: 0 1px 4px 0 rgba(0,0,0,0.19), 0 0 0 5px rgba(255,255,255,0.25);
    width: 32px;
  }

  .dropdown-menu {
    padding: 15px;
  }

  .dropdown-menu-right {
    right: 0;
    left: auto;
    right: 0;
    left: auto;
    border: none;
    box-shadow: 0 2px 13px 3px rgba(70, 70, 70, 0.2);
  }

  &.show {

    img {
      box-shadow: 0 1px 4px 0 rgba(0,0,0,0.19), 0 0 0 10px rgba(255,255,255,0.37);
    }
  }
}

.usr-actionbar__btn {
  position: relative;
  top: -4px;

  &:hover {

    text-decoration: none;

    img {
      box-shadow: 0 1px 4px 0 rgba(0,0,0,0.19), 0 0 0 10px rgba(255,255,255,0.37);
    }
  }
}

.usr-actionbar__arrow {
  margin-left: 6px;
  color: #FFF;
  position: relative;
  top: 2px;
  font-size: 12px;
  background: rgba(255, 255, 255, 0.25);
  border-radius: 50%;
  padding: 3px;
}

<#--  Add this in a separate file, like "user_actionbar.ftl", in theme templates folder.  -->
<#if is_signed_in>
  <div class="usr-actionbar dropdown pull-right">
      <button class="usr-actionbar__btn btn btn-link dropdown-toggle" data-toggle="dropdown" type="button">
        <img class="user-portrait img-circle" src="${user_portrait_url}" alt="User Portrait">
        <span class="usr-actionbar__arrow icon icon-chevron-down"></span>
      </button>

      <div class="dropdown-menu dropdown-menu-right">
          ${user_greeting}

          <hr/>
          <a class="btn btn-primary top-gap" href="${sign_out_url}">
              ${sign_out_text}
          </a>
      </div>
  </div>
<#else>
  <a class="${prefix}-header__sign-in" data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">
    ${sign_in_text}
    <span class="visible-xs icon icon-signin"></span>
  </a>
</#if>
