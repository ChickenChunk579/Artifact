import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_engine/asset_loader.dart';
import 'package:flutter_engine/scene.dart';
import 'package:flutter_engine/test_scene.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Artifact'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyPainter extends CustomPainter {
  static double px = 2;
  static double py = 2;

  static late Canvas canvas;
  static late Size size;
  static late SceneBase scene;
  static bool sceneInitialized = false;

  MyPainter() {
    if (sceneInitialized) return;
    scene = TestScene();
    scene.init();
    sceneInitialized = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas = canvas;
    size = size;
    final clearPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), clearPaint);

    if (!_MyHomePageState.assetsLoaded) {
      scene.tick();
    }

    py = py + 0.01;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  static bool assetsLoaded = false;
  static bool loadingImages = true;

  @override
  void initState() {
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) async {
      if (!assetsLoaded && loadingImages) {
        await AssetLoader.load("assets/bird.png");
      }
      // Your frame update logic here
      setState(() {}); // Force rebuild
      SchedulerBinding.instance.scheduleFrame();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
              color: Colors.black,
              child: Center(
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: CustomPaint(painter: MyPainter()),
                ),
              )),
        )
      ]),
    );*/
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Artifact")),
      body: const TabBarView(
        children: [
          Center(child: Text('Content 1')),
          Center(child: Text('Content 2')),
          Center(child: Text('Content 3')),
        ],
      ),
    );
  }
}
