import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:flutter_engine/asset_loader.dart';
import 'package:flutter_engine/component.dart';
import 'package:flutter_engine/transform.dart';
import 'package:flutter_engine/main.dart';

class SpriteRenderer extends Component {
  flutter.Color color = flutter.Colors.white;
  ui.Image? sprite;
  bool loadingImage = false;
  bool loadedImage = false;

  late Transform transform;

  String _spritePath = "";

  SpriteRenderer(String path) {
    _spritePath = path;
  }

  @override
  void init() {
    transform = entity.getComponent()!;
  }

  @override
  void tick() {
    if (!loadedImage) {
      if (!AssetLoader.assets.containsKey(_spritePath)) {
        return;
      } else {
        if (loadingImage) {
        } else {
          debugPrint("Decoding");
          ByteData data = AssetLoader.assets[_spritePath]!;
          ui.decodeImageFromList(data.buffer.asUint8List(), (image) {
            sprite = image;
            loadedImage = true;
            debugPrint("Decoded: $sprite");
          });
          return;
        }
      }
    }
    final paint = flutter.Paint()
      ..color = color
      ..style = flutter.PaintingStyle.fill;
    MyPainter.canvas
        .drawImage(sprite!, flutter.Offset(transform.x, transform.y), paint);
  }
}
