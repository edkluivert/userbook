import 'package:get/get.dart';
import 'package:userbook/presentation/features/home/home_screen.dart';
import 'package:userbook/presentation/features/login/login_screen.dart';
import 'package:userbook/presentation/features/sign_up/sign_up_screen.dart';

import 'app_routes.dart';

Duration get transitionDuration => const Duration(milliseconds:900);

class AppPages {
  static var list = [
  GetPage(
  name: AppRoutes.login,
  page: () => const LoginScreen(),
  transition:Transition.rightToLeftWithFade,
  transitionDuration: transitionDuration,
  // binding: RootBinding(),
  ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpScreen(),
      transition:Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      transition:Transition.rightToLeftWithFade,
      transitionDuration: transitionDuration,
      // binding: RootBinding(),
    ),
  ];
}