import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/UserModal.dart';

class UserPreference {
  String? token;
  String? userName;
  String? userDesignation;
  String? email;
  String? pictureUrl;

  Future<bool> saveUser(UserModal responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    sp.setString('userName', responseModel.userName.toString());
    sp.setString('userDesignation', responseModel.userDesignation.toString());
    sp.setString('email', responseModel.email.toString());
    sp.setString('pictureUrl', responseModel.pictureUrl.toString());

    return true;
  }

  Future<UserModal> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    this.token = sp.getString('token');
    this.userName = sp.getString('userName');
    this.userDesignation = sp.getString('userDesignation');
    this.email = sp.getString('email');
    this.pictureUrl = sp.getString('pictureUrl');

    // bool? isLogin = sp.getBool('isLogin');

    return UserModal(
        token: token,
        userName: userName,
        userDesignation: userDesignation,
        email: email,
        pictureUrl: pictureUrl);
  }

  void getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    this.token = sp.getString('token')!;
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
