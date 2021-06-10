import 'package:flutter_app_provider/di/locator.dart';
import 'package:flutter_app_provider/model/employee.dart';
import 'package:flutter_app_provider/remote_data_source/api_helper.dart';

class UserRepository {

  Future<List<Employee>> fetchUserList() async {
    final List response = await locator<ApiHelper>().get("users");
    return response.map((e) => Employee.fromJson(e)).toList();
  }

  Future<Employee> fetchUserById(int id) async {
    final response = await locator<ApiHelper>().get("users/$id");
    return Employee.fromJson(response);
  }
}