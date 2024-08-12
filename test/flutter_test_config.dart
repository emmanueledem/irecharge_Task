import 'dart:async';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DateTimeFactory {
  const DateTimeFactory._();
  static DateTime? nowOverride;

  static DateTime now() {
    return nowOverride ?? DateTime.now();
  }
}

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      WidgetController.hitTestWarningShouldBeFatal = true;
      DateTimeFactory.nowOverride = DateTime(2022, 04, 01, 12);

      VisibilityDetectorController.instance.updateInterval = Duration.zero;
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: const [
        Device.phone,
        Device.iphone11,
      ],
      enableRealShadows: true,
      skipGoldenAssertion: () => !Platform.isMacOS,
      primeAssets: legacyPrimeAssets,
    ),
  );
}
