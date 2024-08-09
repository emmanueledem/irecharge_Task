import 'package:mobile_assessment/common/io/data.dart';
import 'package:mobile_assessment/common/io/employes_model.dart';
import 'package:mobile_assessment/common/io/response.dart';
import 'package:mobile_assessment/common/local_data/local_data_storage.dart';

class HomeRepository {
  Map<String, dynamic> successResponse = Api.successResponse;
  LocalDataStorage localDataStorage = LocalDataStorage();

  Future<List<Employees>?> getAllEmployees() async {
    if (successResponse['statusCode'] == 200) {
      final apiResponse = StatusResponse.fromJson(successResponse);

      localDataStorage.saveEmployees(apiResponse);

      return (apiResponse.data as List).map((e) {
        return Employees.fromJson(
          e as Map<String, dynamic>,
        );
      }).toList();
    } else {
      throw Exception();
    }
  }

  Future<List<Employees>?> searchEmployess({required String searchText}) async {
    final apiResponse = StatusResponse.fromJson(successResponse);

    final sortedEmployees = apiResponse.data
        .where((element) =>
            element['last_name']!.contains(searchText.trim()) ||
            element['first_name']!.contains(searchText.trim()) ||
            element['designation']!.contains(searchText.trim()))
        .toList();

    return (sortedEmployees as List).map((e) {
      return Employees.fromJson(
        e as Map<String, dynamic>,
      );
    }).toList();
  }
}
