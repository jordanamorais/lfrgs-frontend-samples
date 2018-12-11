## ADTs

These are some common used ADTs for Asset Publishers:

### For Asset Publishers

* [List items](examples/asset-publisher-list.ftl)
* [List with download asset link](examples/asset-publisher-list-with-download.ftl)
* [List with "view in context" render setting](examples/asset-publisher-list-view-in-context.ftl)
* [Carousel Hero Banner](examples/asset-publisher-home-carousel.ftl)
* [List with Liferay Link to Page (mounting friendly URL)](examples/asset-publisher-list-with-liferay-link-to-page.ftl)
* [Cards with link to page and bootstrap grid system](examples/asset-publisher-service-cards.ftl)
* [Blog entries with image, title, publish date and subtitle](examples/asset-publisher-with-blog-entries.ftl)

### For Navigation

* [Navigation ADT with active page](examples/site-navigation.ftl)
* [Footer Navigation ADT](examnples/footer-site-navigation.ftl)

> FYI: [Here](https://github.com/liferay/liferay-portal/tree/master/modules/apps/site-navigation/site-navigation-menu-web/src/main/resources/com/liferay/site/navigation/menu/web/portlet/template/dependencies) you can find some default ADTs currently available on Liferay Portal in order to build your own ADTs for Navigation portlet.

### For Language Selector

#### Liferay 7.1
* [Language selector with select + globe icon](examples/language-selector-select-with-icon.ftl)

--- 

### Tips

#### Create a view in context Page | Liferay 7.0

* Create a page
* Select this page as a "Content display page""
* When you are creating the web content, select this Page for it.

#### Create a view in context Page | Liferay 7.1

* Select "View in context" in your Asset Publisher configuration
* Create a page, add the portlet application (Ex: Blogs)
* If your Asset Publisher is configured to show Blog Entries assets, the magic happens. Your blog entry will redirect to your /blogs page where the Blos Widget is in.
