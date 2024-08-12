import 'dart:io';

import 'package:flutter/services.dart';
import 'package:golden_toolkit/src/test_asset_bundle.dart';

class FileAssetBundle extends TestAssetBundle {
  static const testPrefix = 'test/';

  @override
  Future<ByteData> load(String key) {
    if (key.startsWith(testPrefix)) {
      final bytes = File(key).readAsBytesSync();
      return Future.value(bytes.buffer.asByteData());
    } else {
      return rootBundle.load(key);
    }
  }
}
