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
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
    this.alignment = Alignment.center,
  }) : super(key: key);

  final Widget child;
  final double blur;
  final Color blurColor;
  final BorderRadius borderRadius;
  final double colorOpacity;
  final Widget overlay;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
              child: Container(
                decoration: BoxDecoration(
                  color: blurColor.withOpacity(colorOpacity),
                ),
                alignment: alignment,
                child: overlay,
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
    double height,
    double width,
    double scale,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
  })  : image = Image.asset(
          path,
          fit: fit,
          height: height,
          width: width,
          scale: scale,
        ),
        super(key: key);

  ///acts as Image.network
  ImageBlur.network(
    String url, {
    Key key,
    BoxFit fit,
    double height,
    double width,
    double scale,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
  })  : image = Image.network(
          url,
          fit: fit,
          height: height,
          width: width,
          scale: scale,
        ),
        super(key: key);

  final Widget image;
  final double blur;
  final Color blurColor;
  final BorderRadius borderRadius;
  final double colorOpacity;
  final Widget overlay;

  @override
  Widget build(BuildContext context) {
    return Blur(
      child: image,
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      colorOpacity: colorOpacity,
      overlay: overlay,
    );
  }
}

class Frost extends StatelessWidget {
  final Widget child;
  final double blur;
  final Color frostColor;
  final double frostOpacity;
  final double height;
  final double width;
  final AlignmentGeometry alignment;
  final BorderRadius borderRadius;

  const Frost({
    Key key,
    this.child,
    this.blur = 5,
    this.frostColor = Colors.white,
    this.alignment = Alignment.center,
    this.height,
    this.width,
    this.frostOpacity = 0.0,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: blur,
      blurColor: frostColor,
      borderRadius: borderRadius,
      child: Container(
        height: height,
        width: width,
        child: height == null || width == null ? child : SizedBox.shrink(),
        color: frostColor.withOpacity(frostOpacity),
      ),
      alignment: alignment,
      overlay: child,
    );
  }
}
