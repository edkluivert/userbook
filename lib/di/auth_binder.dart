import 'package:get/get.dart';
import 'package:userbook/core/data/remote/auth_manager.dart';
import 'package:userbook/data/services/auth_service.dart';

class AuthBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(AuthService(), permanent: true);
  }

}