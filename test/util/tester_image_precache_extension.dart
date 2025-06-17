import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Extension on [WidgetTester] to precache images in the widget tree.
/// This is useful for golden tests where images need to be loaded before
extension TesterImagePrecacheExtension on WidgetTester {
  Future<void> precacheImages() async {
    var elements = elementList(find.bySubtype<Image>());
    final precacheFutures = elements.map((element) {
      Image widget = element.widget as Image;
      return precacheImage(widget.image, element);
    });

    await runAsync(() async {
      await Future.wait(precacheFutures);
    });
  }
}
