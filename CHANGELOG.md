## [4.0.1] - 2025-04-07
* Add: support for latest flutter version `3.29.2`
* Change: opacity to withValues for color to avoid linter warnings

* [4.0.0] - 2024-05-22
* Add: support for latest flutter version `3.22.0`
* Update: environment sdk and flutter
* Update: flutter lints
* Update: example
* Update: LICENSE

## [3.1.0] - 2021-03-04
* Change: example app name
* Update: environment sdk and flutter
* Migrate: to android v2 embedding
* Add: flutter lints and analysis options
* Update: LICENSE

## [3.0.0] - 2021-06-21

# Breaking changes:-
    * Remove: ImageBlur widget
    * Remove: Frost Widget
    * Remove: Animated blur (due to not fully customizable)

* Add: new extension of Blur as BlurExtension on Widget as blurred
* Add: new extension of Blur as FrostExtension on Widget as frosted
* Update: example to null safety and it's code according to new extension added
* Change: example cat asset extension from .webp to .png for iOS

## [2.0.0] - 2021-03-17

* migrate to null safety.

## [1.0.1] - 2020-11-02

* Add: `padding` property to `Frost` widget.
* Add: `Frost.text` which takes string as input.
* Add: `Frost.icon` which takes iconData as input.

## [1.0.0] - 2020-11-02

* Breaking: The `borderRadius` datatype has changed from `double` to `BorderRadius`.
* Add: `height` and `width` properties to `ImageBlur.asset` and `ImageBlur.network`.
* Add: `Frost` class which blurs the background of the child.
* Breaking: The `overlayChild` is renamed to `overlay`
* Add: `alignment` property for the overlay child.

## [0.0.1] - 2020-10-8

* Blur is a wrapper widget that blur it's child. There are ImageBlur.asset and ImageBlur.network that blur the image.