
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:userbook/core/utils/app_string.dart';
import 'package:userbook/data/model/login_request_model.dart';
import 'package:userbook/data/model/login_response_model.dart';
import 'package:userbook/data/model/sign_up_request_model.dart';
import 'package:userbook/data/model/sign_up_response_model.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class AuthService extends GetConnect {


  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}