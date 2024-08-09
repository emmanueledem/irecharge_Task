import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assessment/common/io/data.dart';
import 'package:mobile_assessment/common/io/employes_model.dart';
import 'package:mobile_assessment/modules/home/cubit/home_cubit_state.dart';
import 'package:mobile_assessment/modules/home/repository/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  Map<String, dynamic> errorResponse = Api.errorRexponse;

  final HomeRepository homeRepository = HomeRepository();

  List<Employees>? _employees;
  List<Employees>? get employees => _employees;

  Future<void> getEmployees(BuildContext context) async {
    emit(const HomeState.loading());

    final result = await Future.delayed(
      const Duration(seconds: 2),
      homeRepository.getAllEmployees,
    );
    _employees = result;
    emit(HomeState.success(
      data: _employees,
    ));
  }

  Future<void> searchEmployees(
    BuildContext context, {
    required String searchText,
  }) async {
    emit(const HomeState.loading());

    final result = await homeRepository.searchEmployess(searchText: searchText);

    if (searchText.isEmpty) {
      print('empty text');
      emit(HomeState.success(
        data: _employees,
      ));
    } else {
      if (result != null && result.isNotEmpty) {
        print('not empty');
        emit(HomeState.searched(
          data: result,
        ));
      } else {
        emit(HomeState.error(message: errorResponse['errors'][3]['message']));
      }
    }
  }
}
