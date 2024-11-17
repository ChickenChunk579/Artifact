import 'package:flutter_engine/component.dart';
import 'package:flutter_engine/entity.dart';
import 'package:flutter_engine/scene.dart';
import 'package:flutter_engine/sprite_renderer.dart';
import 'package:flutter_engine/transform.dart';

class Fall extends Component {
  double velocity = 0.0;
  double gravity = 0.02;

  late Transform transform;

  @override
  void init() {
    transform = entity.getComponent()!;
  }

  @override
  void tick() {
    velocity += gravity;
    transform.y += velocity;
  }
}

class TestScene extends SceneBase {
  @override
  void addEntities() {
    Entity entity = Entity();
    entity.name = "Block";
    entity.components.add(Transform.fromXYWH(1, 1, 5, 5));
    entity.components.add(SpriteRenderer());
    entity.components.add(Fall());
    entities.add(entity);
  }
}
