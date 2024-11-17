import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_engine/scene.dart';
import 'package:flutter_engine/test_scene.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
  void paint(Canvas _canvas, Size _size) {
    canvas = _canvas;
    size = _size;
    final clearPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), clearPaint);

    scene.tick();

    py = py + 0.01;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      // Your frame update logic here
      setState(() {}); // Force rebuild
      SchedulerBinding.instance.scheduleFrame();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  aspectRatio: 16 / 9,
                  child: CustomPaint(painter: MyPainter()),
                ),
              )),
        )
      ]),
    );
  }
}
