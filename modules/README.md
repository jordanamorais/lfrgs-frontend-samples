## Modules

* [Custom modules samples](#custom-modules-samples)
* [OSGi Modules Tips](#osgi-modules-tips)
    * [Creating a module fragment that overrides another module](#creating-a-module-fragment-that-overrides-another-module)
* [Useful telnet and gogo shell commands](#useful-telnet-and-gogo-shell-commands)

---

### Custom modules samples

* [AngularJS module with multiple views](https://github.com/rafoli/liferay-gs/tree/master/modules/liferay-bundle-angular-example-multiple-views-web)

### OSGi Modules Tips

#### Creating a module fragment that overrides another module

For example, if you need to change the UI of search container list on *Search Portlet* Page.

* In _Liferay Developer Studio_ File > New > Liferay Module Project.
* Insert the name of module according to its purpose.
* You can select the _Project Template Name_ as *activator*, then Finish.
* Open `bnd.bnd` file.
* Remove the first line of bnd file.
* To override another existing portlet you need to add this line:

```
Fragment-Host: com.liferay.portal.search.web;bundle-version="1.2.5"
```
where `com.liferay.portal.search.web` is the _Bundle-SymbolicName_ of the portlet which I want to override and `bundle-version` is the Bundle Version of this portlet too. You can see this detailed information in portlet manifest.

> For how to discover the portlet symbolic name, check the [useful telnet and gogo shell commands](#useful-telnet-and-gogo-shell-commands) section.

* To override the _JSP_ file you want, put a copy of the original JSP file inside `src > main > resources > META-INF > resources`.
* Start to work in your custom file.

> *Good Practice Hint* : When we're overriding Liferay code, it would be good to indicate that we are customizing it. We can add comments around our custom code formatted in the following ways:

```
JSP: <%-- CUSTOM BEGIN --%> <%--CUSTOM END --%>
JS: /* CUSTOM BEGIN */ /* CUSTOM END*/
Java: // CUSTOM BEGIN // CUSTOM END
```

### Useful telnet and gogo shell commands

* To connect telnet with your local bundle so you can use gogo shell.

```js
telnet localhost 11311
```

* To see the list of available modules with your current lifecycle status

```js
lb
```

* To see the modules manifesto file (where you can see the symbolic name, bundle vertion etc)

```js
headers <module's id number>
```

* To find modules with a specific keyword

```js
lb <keyword> // ex: lb search
```

* To stop some module

```js
stop <module's id number>
```

* To uninstall module

```js
uninstall <module's id number>
```

* To verify problems with some module

```js
diag <module's id number>
```
