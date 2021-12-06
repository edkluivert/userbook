import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:userbook/core/utils/app_color.dart';
import 'package:userbook/core/utils/app_text_styles.dart';
import 'package:userbook/presentation/controllers/sign_up_controller.dart';
import 'package:userbook/presentation/routes/app_routes.dart';


class SignUpForm extends StatefulWidget{
  @override
  _SignUpForm createState()=> _SignUpForm();

}
class _SignUpForm extends State<SignUpForm>{

  final _formKey = GlobalKey<FormState>();
  bool _btnEnabled = false;
  late bool _autoValidate = false;
  final _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
   return Form(
            key: _formKey,
            onChanged: () =>
                setState(() => _btnEnabled = _formKey.currentState!.validate()),
            autovalidateMode: _autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              children: <Widget>[
                SizedBox(height: 16.h,),
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
                          await _controller.registerUser(
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
                        "Continue",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 41.h,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an Account?",
                        style: AppTextStyles.subText1),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.login);
                      },
                      child: Text("Sign in",
                          style: AppTextStyles.subText
                      ),
                    ),


                  ],
                )
              ],
            ));

    }

  // onRegister()async {
  //   if (_formKey.currentState!.validate()) {
  //     await _controller.registerUser(_controller.emailController.text, _controller.passwordController.text);
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
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none
        ),
        // labelText: "Confirm Password",

        filled: true,
        fillColor: Colors.white,
        hintText: "Choose password",
        hintStyle: AppTextStyles.inputText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

}