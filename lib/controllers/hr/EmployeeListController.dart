import 'package:first_project/controllers/auth/UserPreferences.dart';
import 'package:get/get.dart';
import 'package:first_project/utils/api/BaseAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_project/model/hr/EmployeeModel.dart';

class EmployeeListController extends GetxController {
  UserPreference userPreference = UserPreference();
  var token = '';
  List<EmployeeModal> _employees = [];
  List<EmployeeModal> filterEmployees = [];
  @override
  void onInit() {
    super.onInit();
    userPreference.getUser().then((value) => {token = value.token!});
  }

  @override
  void onClose() {}

  Future<void> getNewEmployeeList() async {
    print('call new employee list');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    var url = Uri.parse(BaseAPI.baseURL + EndPoints.employeeList);
    http.Response response = await http.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      Iterable responseData = jsonDecode(response.body);
      List<EmployeeModal> newEmployees = List<EmployeeModal>.from(
<<<<<<< HEAD
=======
          responseData.map((model) => EmployeeModal.fromJson(model))).toList();

      _employees = newEmployees;
    } else {
      throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
    }
  }

  Future<List<EmployeeModal>> EmployeeList({String? query}) async {
    if (_employees.isNotEmpty) {
      if (query != null) {
        filterEmployees = _employees
            .where((element) => element
                .toJson()
                .toString()
                .toLowerCase()
                .contains((query.toLowerCase())))
            .toList();
        return filterEmployees;
      }
      print('From save value');
      return _employees;
    }
    print('fetching from API');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    var url = Uri.parse(BaseAPI.baseURL + EndPoints.employeeList);
    http.Response response = await http.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      Iterable responseData = jsonDecode(response.body);
      _employees = List<EmployeeModal>.from(
>>>>>>> 99f304e8dbd9fd870ff09f0208c274f848d970c5
          responseData.map((model) => EmployeeModal.fromJson(model))).toList();

      _employees = newEmployees;
    } else {
      throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
    }
  }

  Future<List<EmployeeModal>> EmployeeList({String? query}) async {
    //Stored Employees return avoid again API Call
    print(token);
    if (_employees.isNotEmpty) {
      //Filtered Employees return
      if (query != null) {
<<<<<<< HEAD
        filterEmployees = _employees
=======
        _employees = _employees
>>>>>>> 99f304e8dbd9fd870ff09f0208c274f848d970c5
            .where((element) => element
                .toJson()
                .toString()
                .toLowerCase()
                .contains((query.toLowerCase())))
            .toList();
        return filterEmployees;
      }
      return _employees;
<<<<<<< HEAD
    }
    //API Call
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    var url = Uri.parse(BaseAPI.baseURL + EndPoints.employeeList);
    http.Response response = await http.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      Iterable responseData = jsonDecode(response.body);
      _employees = List<EmployeeModal>.from(
          responseData.map((model) => EmployeeModal.fromJson(model))).toList();
      return _employees;
=======
>>>>>>> 99f304e8dbd9fd870ff09f0208c274f848d970c5
    } else {
      throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
    }
  }
}
