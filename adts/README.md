## ADTs - Application Display Templates

These are some common and useful ADTs to save your life with liferay.

### Asset Publishers ADTs

* [List items](examples/asset-publisher-list.ftl)
* [List items with download asset link](examples/asset-publisher-list-with-download.ftl)
* [List items with "view in context" render setting](examples/asset-publisher-list-view-in-context.ftl)
* [Carousel Hero Banner](examples/asset-publisher-home-carousel.ftl)
* [List items with Liferay Link to Page (mounting friendly URL)](examples/asset-publisher-list-with-liferay-link-to-page.ftl)
* [Cards with link to page and bootstrap grid system](examples/asset-publisher-service-cards.ftl)
* [Blog entries with image, title, publish date and subtitle](examples/asset-publisher-with-blog-entries.ftl)
* [List items with download and preview url from documents and media field](examples/asset-publisher-list-with-url-from-documents-and-media-field.ftl)
* [Image thumbs list with categories](examples/asset-publisher-image-thumbs-list-with-categories.ftl)
* [Image thumbs list with categories for internal page](examples/asset-publisher-image-thumbs-list-internal-page.ftl)

### Navigation ADTs

* [Navigation ADT with active page](examples/site-navigation.ftl)
* [Footer Navigation ADT](examnples/footer-site-navigation.ftl)
* [Navigation ADT with active pages, children and icon](examples/navigation-with-children-and-icon.ftl)

> FYI: [Here](https://github.com/liferay/liferay-portal/tree/master/modules/apps/site-navigation/site-navigation-menu-web/src/main/resources/com/liferay/site/navigation/menu/web/portlet/template/dependencies) you can find some default ADTs currently available on Liferay Portal in order to build your own ADTs for Navigation portlet.

### Language Selector ADTs

#### Liferay 7.1
* [Language selector with select + globe icon](examples/language-selector-select-with-icon.ftl)

### Categories ADTS

* [Categories List menu](examples/categories-list-menu.ftl)

--- 

### Setup Tips

#### Create a view in context Page | Liferay 7.0

* Create a page
* Select this page as a "Content display page""
* When you are creating the web content, select this Page for it.

#### Setting up View in context rendering | Liferay 7.1

* Select "View in context" in your Asset Publisher configuration
* Create a page in your site (ex: blogs), and then add the respective widget asset application (Ex: Blogs)
* If your Asset Publisher is configured to show Blog Entries assets, the magic happens. Your blog entry will redirect to your /blogs page where the Blos Widget is in it.
