## Themes

### Theme Boilerplates

* [AngularJS theme example](https://github.com/clovisdasilvaneto/Liferay-AngularJs-Theme)

### Theme Tips and Tricks

#### Creating a theme

##### Installing Gulp and Yeoman

```javascript
sudo npm install -g yo gulp
```

##### Installing `liferay-theme` tasks

```javascript
sudo npm install -g generator-liferay-theme
```

##### Theme with Bootstrap + Lexicon/Clay (Styled theme)

> This is the default base theme, when you execute yeoman for the first time to create a theme.

```javascript
gulp extend // than select 'styled' theme
```

##### Theme with pure Bootstrap 3 (Unstyled theme)

```javascript
gulp extend // than select 'unstyled' theme
```

##### Theme with Bootstrap + Lexicon/Clay + Atlas Theme

> Atlas theme override some settings of Lexicon and Bootstrap. So: Atlas > Lexicon > Bootstrap.

```javascript
gulp kickstart
```

##### Know which base theme you are using

```javascript
gulp status
```

##### Set the bundle which theme will be deployed

```javascript
gulp init
```

> This will override the `liferay-theme.json` of your theme.


#### Embed Liferay portlets in theme

> Typically these codes are embeded inside _portal-normal.ftl_ or other theme ftls inside _templates_ theme folder.

* [Embed Search Portlet](examples/embed-search-portlet.ftl)
* [Embed Breadcrumb Portlet](examples/embed-breadcrumb-portlet.ftl)
* [Embed User Toolbar](examples/embed-user-toolbar.ftl)

#### Embed a Custom Portlet in theme

* [Embed a custom portlet in theme](examples/embed-custom-portlet.ftl)

#### Utilities

* [User actionbar example getting user portrait url and portal logout](examples/user-actionbar-with-user-portrait.ftl)

#### SCSS Linter

A pre-configured SCSS Linter file to improve your SCSS writing with good practices.
Just copy and paste the `scss-lint.yml` file into your theme root folder.

> FYI: You need to install the [scss-lint](https://github.com/brigade/scss-lint).

##### Installing SCSS linter on VSCode

* Install *scss-lint* Extension.
* Install the *required ruby gem*:

```bash
sudo gem install -n /usr/local/bin sass_lint
```

