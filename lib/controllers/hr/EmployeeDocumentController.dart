import 'package:first_project/model/hr/EmployeeDocumentModel.dart';
import 'package:get/get.dart';
import '../auth/UserPreferences.dart';
import 'package:first_project/utils/api/BaseAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeDocumentController extends GetxController {
  UserPreference userPreference = UserPreference();
  var token = '';
  void onInit() {
    super.onInit();
    userPreference.getUser().then((value) => {token = value.token!});
  }

  @override
  void onClose() {}

  Future<List<EmployeeDocumentModel>> EmployeeDocumentList(
      {required String id, String? query}) async {
    // if (_employees.isNotEmpty) {
    //   //Filtered Employees return
    //   if (query != null) {
    //     filterEmployees = _employees
    //         .where((element) => element
    //             .toJson()
    //             .toString()
    //             .toLowerCase()
    //             .contains((query.toLowerCase())))
    //         .toList();
    //     return filterEmployees;
    //   }
    //   return _employees;
    // }
    //API Call
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ' + token
    };

    var url = Uri.parse(BaseAPI.baseURL + EndPoints.employeeDocuments + id);

    http.Response response = await http.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      Iterable responseData = jsonDecode(response.body);
      List<EmployeeDocumentModel> _employeeDocuments =
          List<EmployeeDocumentModel>.from(responseData
              .map((model) => EmployeeDocumentModel.fromJson(model))).toList();
      return _employeeDocuments;
    } else {
      throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
    }
  }
}
