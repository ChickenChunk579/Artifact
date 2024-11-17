import 'package:flutter_engine/component.dart';
import 'package:collection/collection.dart';

class Entity {
  String name = "Entity";
  List<Component> components = List<Component>.empty(growable: true);

  T? getComponent<T extends Component>() {
    return components.firstWhereOrNull((component) => component is T) as T?;
  }
}
