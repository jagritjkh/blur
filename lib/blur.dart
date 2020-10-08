library blur;

import 'dart:ui';
import 'package:flutter/material.dart';

///blur it's child
///blur is the value of blur effect, higher the blur more the blur effect (default value = 2)
///blurColor is the color of blur effect
///borderRadius is the radius of the child to be blurred (default value = 0)
///colorOpacity is the opacity of the blurColor (default value = 0.5)
///overlayChild is the widget that can be stacked over blurred widget
class Blur extends StatelessWidget {
  Blur({
    Key key,
    @required this.child,
    this.blur = 2,
    this.blurColor,
    this.borderRadius = 0,
    this.colorOpacity = 0.5,
    this.overlayChild,
  }) : super(key: key);

  final Widget child;
  final double blur;
  final Color blurColor;
  final double borderRadius;
  final double colorOpacity;
  final Widget overlayChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(borderRadius),
                  color: blurColor == null
                      ? Colors.transparent.withOpacity(colorOpacity)
                      : blurColor.withOpacity(colorOpacity),
                ),
                child: overlayChild,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///blurs the image provided to it
class ImageBlur extends StatelessWidget {
  ///acts as Image.asset
  ImageBlur.asset(
    String path, {
    Key key,
    BoxFit fit,
    double scale,
    this.blur = 2,
    this.blurColor,
    this.borderRadius = 0,
    this.colorOpacity = 0.5,
    this.overlayChild,
  })  : image = Image.asset(path, fit: fit, scale: scale),
        super(key: key);

  ///acts as Image.network
  ImageBlur.network(
    String url, {
    Key key,
    BoxFit fit,
    double scale,
    this.blur = 2,
    this.blurColor = Colors.transparent,
    this.borderRadius = 0,
    this.colorOpacity = 0.5,
    this.overlayChild,
  })  : image = Image.network(url, fit: fit, scale: scale),
        super(key: key);

  final Widget image;
  final double blur;
  final Color blurColor;
  final double borderRadius;
  final double colorOpacity;
  final Widget overlayChild;

  @override
  Widget build(BuildContext context) {
    return Blur(
      child: image,
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      colorOpacity: colorOpacity,
      overlayChild: overlayChild,
    );
  }
}
