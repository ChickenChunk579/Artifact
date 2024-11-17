import 'package:flutter/material.dart';
import 'package:flutter_engine/component.dart';
import 'package:flutter_engine/transform.dart' as artifact;
import 'package:flutter_engine/main.dart';

class SpriteRenderer extends Component {
  Color color = Colors.white;

  late artifact.Transform transform;

  @override
  void init() {
    transform = entity.getComponent()!;
  }

  @override
  void tick() {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    MyPainter.canvas.drawRect(
        Rect.fromLTWH(
          transform.x * (MyPainter.size.width / 100),
          transform.y * (MyPainter.size.width / 100),
          transform.width * (MyPainter.size.width / 100),
          transform.height * (MyPainter.size.width / 100),
        ),
        paint);
  }
}
