import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screenshots_example/src/feature/theme/data/breakpoints.dart';

import '../src/material_widget.dart';
import 'load_test_font.dart';
import 'tester_image_precache_extension.dart';

/// An extension on [WidgetTester] to capture screenshots of widgets.
/// This extension provides a method to take screenshots of widgets.
extension TesterScreenshotExtension on WidgetTester {
  Future<void> capture(
    Widget widget, {
    String? name,
    ScreenshotMode mode = ScreenshotMode.both,
  }) async {
    // Arrange

    // Load the test font to ensure text rendering is correct in screenshots
    await LoadTestFont.load();

    // Ensure the widget is wrapped in a MaterialApp to provide necessary context
    await pumpWidget(materialWidget(widget));

    // Load and precache images before taking screenshots
    await precacheImages();

    // Get the sizes for the screenshots based on the mode
    Map<String, Size> sizes = _sizes(mode);

    // Create a view for each size and set the physical size
    for (var size in sizes.entries) {
      view.physicalSize = size.value;
      final goldenFileName =
          'goldens/${name ?? widget.runtimeType.toString()}_golden_${size.key}.png';

      // Act
      // Pump the widget with the current size
      await pump();

      // Assert

      // Use the golden file name to match the screenshot
      // This also takes a screenshot
      await expectLater(
        find.byType(widget.runtimeType),
        matchesGoldenFile(goldenFileName),
      );
    }
  }
}

Map<String, Size> _sizes(ScreenshotMode mode) => {
  if (mode == ScreenshotMode.portrait || mode == ScreenshotMode.both) ...{
    for (final breakpoint in Breakpoint.values)
      'portrait_${breakpoint.name}': Size(
        breakpoint.size,
        breakpoint.size * 1.78, // 16:9 aspect ratio
      ),
  },
  if (mode == ScreenshotMode.landscape || mode == ScreenshotMode.both) ...{
    for (final breakpoint in Breakpoint.values)
      'landscape_${breakpoint.name}': Size(
        breakpoint.size * 1.78, // 9:16 aspect ratio
        breakpoint.size,
      ),
  },
};

enum ScreenshotMode { portrait, landscape, both }
