## Templates

These are some useful content templates to use in your projects:

* [Page Title](examples/page-title-template.ftl) - Set a unique markup to your page titles in order to maintain only one file for all headers of your site.
* [Repeatible Field](examples/repeatible-field.ftl) - A template that lists a repeatible field and gets its children inputs.
* [Webcontent Freemarker variables](examples/freemarker-webcontent-variables.txt) - A list of available variables which can be used in Freemarker Web Content Templates (Not ADT).
* [Global site Videos Template](examples/global-videos-template/) - A sample of video preview and videos list, where user can add youtube embeded links and/or videos uploaded at Liferay Documents and Media.

> NOTE: Liferay 6.2 Freemarker doesn't like variables with dashes (hyphens) in them like reserved-article-title, so you have to use this way: `${.vars['reserved-article-title'].data}`.

---
