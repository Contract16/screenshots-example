import 'package:flutter/material.dart';
import 'package:screenshots_example/src/feature/theme/data/theme_light.dart';

/// Wraps the given [child] widget in a [MaterialApp] with a light theme.
/// This is useful for testing widgets that require a Material context.
Widget materialWidget(Widget child) {
  return MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      theme: themeLight.copyWith(platform: TargetPlatform.android),
      debugShowCheckedModeBanner: false,
      home: Material(child: child),
    ),
  );
}
