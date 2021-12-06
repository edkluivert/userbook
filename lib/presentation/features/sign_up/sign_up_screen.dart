import 'package:flutter/material.dart';
import 'package:userbook/presentation/features/sign_up/components/sign_up_body.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //backgroundColor: wPrimaryColor,
      body: SignUpBody(),
    );
  }

}
