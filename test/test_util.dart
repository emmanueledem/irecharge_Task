// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart' as golden_toolkit;
import 'package:mobile_assessment/common/io/employes_model.dart';
import 'package:mobile_assessment/common/io/safe_image_configuration.dart';
import 'package:mobile_assessment/modules/home/cubit/home_cubit.dart';
import 'package:mobile_assessment/modules/home/cubit/home_cubit_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recase/recase.dart';
import 'package:test_api/src/backend/invoker.dart';

import 'file_asset_bundle.dart';

extension GoldenTestExtension on WidgetTester {
  Future<void> pumpXyzWidget(
    Widget widget, {
    golden_toolkit.WidgetWrapper? wrapper,
    Size surfaceSize = const Size(800, 600),
    double textScaleSize = 1.0,
    String? selectedRouteName,
  }) async {
    return pumpWidgetBuilder(
      DefaultAssetBundle(
        bundle: FileAssetBundle(),
        child: SafeImageConfiguration(
          data: SafeImageConfigurationData(
            shouldLoadAsAsset: (url) {
              if (url.startsWith(SafeImageConfigurationData.assetsPrefix) ||
                  url.startsWith(FileAssetBundle.testPrefix)) {
                return url;
              } else {
                return null;
              }
            },
            shouldLoadImageIdAsAsset: (imageId) =>
                imageId.startsWith(FileAssetBundle.testPrefix),
          ),
          child: BlocProvider(
            create: (context) => HomeCubit(
                initialState: HomeState.success(data: [
              Employees(
                  id: 4,
                  firstName: "Robert",
                  lastName: "Mann",
                  designation: "Custoner Relations",
                  level: 0,
                  productivityScore: 31.0,
                  currentSalary: "70,000",
                  employmentStatus: 1),
              Employees(
                  id: 4,
                  firstName: "Robert Einsten",
                  lastName: "Mann Over",
                  designation: "Software Develoer",
                  level: 1,
                  productivityScore: 31.0,
                  currentSalary: "170,000",
                  employmentStatus: 1),
            ])),
            child: MaterialApp(
              home: widget,
            ),
          ),
        ),
      ),
      wrapper: golden_toolkit.materialAppWrapper(theme: ThemeData.light()),
      surfaceSize: surfaceSize,
    );
  }

  Future<void> multiScreenGolden({
    String? name,
    Finder? finder,
    bool? autoHeight,
    double? overrideGoldenHeight,
    golden_toolkit.CustomPump? customPump,
    golden_toolkit.DeviceSetup? deviceSetup,
    List<golden_toolkit.Device>? devices,
  }) {
    final testName = Invoker.current!.liveTest.test.name;
    final generatedName = testName.snakeCase;
    return golden_toolkit.multiScreenGolden(
      this,
      name ?? generatedName,
      finder: finder,
      autoHeight: autoHeight,
      overrideGoldenHeight: overrideGoldenHeight,
      customPump: customPump,
      deviceSetup: deviceSetup,
      devices: devices,
    );
  }

  Future<void> screenMatchesGolden({
    String? name,
    Finder? finder,
    bool? autoHeight,
    golden_toolkit.CustomPump? customPump,
  }) async {
    final testName = Invoker.current!.liveTest.test.name;
    final generatedName = testName.snakeCase;
    return golden_toolkit.screenMatchesGolden(
      this,
      name ?? generatedName,
      autoHeight: autoHeight,
      finder: finder,
      customPump: customPump,
    );
  }

  Future<void> dragVerticallyUntilVisible(Finder finder, Finder view) {
    return dragUntilVisible(finder, view, const Offset(0, -500));
  }

  Future<void> tapAndSettle(
    Finder finder,
  ) async {
    await tap(finder);
    await pumpAndSettle();
  }
}

void whenBloc<State>(
  BlocBase<State> bloc,
  Stream<State> stream, {
  State? initialState,
}) {
  final broadcastStream = stream.asBroadcastStream();

  if (initialState != null) {
    when(() => bloc.state).thenReturn(initialState);
  }

  when(() => bloc.stream).thenAnswer(
    (_) => broadcastStream.map((state) {
      when(() => bloc.state).thenReturn(state);
      return state;
    }),
  );

  when(() => bloc.close()).thenAnswer((invocation) => Future.value());
}
