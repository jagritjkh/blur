import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blur Wrapper widget',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Blur Wrapper widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double blurValue = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: ImageBlur.asset(
                    'assets/cat.webp',
                    blur: blurValue,
                    blurColor: theme.primaryColor,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(20)),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: ImageBlur.asset(
                    'assets/cat.webp',
                    colorOpacity: 0.2,
                    borderRadius:
                        BorderRadius.horizontal(right: Radius.circular(20)),
                    blur: blurValue,
                    overlay: Text(
                      'Cat',
                      style: theme.textTheme.headline2
                          .copyWith(color: theme.scaffoldBackgroundColor),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/cat.webp',
                      scale: 3.5,
                    ),
                    Frost(
                      blur: blurValue,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Icon(Icons.image),
                            Text(
                              'Frost',
                              style: theme.textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Blur(
                  blur: blurValue,
                  blurColor: theme.primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Blur',
                      style: theme.textTheme.headline3,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/cat.webp',
                  width: MediaQuery.of(context).size.width - 40,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Frost.text(
                      'Frost text',
                      blur: blurValue,
                      textStyle: theme.textTheme.headline3,
                      padding: EdgeInsets.all(8),
                    ),
                    SizedBox(width: 20),
                    Frost.icon(
                      Icons.image,
                      padding: EdgeInsets.all(8),
                      blur: blurValue,
                    ),
                  ],
                ),
              ],
            ),
            Slider(
              value: blurValue,
              max: 20,
              onChanged: (double value) {
                setState(() {
                  blurValue = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
