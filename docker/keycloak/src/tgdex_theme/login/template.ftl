<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>TGDeX | Telangana Data ExChange</title>
    <link rel="icon" href="${url.resourcesPath}/img/fav_icon.png" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">

<div class="site-header">
    <div class="top-section">
        DEPARTMENT OF INFORMATION TECHNOLOGY, ELECTRONICS AND COMMUNICATIONS
    </div>

   <div class="navbar m-0 p-0">
 <div class="navbar-content">
    <div class="header-wrapper col-md-6 col-lg-6 col-xl-6 d-flex justify-content-between align-items-center">
        <div class="brand-container">
            <a href="https://tgdex.telangana.gov.in" class="title d-md-block d-none">
                <img src="${url.resourcesPath}/img/Horizontal_Green.svg" alt="Logo" class="header-logo">
            </a>
            <a href="https://tgdex.telangana.gov.in" class="title d-block d-md-none">
                <img src="${url.resourcesPath}/img/Logo Unit_Green.svg" alt="Logo" class="header-logo">
            </a>


        </div>
        <button class="menu-toggle d-block d-lg-none ms-auto" id="menuToggle" aria-expanded="false">
            <span class="toggle-text">Menu ⋮</span>
        </button>
    </div>

    <nav class="nav-menu d-none d-lg-flex col-md-6 col-lg-6 col-xl-6 justify-content-end" id="navMenu">
            <ul class="nav-list">
                <li class="nav-item"><a href="https://tgdex.telangana.gov.in/about-us">ABOUT TGDeX</a></li>
                <li class="nav-item"><a href="https://tgdex.telangana.gov.in/data-bank">DATA BANKS</a></li>
                <li class="nav-item"><a href="https://tgdex.telangana.gov.in/ai-model">AI MODELS</a></li>
                <li class="nav-item"><a href="https://tgdex.telangana.gov.in/potential-application">USE CASES</a></li>
                <li class="nav-item"><a  href="https://tgdex.telangana.gov.in/sandbox">SANDBOX IDE</a></li>
                <li class="nav-item divider d-none d-xl-block"></li>
            </ul>
        </nav>
</div>
<div class="divider d-block d-md-none"> </div>

        
    </div>
</div>

</div>

<div class="divider d-md-block d-none"> </div>

<div class="${properties.kcLoginClass!}">
    <div id="kc-header" class="${properties.kcHeaderClass!}">
        <div id="kc-header-wrapper"
             class="${properties.kcHeaderWrapperClass!}">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</div>
    </div>
    <div id='custom-card-pf' class="${properties.kcFormCardClass!}">
        <header class="${properties.kcFormHeaderClass!}">
            <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                <div class="${properties.kcLocaleMainClass!}" id="kc-locale">
                    <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                        <div id="kc-locale-dropdown" class="${properties.kcLocaleDropDownClass!}">
                            <a href="#" id="kc-current-locale-link">${locale.current}</a>
                            <ul class="${properties.kcLocaleListClass!}">
                                <#list locale.supported as l>
                                    <li class="${properties.kcLocaleListItemClass!}">
                                        <a class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </div>
                </div>
            </#if>
        <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">

                    <div>
                        <h1 id="kc-page-title"><#nested "header"></h1>
                    </div>
                </div>
            <#else>
                <h1 id="kc-page-title"><#nested "header"></h1>
            </#if>
        <#else>
            <#if displayRequiredFields>
                <div class="${properties.kcContentWrapperClass!}">
                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                    </div>
                    <div class="col-md-10">
                        <#nested "show-username">
                        <div id="kc-username" class="${properties.kcFormGroupClass!}">

                        </div>
                    </div>
                </div>
            <#else>
                <#nested "show-username">
                <div id="kc-username" class="${properties.kcFormGroupClass!}">
                 <h1><h1>
                    <a id="reset-login" href="${url.loginRestartFlowUrl}">

                    </a>
                </div>
            </#if>
        </#if>
      </header>
      <div id="kc-content">
        <div id="custom-kc-content-wrapper">

          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
          <#-- during login.                                                                               -->
          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="mt-3 d-flex justify-content-center alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                  <div class="pf-c-alert__icon">
                      <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                      <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                      <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                      <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                  </div>
                      <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
              </div>
          </#if>

          <#nested "form">

            <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <input type="hidden" name="tryAnotherWay" value="on"/>
                        <a href="#" id="try-another-way"
                           onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                    </div>
                </form>
            </#if>

          <#if displayInfo>
              <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                      <#nested "info">
                  </div>
              </div>
          </#if>
        </div>
      </div>

    </div>
  </div>
 <script>
document.addEventListener('DOMContentLoaded', function() {
    const menuToggle = document.getElementById('menuToggle');
    const navMenu = document.getElementById('navMenu');

    // Initially hide menu on mobile
    if (window.innerWidth < 992) {
        navMenu.classList.add('d-none');
    }

    menuToggle.addEventListener('click', function() {
        const isExpanded = this.getAttribute('aria-expanded') === 'true';
        this.setAttribute('aria-expanded', !isExpanded);

        if (isExpanded) {
            navMenu.classList.add('d-none');
            navMenu.classList.remove('d-block');
        } else {
            navMenu.classList.remove('d-none');
            navMenu.classList.add('d-block');
        }
    });

    // Handle window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth >= 992) {
            navMenu.classList.remove('d-none', 'd-block');
            navMenu.classList.add('d-lg-flex');
        } else {
            if (menuToggle.getAttribute('aria-expanded') === 'false') {
                navMenu.classList.add('d-none');
                navMenu.classList.remove('d-block');
            }
        }
    });
     // Close menu when clicking outside
    document.addEventListener('click', function(event) {
        if (!navMenu.contains(event.target) && !menuToggle.contains(event.target)) {
            menuToggle.setAttribute('aria-expanded', 'false');
            if (window.innerWidth < 992) {
                navMenu.classList.add('d-none');
                navMenu.classList.remove('d-block');
            }
        }
    });
});
</script>
</body>
</html>
</#macro>
