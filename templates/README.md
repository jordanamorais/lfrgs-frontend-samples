## Web Content Templates

These are some useful content templates to use in your projects:

### Samples

* [Page Title](examples/page-title-template.ftl) - Set a unique markup to your page titles in order to maintain only one file for all headers of your site.
* [Repeatible Field](examples/repeatible-field.ftl) - A template that lists a repeatible field and gets its children inputs.

* [Global site Videos Template](examples/global-videos-template/) - A sample of video preview and videos list, where user can add youtube embeded links and/or videos uploaded at Liferay Documents and Media.
* [Read Journal Article](examples/read-journal-article/) - A sample of reading journal article with categories, tags, journal article content and back button.

### Available freemarker variables for web content templates

* [Availabe freemarker variables for Templates](examples/freemarker-webcontent-variables.txt) - A list of available variables which can be used in Freemarker Web Content Templates (Not ADTs).

> NOTE: Freemarker doesn't use variables with dashes (hyphens), like `reserved-article-title`, so to get the value of variable, you have to use this: `${.vars['reserved-article-title'].data}`.

> Get formatted Display Date on templates

```html
<#-- Retrieve the published date meta data field of the web content -->
<#assign displaydate = .vars['reserved-article-display-date'].data>

<#-- Save the original page locale for later -->
<#assign originalLocale = .locale>

<#-- Set the page locale to the portals default locale -->
<#setting locale = localeUtil.getDefault()>

<#-- Parse the date to a date object -->
<#assign displaydate = displaydate?datetime("EEE, d MMM yyyy HH:mm:ss Z")>

<#-- Set the page locale back to the original page locale -->
<#assign locale = originalLocale>
                                
${displaydate?string["dd/MM/yyyy"]}
```

