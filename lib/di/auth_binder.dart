import 'package:get/get.dart';
import 'package:userbook/data/services/api/auth_service_impl.dart';
import 'package:userbook/presentation/controllers/auth_controller.dart';

class AuthBinder extends Bindings{
  @override
  void dependencies() {
   Get.put(AuthServiceImpl(), permanent: true);
  }

}