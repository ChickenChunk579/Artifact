import 'package:flutter_engine/component.dart';

class Transform extends Component {
  double x = 0;
  double y = 0;
  double width = 1;
  double height = 1;

  double getX() => x;
  double getY() => y;
  double getWidth() => width;
  double getHeight() => height;

  Transform.fromXYWH(double x, double y, double width, double height)
      : x = x,
        y = y,
        width = width,
        height = height;

  @override
  void init() {}

  @override
  void tick() {}
}
