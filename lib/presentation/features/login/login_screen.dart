import 'package:flutter/material.dart';
import 'package:userbook/presentation/features/components/login_body.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: LoginBody(),
    );
  }

}