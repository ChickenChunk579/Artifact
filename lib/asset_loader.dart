import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetLoader {
  static Map<String, ByteData> assets = Map<String, ByteData>();
  static Map<String, ui.Image> images = Map<String, ui.Image>();

  static Future decodeImage(String assetPath, ByteData data) async {
    final data = AssetLoader.assets[assetPath]!;
    final list = data.buffer.asUint8List();
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(list, completer.complete);
    images[assetPath] = await completer.future;
  }

  static Future<ByteData> load(String path) async {
    if (assets.containsKey(path)) {
      return ByteData(0);
    }
    final data = await rootBundle.load(path);
    assets[path] = data;

    //debugPrint("Loaded $path");

    return data;
  }
}
