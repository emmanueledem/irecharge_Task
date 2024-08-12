import 'package:flutter/widgets.dart';

class SafeImageConfiguration extends InheritedWidget {
  const SafeImageConfiguration({
    required super.child,
    required this.data,
    super.key,
  });

  final SafeImageConfigurationData data;

  static SafeImageConfiguration? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SafeImageConfiguration>();
  }

  @override
  bool updateShouldNotify(covariant SafeImageConfiguration oldWidget) {
    return oldWidget.data != data;
  }
}

class SafeImageConfigurationData {
  const SafeImageConfigurationData({
    this.httpHeadersBuilder,
    this.urlFromImageIdBuilder,
    this.shouldLoadAsFile = _defaultShouldLoadAsFile,
    this.shouldLoadAsAsset = _defaultShouldLoadAsAsset,
    this.shouldLoadImageIdAsAsset = _defaultShouldLoadImageIdAsAsset,
  });

  static const assetsPrefix = 'assets/';

  final Map<String, String>? Function(String url)? httpHeadersBuilder;
  final String Function(String imageId)? urlFromImageIdBuilder;
  final bool Function(String url) shouldLoadAsFile;
  final String? Function(String url) shouldLoadAsAsset;
  final bool Function(String url) shouldLoadImageIdAsAsset;

  static bool _defaultShouldLoadAsFile(String url) {
    return url.startsWith('/');
  }

  static String? _defaultShouldLoadAsAsset(String url) {
    return url.startsWith(assetsPrefix) ? url : null;
  }

  static bool _defaultShouldLoadImageIdAsAsset(String imageId) {
    return false;
  }
}
