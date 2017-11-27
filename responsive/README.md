## Responsive

These are some useful links and files regarding available responsive mixins and its SASS variables.

* [Available Responsive mixins](available-mixins/responsive-cheat-sheet.scss)
* [Liferay Responsive breakpoint variables](https://github.com/liferay/com-liferay-frontend-css/blob/master/frontend-css-common/src/main/resources/META-INF/resources/liferay/_variables.scss)

---

### Tips

About the available responsive media query mixin:

> For media queries with `max-width`, use:

```sass

@include media-qiery(null, $responsive-breakpoint-variable) {
    ...
}
```

> For media querie with `min-width` (useful for mobile-first approach), use:

```sass

@include media-qiery($responsive-breakpoint-variable, null) {
    ...
}
```