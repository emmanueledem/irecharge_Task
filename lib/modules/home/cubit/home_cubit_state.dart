import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_assessment/common/io/employes_model.dart';

part 'home_cubit_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _$Initial;

  const factory HomeState.loading() = _$Loading;

  const factory HomeState.error({required String? message}) = _$Error;

  const factory HomeState.success({
    required List<Employees>? data,
  }) = _$Succes;

  const factory HomeState.searched({
    required List<Employees>? data,
  }) = _$Searched;
}
