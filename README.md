# blur

A blur wrapper widget that blurs it's child
![blur](https://user-images.githubusercontent.com/32562337/95470880-eb2cda00-099e-11eb-9484-8e5eb74e6073.gif)

## Add dependency
```
dependencies:
  blur: ^0.0.1
```

## Import
```
import 'package:blur/blur.dart'
```

## Usage
```
Blur(
  blur: 0.5,
  child: Text(
      'Text',
      style: Theme.of(context).textTheme.headline3,
    ),
  ),
  blurColor: Colors.blueAccent,
  borderRadius: 30,
  overlayChild: Center(child: Text('Blur')),
)
```

## Output
![blur_text](https://user-images.githubusercontent.com/32562337/95469491-570e4300-099d-11eb-87ec-5ca60e6176ba.jpg)

## Normal Image
![normal_image](https://user-images.githubusercontent.com/32562337/95471905-09dfa080-09a0-11eb-8ce3-b90b3a063d80.jpg)

## Input
```
ImageBlur.asset(
  'assets/cat.webp',
  colorOpacity: 0,
  scale: 4,
  borderRadius: 20,
  blur: blurValue,
),
```

## Output
![blur_image](https://user-images.githubusercontent.com/32562337/95471602-bd946080-099f-11eb-95db-39818cef1554.jpg)
