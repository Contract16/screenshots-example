import 'dart:io';

import 'package:flutter/services.dart';

final class LoadTestFont {
  /// Loads the test font for golden tests.
  ///
  /// This method ensures that the test font is loaded and available for use
  /// in golden tests. It is typically called before running any tests that
  /// require the font.
  static Future<void> load() async {
    // Load the test font from the assets
    final file = File('assets/fonts/Roboto-Regular.ttf').readAsBytesSync();
    final bytes = Future<ByteData>.value(file.buffer.asByteData());

    await (FontLoader('Roboto')..addFont(bytes)).load();
  }
}
