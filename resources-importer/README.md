## Resources Importer Tips

The resources importer is configured in **WEB-INF > src > resources-importer** theme folder.

* [Enable or Disable resources importer](#enable-or-disable-resources-importer)
* [Configuring resources-importer to work as Site Template or Site](#configuring-resources-importer-to-work-as-site-template-or-site)
* [Configuring pages, portlets and its settings](#configuring-pages-portlets-and-its-settings)

## Enable or Disable resources importer

The `liferay-plugin-package.properties` on theme, is the file where you configure the resources-importer settings.

To **enable** resources-importer on theme, set the respective property to `true`:

```properties
resources-importer-developer-mode-enabled=true
```

To **disable**, set this to `false`.

## Configuring resources-importer to work as Site Template or Site

### As Site Template

Enabling the resources-importer property above, you are configuring the resources-importer to work as **Site Template** approach. This is the best way according to Liferay Official Documentation once resources-importer override the entire content, settings and pages.

To set the name of the Site Template, configure the following property in `liferay-plugin-package.properties` file:

```properties
resources-importer-target-value=Your Site Template Name
```

### As Site

In order to configure resources-importer as Site, add/edit the following properties in `liferay-plugin-package.properties` file:

> WARNING: This is not the best way according to the Official Documentation.

> Enable resources-importer
```properties
resources-importer-developer-mode-enabled=true
```

> Set the site name
```properties
resources-importer-target-value=Your Site Name
```
**FYI:** If the site name already exists, this site will be overridden when the theme is deployed.

> Now, enabling resources-importer to work as Site approach
```properties
resources-importer-target-class-name=com.liferay.portal.kernel.model.Group
```

## Configuring pages, portlets and its settings

In the `sitemap.json` file you configure which Pages the site will have and the configuration (layout template, portlets and its settings) for each page in order to resources-importer create them.

For more details how to configure the `sitemap.json` file or how to import assets, check the [Liferay 7 - Resources-importer Official Documentation Page](https://dev.liferay.com/pt/develop/tutorials/-/knowledge_base/7-0/importing-resources-with-a-theme)