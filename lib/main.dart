import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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

  @override
  void paint(Canvas canvas, Size size) {
    final clearPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final rectPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), clearPaint);

    canvas.drawRect(
        Rect.fromLTWH(px * (size.width / 100), py * (size.width / 100),
            0.5 * (size.width / 10), 0.5 * (size.width / 10)),
        rectPaint);

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
