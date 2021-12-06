import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userbook/core/utils/app_color.dart';
import 'package:userbook/core/utils/app_string.dart';
import 'package:userbook/presentation/features/sign_up/components/sign_up_form.dart';

class SignUpBody extends StatelessWidget{
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              // color: wPrimaryColor,
              //width: double.infinity,
              height: 136.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset('assets/icons/waves.svg'),
                  SizedBox(width: 7.w,),
                  Text(appName,
                    style: GoogleFonts.poppins(color: primaryColorDark,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 613.h,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: primaryColor,
                  ),
                  Positioned(
                    top: 30.h,
                    left: 87.w,
                    right: 88.w,
                    child: Text(createAccountText,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: primaryColorDark,
                          fontSize: 16.sp
                      ),
                    ),),
                  Positioned(
                    top: 121.h,
                    left: 0,
                    right: 0,
                    child: Padding(padding: EdgeInsets.only(left: 29.w, right: 28.w,),
                      child: SignUpForm(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}