import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userbook/core/data/remote/auth_manager.dart';
import 'package:userbook/data/model/sign_up_request_model.dart';
import 'package:userbook/data/services/auth_service.dart';


class SignUpController extends GetxController{


  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  late final AuthService _authService;
  late final AuthenticationManager _authManager;


  @override
  void onInit() {

    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _authService = Get.find();
    _authManager = Get.find();
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

  Future<void> registerUser(String email, String password) async {
    final response = await _authService
        .fetchRegister(RegisterRequestModel(email: email, password: password));

    if (response != null) {
      /// Set isLogin to true
      const CircularProgressIndicator();
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}

