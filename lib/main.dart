import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userbook/di/auth_binder.dart';
import 'package:userbook/presentation/controllers/auth_controller.dart';

import 'data/services/api/auth_service_impl.dart';
import 'my_app.dart';

void main() {
  initialize();
  runApp(const MyApp());
  AuthBinder().dependencies();
}

void initialize() {
  Get.lazyPut(() => AuthenticationController(Get.put(AuthServiceImpl())),);
}