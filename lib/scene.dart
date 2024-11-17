import 'package:flutter_engine/component.dart';
import 'package:flutter_engine/entity.dart';

class SceneBase {
  List<Entity> entities = List<Entity>.empty(growable: true);

  void addEntities() {}

  void init() {
    addEntities();
    for (Entity entity in entities) {
      for (Component component in entity.components) {
        component.entity = entity;
        component.init();
      }
    }
  }

  void tick() {
    for (Entity entity in entities) {
      for (Component component in entity.components) {
        component.tick();
      }
    }
  }
}
