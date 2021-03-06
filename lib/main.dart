import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:userbook/di/auth_binder.dart';
import 'my_app.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  AuthBinder().dependencies();
}


