# blur

Blur is a wrapper widget that blur it's child. There are ImageBlur.asset and ImageBlur.network that blur the image. Frost is another wrapper which blurs the background.


## Getting Started

To use this package, add `blur` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

![blur](https://user-images.githubusercontent.com/32562337/97818610-64cb9580-1cc9-11eb-8882-a60b4c9eff88.gif)

## Add dependency
```
dependencies:
  blur: ^4.0.0
```

## Import
```
import 'package:blur/blur.dart'
```

## Usage
```
Blur(
  blur: 2.5,
  blurColor: Theme.of(context).primaryColor,
  child: Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      'Blur',
      style: Theme.of(context).textTheme.headline3,
    ),
  ),
),
```

## Output
![blur_text](https://user-images.githubusercontent.com/32562337/97818466-955eff80-1cc8-11eb-8c3b-dcb86ffafcfe.jpg)

## Normal Image
![normal_image](https://user-images.githubusercontent.com/32562337/97818479-aad42980-1cc8-11eb-8f89-28bc8ac3fd14.jpg)

# Using extensions

## Input
```
 Image.asset('assets/cat.png').blurred(
     colorOpacity: 0.2,
     borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
     blur: blurValue,
     overlay: Text(
       'Cat',
       style: theme.textTheme.headline2!.copyWith(color: theme.scaffoldBackgroundColor),
     ),
   ),
```

## Output
![blur_image](https://user-images.githubusercontent.com/32562337/97818490-b6275500-1cc8-11eb-8d8a-e68eeec64f92.jpg)

## Frost
```
Stack(
  alignment: Alignment.center,
  children: [
    Image.asset(
      'assets/cat.png',
      scale: 3.5,
    ),
    Text(
      'Frost',
      style: theme.textTheme.headline4,
    ).frosted(
       blur: blurValue,
       borderRadius: BorderRadius.circular(20),
       padding: EdgeInsets.all(8),
     ),
  ],
),
```
![frost_image](https://user-images.githubusercontent.com/32562337/97818496-c17a8080-1cc8-11eb-9848-c87b96e67498.jpg)
