## Developer Mode Properties and Cache Issues

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