import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_assessment/common/io/response.dart';

class LocalDataStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<StatusResponse?> getEmployees() async {
    return await storage.read(key: employees).then((value) {
      if (value == null) {
        return null;
      }
      return StatusResponse.fromJson(
          json.decode(value) as Map<String, dynamic>);
    });
  }

  Future<void> saveEmployees(StatusResponse employeesData) async {
    storage.write(key: employees, value: jsonEncode(employeesData.toJson()));
    await getEmployees();
  }
}

const String employees = 'employees';
