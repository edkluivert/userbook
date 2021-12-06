
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userbook/core/app_color.dart';

class AppTextStyles{
  static TextStyle inputText = GoogleFonts.poppins(color: textInputColor,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp
  );

  static TextStyle btnText = GoogleFonts.poppins(
    fontSize: 16.sp,
    color: primaryColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle appNameStyle =  GoogleFonts.poppins(color: primaryColorDark,
      fontWeight: FontWeight.w700,
      fontSize: 18.sp
  );

  static TextStyle subText2 =  GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: primaryColorDark,
      fontSize: 16.sp
  );


  static TextStyle subText1 = GoogleFonts.poppins(
      fontSize: 14.sp,
      color: greyDark,
      fontWeight: FontWeight.w600
  );

  static TextStyle subText = GoogleFonts.poppins(
      color: primaryColorDark,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600);

}