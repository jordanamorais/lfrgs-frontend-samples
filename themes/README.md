## Themes and Freemarker

> Themes

* [Theme Boilerplates](#theme-boilerplates)
* [Creating a theme](#creating-a-theme)
    * [Installing Gulp and Yeoman](#installing-gulp-and-yeoman)
    * [Installing liferay-theme tasks](#installing-liferay-theme-tasks)
    * [Styled theme](#styled-theme)
    * [Unstyled theme](#unstyled-theme)
    * [Atlas theme](#atlas-theme)
    * [Know which base theme you are using](#know-which-base-theme-you-are-using)
    * [Set the bundle which theme will be deployed](#set-the-bundle-which-theme-will-be-deployed)
* [Gulp Utilities](#gulp-utilities)
    * [Configuring theme deploy to Nexus](#configuring-theme-deploy-to-nexus)
* [Embed Liferay portlets in theme](#embed-liferay-portlets-in-theme)
* [Embed a Custom Portlet in theme](#embed-a-custom-portlet-in-theme)
* [Theme Settings](#theme-settings)
* [JS Theme Utilities](#js-theme-utilities)
* [SCSS Linter](#scss-linter)
    * [Installing SCSS linter on VSCode](#installing-scss-linter-on-vscode)
 

> Freemarker

* [Freemarker Samples](#freemarker-samples)
* [Freemarker useful variables](#freemarker-useful-variables)
* [Language in Freemarker](#language-in-freemarker)

---

### Theme Boilerplates

* [AngularJS theme example](https://github.com/clovisdasilvaneto/Liferay-AngularJs-Theme)

---

### Creating a theme

#### Installing Gulp and Yeoman

```js
sudo npm install -g yo gulp
```

#### Installing liferay-theme tasks

```js
sudo npm install -g generator-liferay-theme
```

#### Styled theme

> This is the default base theme, when you execute yeoman for the first time to create a theme.

```js
yo  // then, select Liferay Theme and follow the steps.
```

> This theme contains Bootstrap + Lexicon/Clay.

```js
gulp extend // then select 'styled' theme
```

#### Unstyled theme

> This theme contains pure Bootstrap 3.

```js
gulp extend // then select 'unstyled' theme
```

#### Atlas Theme 

> This theme contains Bootstrap + Lexicon/Clay + Atlas Theme.
> Atlas theme override some settings of Lexicon and Bootstrap. So: Atlas > Lexicon > Bootstrap.

```js
gulp kickstart
```

#### Know which base theme you are using

```js
gulp status
```

#### Set the bundle which theme will be deployed

> This will override the `liferay-theme.json` of your theme.

```js
gulp init
```

---

### Gulp Utilities

#### Configuring theme deploy to Nexus

> Install Nexus Deployer Plugin as a dependence

```js
npm install nexus-deployer --save-dev
```

> In `gulpfile.js` configure Nexus Deployer Artifact Task and its Settings

```js
var deployer = require('nexus-deployer');

gulp.task('deploy:artifacts', ['build'], function(callback) {
    var snapshot = {
        groupId: 'customer.domain.example.liferay',
        artifactId: 'themename-theme',
        version: '1.0.0',
        packaging: 'war',
        auth: {
            username:'',
            password:''
        },
        pomDir: 'dist/pom',
        url: 'http://nexus.customerurl:8081/repository/customername-releases/',
        artifact: 'dist/themename-theme.war',
        noproxy: 'localhost',
        cwd: '',
        quiet: false,
        insecure: true
    };
 
    deployer.deploy(snapshot, callback);
});
```

> To upload the artifact to Nexus, run the following task

```js
gulp deploy:artifacts
```

---

### Embed Liferay portlets in theme

> Typically these codes are embeded inside _portal-normal.ftl_ or other theme ftls inside _templates_ theme folder.

* [Embed Search Portlet](examples/embed-search-portlet.ftl)
* [Embed Breadcrumb Portlet](examples/embed-breadcrumb-portlet.ftl)
* [Embed User Toolbar](examples/embed-user-toolbar.ftl)

---

### Embed a Custom Portlet in theme

* [Embed a custom portlet in theme](examples/embed-custom-portlet.ftl)

---

### Freemarker

#### Freemarker samples

* [User actionbar example getting user portrait url and portal logout](examples/user-actionbar-with-user-portrait.ftl)
* [Sign-in and sign-out](examples/signin-and-signout.ftl)

#### Freemarker useful variables

> Get Full URL (in navigation pages)

```freemarker
${grandChild.getURL()}
```

> Get Public URL

```freemarker
${themeDisplay.getPathFriendlyURLPublic()}
```

> Get PortalURL

```freemarker
<#assign portalURL = themeDisplay.getPortalURL()>

<#-- Output -->
http://localhost:8080
```

> Get CurrentURL

```freemarker
<#assign currentURL = themeDisplay.getURLCurrent()>

<#-- Output -->
 /web/site-name
```

> Mount FullURL

```freemarker
<#assign portalCurrentURL = themeDisplay.getPortalURL() + themeDisplay.getURLCurrent()>

<#-- Output -->
http://localhost:8080/web/site-name
```

> Theme Setting trick to use with ternary operator (as boolean)

```freemarker
<#if my_theme_setting != "false">
    <#assign my_theme_setting_boolean = true>
<#else>
    <#assign my_theme_setting_boolean = false>
</#if>

<#-- So, this way you can use ternary operator -->
${my_theme_setting_boolean?then('Y' , 'N')}

<#-- For instance, to use in a href like this -->
<a href="${my_theme_setting_boolean?then(routeURLChild , childItem.getURL())}">
```

> Get User Last Login Date

```freemarker
<#assign user_last_login_date = user.getLastLoginDate()?string('dd/MM/yyyy HH:mm:ss')>

<#-- Output -->
12/03/2018 13:22:24
```

> Get Selected Portlet Decorator
```freemarker
<#assign
    portlet_display = portletDisplay
    portlet_decorator_selected = htmlUtil.escape(portlet_display.getPortletDecoratorId())
/>

<#-- Output example from ${portlet_decorator_selected} -->
list-one-column-dark
```

> FYI: You can see a full example in the following file: [Navigation with mounted URLs changing / to #](examples/navigation-mouting-urls-with-route.ftl)

#### Language in freemarker

```freemarker
<@liferay.language key="your-key-value" />
```

> FYI: You can create a **Language.properties** file in the following folder of your theme: **WEB-INF > src > content**

---

### Theme Settings

In order to understand more about theme settings, checkt out the [Liferay Theme Settings Docs](https://dev.liferay.com/develop/tutorials/-/knowledge_base/7-0/making-themes-configurable-with-settings).

#### Get checkbox theme setting as a boolean

In `liferay-look-and-feel.xml` , create the settting <setttings> as a checkbox:

```freemarker
<setting configurable="true" key="show-main-search" type="checkbox" value="true" />
```

In `WEB-INF/src/content/Language.properties` create the key value for this theme setting.

In `init_custom.ftl` file, assign the variable getting as boolean:

```freemarker
<#--  Show Search  -->
<#assign show_main_search = getterUtil.getBoolean(theme_settings["show-main-search"])>
```

To validate the variable, create somthing like this in your FTL files:

```freemarker
<#if show_main_search>
...
</#if>
```

---

### JS Theme Utilities

> Get Language keys in your JS files
```js
Liferay.Language.get("language-key")
```

---

### SCSS Linter

A pre-configured SCSS Linter file to improve your SCSS writing with good practices.
Just copy and paste the `scss-lint.yml` file into your theme root folder.

> FYI: You need to install the [scss-lint](https://github.com/brigade/scss-lint).

#### Installing SCSS linter on VSCode

* Install the *required ruby gem* below:

```bash
sudo gem install scss_lint
```

* Install *scss-lint* Extension on VSCode.
