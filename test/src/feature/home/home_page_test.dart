import 'package:flutter_test/flutter_test.dart';
import 'package:screenshots_example/src/feature/home/home_page.dart';

import '../../../util/tester_screenshot_extension.dart';

void main() {
  group('Golden Tests', () {
    testWidgets(
      'Home Page golden tests',
      (tester) async => await tester.capture(const HomePage()),
      tags: ['golden'],
    );
  });
}
