import 'dart:convert';
import 'package:first_project/utils/api/BaseAPI.dart';
import 'package:first_project/views/auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:first_project/model/UserModal.dart';
import 'package:first_project/views/dashboard/Dashboard.dart';

class LoginController extends GetxController {
  late TextEditingController emailController, passwordController;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var email = '';
  var password = '';
  var loginDesignation = '';
  var loginPicture = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  Future<void> loginWithEmail({@required formkey}) async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formkey.currentState!.save();

    var headers = {'content-Type': 'application/json'};
    try {
      var url = Uri.parse(BaseAPI.baseURL + EndPoints.login);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      final json = jsonDecode(response.body);
      if (json['status'] == 200) {
        UserModal loginUser = UserModal.fromJson(json);
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', loginUser.token.toString());
        await prefs?.setString('userName', loginUser.userName.toString());
        await prefs?.setString(
            'userDesignation', loginUser.userDesignation.toString());
        await prefs?.setString('email', loginUser.email.toString());
        await prefs?.setString('pictureUrl', loginUser.pictureUrl.toString());

        emailController.clear();
        passwordController.clear();

        Get.to(() => DashBoardScreen());
      } else {
        Get.to(() => LoginScreen());
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('userName').toString();
    return stringValue;
  }

  static Future<bool> isLogin() async {
    var any = await SharedPreferences.getInstance();
    if (any.getString('token') == null) {
      return false;
    } else {
      return true;
    }
  }

  static logout({String? email, String? authToken}) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, String> requestHeaders = {
      'content-Type': 'application/json',
      'Authorization': 'Bearer ' + prefs.getString('token').toString(),
    };
    var body = json.encode({"email": email});
    var url = Uri.parse(BaseAPI.baseURL + EndPoints.logout);
    http.Response response =
        await http.post(url, headers: requestHeaders, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      prefs.clear();
      Get.off(() => LoginScreen(), arguments: [
        {"first": 'First data'},
        {"second": 'Second data'}
      ]);
      SystemNavigator.pop();
    } else {}
  }
}
