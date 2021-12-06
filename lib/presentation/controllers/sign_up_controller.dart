import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userbook/data/model/user.dart';
import 'package:userbook/data/services/exceptions/auth_exception.dart';
import 'package:userbook/presentation/features/sign_up/state/sign_up_state.dart';

import 'auth_controller.dart';

class SignUpController extends GetxController{


  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';


  final AuthenticationController _authenticationController = Get.find();
  final _signUpStateStream = SignUpState().obs;

  SignUpState get state => _signUpStateStream.value;

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

  Future<User?> createAccount({required String email, required String password}) async {
    _signUpStateStream.value =SignUpLoading();
    try{
      await _authenticationController.createAccount(email: email, password: password);
      _signUpStateStream.value = SignUpState();
    } on AuthenticationException catch(e){
      _signUpStateStream.value = SignUpFailure(error: e.message);
    }
  }


  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

}

