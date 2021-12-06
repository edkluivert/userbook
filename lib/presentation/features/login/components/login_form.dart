import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:userbook/core/utils/app_color.dart';
import 'package:userbook/core/utils/app_text_styles.dart';
import 'package:userbook/presentation/controllers/login_controller.dart';
import 'package:userbook/presentation/routes/app_routes.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({Key? key}) : super(key: key);


  _LoginForm createState()=>_LoginForm();


}

class _LoginForm extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();
  bool _btnEnabled = false;
  late bool _autoValidate = false;
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
      return SafeArea(child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          onChanged: () =>
              setState(() => _btnEnabled = _formKey.currentState!.validate()),
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: <Widget>[
              buildEmailFormField(),
              SizedBox(height: 16.h,),
              buildPasswordFormField(),
              SizedBox(height: 35.h,),
              Center(
                child: SizedBox(
                  width: 314.w,
                  height: 60.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        await _controller.loginUser(
                            _controller.emailController.text,
                            _controller.passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shadowColor: primaryColorDark,
                        primary: primaryColorDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.r), // <-- Radius
                        ),
                        textStyle: AppTextStyles.btnText
                    ),
                    child: const Text(
                      "Login",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 41.h,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Are you new here?",
                      style: AppTextStyles.subText1
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(AppRoutes.signUp);
                    },
                    child: Text("Create an account",
                        style: AppTextStyles.subText
                    ),
                  ),

                ],
              )
            ],
          ),
        ),)
      );


  }
  // onLogin()async {
  //   if (_formKey.currentState!.validate()) {
  //     await _controller.loginUser(_controller.emailController.text, _controller.passwordController.text);
  //   }else{
  //     setState(() {
  //       _autoValidate = true;
  //     });
  //   }
  // }


  TextFormField buildEmailFormField() {
    return TextFormField(
      //obscureText: true,
      keyboardType: TextInputType.emailAddress,
      style: AppTextStyles.inputText,
      controller: _controller.emailController,
      onSaved: (value) {
        _controller.email = value!;
      },
      validator: (value) {
        return _controller.validateEmail(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none

        ),
        // labelText: "Confirm Password",
        filled: true,
        fillColor: Colors.white,
        hintText: "Email",
        hintStyle: AppTextStyles.inputText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.text,
      style: AppTextStyles.inputText,
      controller: _controller.passwordController,
      onSaved: (value) {
        _controller.password = value!;
      },
      validator: (value) {
        return _controller.validatePassword(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none

        ),
        // labelText: "Confirm Password",
        filled: true,
        fillColor: Colors.white,
        hintText: "Password",
        hintStyle: AppTextStyles.inputText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }


}
