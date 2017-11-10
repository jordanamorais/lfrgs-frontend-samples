## Themes

* [Theme Boilerplates](#theme-boilerplates)
* [Creating a theme](#creating-a-theme)
    * [Installing Gulp and Yeoman](#installing-gulp-and-yeoman)
    * [Installing liferay-theme tasks](#installing-liferay-theme-tasks)
    * [Styled theme](#styled-theme)
    * [Unstyled theme](#unstyled-theme)
    * [Atlas theme](#atlas-theme)
    * [Know which base theme you are using](#know-which-base-theme-you-are-using)
    * [Set the bundle which theme will be deployed](#set-the-bundle-which-theme-will-be-deployed)
* [Embed Liferay portlets in theme](#embed-liferay-portlets-in-theme)
* [Embed a Custom Portlet in theme](#embed-a-custom-portlet-in-theme)
* [FTL Utilities](#utilities)
* [Developer Mode Properties and Cache Issues](#developer-mode-properties-and-cache-issues)
* [SCSS Linter](#scss-linter)
    * [Installing SCSS linter on VSCode](#installing-scss-linter-on-vscode)

---

### Theme Boilerplates

* [AngularJS theme example](https://github.com/clovisdasilvaneto/Liferay-AngularJs-Theme)

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

### Embed Liferay portlets in theme

> Typically these codes are embeded inside _portal-normal.ftl_ or other theme ftls inside _templates_ theme folder.

* [Embed Search Portlet](examples/embed-search-portlet.ftl)
* [Embed Breadcrumb Portlet](examples/embed-breadcrumb-portlet.ftl)
* [Embed User Toolbar](examples/embed-user-toolbar.ftl)

### Embed a Custom Portlet in theme

* [Embed a custom portlet in theme](examples/embed-custom-portlet.ftl)

### FTL Utilities

* [User actionbar example getting user portrait url and portal logout](examples/user-actionbar-with-user-portrait.ftl)
* [Sign-in and sign-out](examples/signin-and-signout.ftl)


### Developer Mode Properties and Cache Issues

This is a list of the most used properties to Develop without cache issues. You can see the list of all Portal Properties [here](https://docs.liferay.com/portal/7.0/propertiesdoc/portal.properties.html).

> FYI: You must have your own `portal-developer.properties` and `portal-ext.properties` in your Liferay Home Bundle dir in order to override the portal default properties and enable Developer Mode.


* Disable CSS and JS Cache

```java
minifier.enabled=false
```

* Disable CSS combined and loaded as a single file (for easier debugging)

```java
theme.css.fast.load=false
```

* Disable Layout Template Cache

```java
layout.template.cache.enabled=false
```

* Disable open a browser when server starts

```java
browser.launcher.url=
```

* Disable packed version of JS files (for easier debugging)

```java
javascript.fast.load=true
```

* Enable SPA (Single Page Application mode)

```java
javascript.single.page.application.enabled=true
```


### SCSS Linter

A pre-configured SCSS Linter file to improve your SCSS writing with good practices.
Just copy and paste the `scss-lint.yml` file into your theme root folder.

> FYI: You need to install the [scss-lint](https://github.com/brigade/scss-lint).

#### Installing SCSS linter on VSCode

* Install *scss-lint* Extension.
* Install the *required ruby gem*:

```bash
sudo gem install -n /usr/local/bin sass_lint
```

