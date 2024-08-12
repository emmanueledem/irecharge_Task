import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mobile_assessment/modules/home/presentation/home_screen.dart';

import '../../../../test_util.dart';

void main() {
  group('home screen', () {
    testGoldens(
      'initial',
      (tester) async {
        // when
        await tester.pumpHomeScreen();
        // then
        await tester.multiScreenGolden(
          autoHeight: true,
        );
      },
    );
  });
}

extension on WidgetTester {
  Future<void> pumpHomeScreen() async {
    return pumpXyzWidget(
      const HomeScreen(),
    );
  }
}
