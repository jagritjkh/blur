library blur;

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///blur it's child
///blur is the value of blur effect, higher the blur more the blur effect (default value = 5)
///blurColor is the color of blur effect
///borderRadius is the radius of the child to be blurred
///colorOpacity is the opacity of the blurColor (default value = 0.5)
///overlayChild is the widget that can be stacked over blurred widget
///alignment is the alignment geometry of the overlay
class Blur extends StatelessWidget {
  Blur({
    Key? key,
    required this.child,
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
  final BorderRadius? borderRadius;
  final double colorOpacity;
  final Widget? overlay;
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
///height is the height of the image
///width is the width of the image
///scale scales the image
class ImageBlur extends StatelessWidget {
  ///acts as Image.asset
  ImageBlur.asset(
    String path, {
    Key? key,
    BoxFit? fit,
    double? height,
    double? width,
    double? scale,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
    this.alignment = Alignment.center,
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
    Key? key,
    BoxFit? fit,
    double? height,
    double? width,
    required double scale,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
    this.alignment = Alignment.center,
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
  final BorderRadius? borderRadius;
  final double colorOpacity;
  final Widget? overlay;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Blur(
      child: image,
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      colorOpacity: colorOpacity,
      overlay: overlay,
      alignment: alignment,
    );
  }
}

///created frosted glass effect: blurs the background of the child given to it
///frostColor is the color of the frost effect
///frostOpacity is the opacity of the frostColor
///height is the height of the frost effect
///width is the width of the frost effect
///borderRadius is the radius of the frost effect
///alignment is the alignment geometry of the child
///padding is the child padding
class Frost extends StatelessWidget {
  Frost({
    Key? key,
    this.child,
    this.blur = 5,
    this.frostColor = Colors.white,
    this.alignment = Alignment.center,
    this.height,
    this.width,
    this.frostOpacity = 0.0,
    this.borderRadius,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  ///give the frosted glass effect to the string text
  ///textAlign is the alignment of the string text
  ///textStyle is the styling of the string text
  Frost.text(
    String text, {
    Key? key,
    TextAlign? textAlign,
    TextStyle? textStyle,
    this.blur = 5,
    this.frostColor = Colors.white,
    this.alignment = Alignment.center,
    this.height,
    this.width,
    this.frostOpacity = 0.0,
    this.borderRadius,
    this.padding = EdgeInsets.zero,
  })  : child = Text(text, textAlign: textAlign, style: textStyle),
        super(key: key);

  ///give the frosted glass effect to the icon
  ///iconColor is the color of the icon
  ///iconSize is the size of the icon
  Frost.icon(
    IconData iconData, {
    Color? iconColor,
    double? iconSize,
    Key? key,
    this.blur = 5,
    this.frostColor = Colors.white,
    this.alignment = Alignment.center,
    this.height,
    this.width,
    this.frostOpacity = 0.0,
    this.borderRadius,
    this.padding = EdgeInsets.zero,
  })  : child = Icon(iconData, color: iconColor, size: iconSize),
        super(key: key);

  final Widget? child;
  final double blur;
  final Color frostColor;
  final double frostOpacity;
  final double? height;
  final double? width;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: blur,
      blurColor: frostColor,
      borderRadius: borderRadius,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        child: height == null || width == null ? child : SizedBox.shrink(),
        color: frostColor.withOpacity(frostOpacity),
      ),
      alignment: alignment,
      overlay: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class AnimatedBlur extends StatefulWidget {
  final Widget child;
  final int durationInMilliseconds;
  final Curve curve;
  final double blur;
  final Color blurColor;
  final BorderRadius? borderRadius;
  final double colorOpacity;
  final Widget? overlay;
  final AlignmentGeometry alignment;

  AnimatedBlur({
    required this.child,
    Key? key,
    this.durationInMilliseconds = 400,
    this.curve = Curves.decelerate,
    this.blur = 5,
    this.blurColor = Colors.white,
    this.borderRadius,
    this.colorOpacity = 0.5,
    this.overlay,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  _AnimatedBlurState createState() => _AnimatedBlurState();
}

class _AnimatedBlurState extends State<AnimatedBlur>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: widget.durationInMilliseconds),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    animation = CurvedAnimation(parent: controller, curve: widget.curve);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Blur(
      child: widget.child,
      blur: animation.value,
      blurColor: widget.blurColor,
      alignment: widget.alignment,
      borderRadius: widget.borderRadius,
      colorOpacity: widget.colorOpacity,
      overlay: widget.overlay,
    );
  }
}

extension BlurExtension on Widget {
  Blur blurred({
    double blur = 5,
    Color blurColor = Colors.white,
    BorderRadius? borderRadius,
    double colorOpacity = 0.5,
    Widget? overlay,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return Blur(
      child: this,
      blur: blur,
      blurColor: blurColor,
      borderRadius: borderRadius,
      colorOpacity: colorOpacity,
      overlay: overlay,
      alignment: alignment,
    );
  }
}
