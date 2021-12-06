import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:userbook/core/utils/app_color.dart';
import 'package:userbook/core/utils/app_string.dart';
import 'package:userbook/core/utils/app_text_styles.dart';

import 'login_form.dart';

class LoginBody extends StatelessWidget{
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            // color: wPrimaryColor,
            //width: double.infinity,
            height: 276.h,
            child: Padding(
              padding: EdgeInsets.only(bottom: 172.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/icons/waves.svg'),
                  SizedBox(width: 7.w,),
                  Text(appName,
                    style: AppTextStyles.appNameStyle
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 473.h,
            child: Stack(
              children: <Widget>[
                Container(
                  color: primaryColor,
                ),
                Positioned(
                  top: 30.h,
                  left: 87.w,
                  right: 88.w,
                  child: Center(
                    child: Text("Welcome back",
                      style: AppTextStyles.subText2
                    ),
                  ),),
                Positioned(
                  top: 133.h,
                  left: 0,
                  right: 0,
                  child: Padding(padding: EdgeInsets.only(left: 29.w, right: 28.w,),
                    child: const LoginForm(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

}