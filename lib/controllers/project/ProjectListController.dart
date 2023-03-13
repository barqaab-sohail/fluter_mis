import 'package:first_project/controllers/auth/UserPreferences.dart';
import 'package:first_project/model/project/ProjectListModel.dart';
import 'package:get/get.dart';
import 'package:first_project/utils/api/BaseAPI.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectListController extends GetxController {
  UserPreference userPreference = UserPreference();
  List<ProjectListModal> _projects = [];
  List<ProjectListModal> filterProjects = [];
  var token = '';
  @override
  void onInit() {
    super.onInit();
    userPreference.getUser().then((value) => {token = value.token!});
  }

  Future<List<ProjectListModal>> ProjectList({String? query}) async {
    //Stored Employees return avoid again API Call
    if (_projects.isNotEmpty) {
      //Filtered Projects return
      if (query != null) {
        filterProjects = _projects
            .where((element) => element
                .toJson()
                .toString()
                .toLowerCase()
                .contains((query.toLowerCase())))
            .toList();
        return filterProjects;
      }
      return _projects;
    }
    //API Call
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ' + token
    };
    var url = Uri.parse(BaseAPI.baseURL + EndPoints.projectList);
    http.Response response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      Iterable responseData = jsonDecode(response.body);
      _projects = List<ProjectListModal>.from(
          responseData.map((model) => ProjectListModal.fromJson(model)));
      return _projects;
    } else {
      throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
    }
  }
}
