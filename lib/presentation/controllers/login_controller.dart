import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userbook/core/data/remote/auth_manager.dart';
import 'package:userbook/core/utils/show_loading.dart';
import 'package:userbook/data/model/login_request_model.dart';
import 'package:userbook/data/services/auth_service.dart';
import 'package:userbook/presentation/routes/app_routes.dart';

class LoginController extends GetxController{

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  late var loading = false.obs;
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

  Future<void> loginUser(String email, String password) async {
    showLoading();
    final response = await _authService
        .fetchLogin(LoginRequestModel(email: email, password: password));

    if (response != null) {
      /// Set isLogin to true

      _authManager.login(response.token);
      _clearControllers();
      Get.offAllNamed(AppRoutes.home);
    } else {

      dismissLoadingWidget();
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  _clearControllers(){
    emailController.clear();
    passwordController.clear();
  }
}