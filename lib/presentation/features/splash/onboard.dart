import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userbook/core/data/remote/auth_manager.dart';
import 'package:userbook/presentation/features/home/home_screen.dart';
import 'package:userbook/presentation/features/login/login_screen.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? const HomeScreen() : const LoginScreen();
    });
  }
}
