import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blur Wrapper widget',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Blur Wrapper widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Image.asset('assets/cat.png').blurred(
                    blur: blurValue,
                    blurColor: theme.primaryColor,
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: Image.asset('assets/cat.png').blurred(
                    colorOpacity: 0.2,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(20),
                    ),
                    blur: blurValue,
                    overlay: Text(
                      'Cat',
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: theme.scaffoldBackgroundColor,
                      ),
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
                      'assets/cat.png',
                      scale: 3.5,
                    ),
                    Column(
                      children: [
                        const Icon(Icons.image),
                        Text(
                          'Frost',
                          style: theme.textTheme.headlineMedium,
                        ),
                      ],
                    ).frosted(
                      blur: blurValue,
                      borderRadius: BorderRadius.circular(20),
                      padding: const EdgeInsets.all(8),
                    )
                  ],
                ),
                Blur(
                  blur: blurValue,
                  blurColor: theme.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Blur',
                      style: theme.textTheme.displaySmall,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/cat.png',
                  width: MediaQuery.of(context).size.width - 40,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Frost text',
                      style: theme.textTheme.displaySmall,
                    ).frosted(
                      blur: blurValue,
                      padding: const EdgeInsets.all(8),
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.image).frosted(
                      padding: const EdgeInsets.all(8),
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
