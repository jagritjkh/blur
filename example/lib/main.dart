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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ImageBlur.asset(
              'assets/cat.webp',
              colorOpacity: 0,
              scale: 4,
              borderRadius: 20,
              blur: blurValue,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/cat.webp', scale: 4),
                Blur(
                  blur: blurValue,
                  borderRadius: 30,
                  blurColor: Colors.white,
                  child: Container(height: 72, width: 144),
                  overlayChild: Center(
                    child: Text(
                      'Jagrit',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ],
            ),
            Blur(
              blur: blurValue,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Blur text',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              blurColor: Theme.of(context).primaryColor,
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
