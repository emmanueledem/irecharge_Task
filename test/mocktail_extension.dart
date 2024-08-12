import 'package:mocktail/mocktail.dart';

extension WhenExtension<T> on When<T> {
  void thenReturnFuture(T value) {
    thenAnswer((_) {
      return value;
    });
  }
}
