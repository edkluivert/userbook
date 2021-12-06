import 'package:dio/dio.dart';
import 'package:userbook/core/app_string.dart';
import 'package:userbook/core/utils/notifier.dart';
import 'package:userbook/data/model/user.dart';
import 'package:userbook/data/services/exceptions/auth_exception.dart';

import 'auth_service.dart';


class AuthServiceImpl extends AuthService{

  final Dio _dio = Dio();


  // @override
  // Future<User> getCurrentUser() async{
  //   await Future.delayed(Duration(seconds: 2));
  //   return User;
  // }


  @override
  Future<void> signOut()async {}

  @override
  Future<User?> createAccount({required String email, required String password})async {
    User? user;
    try {
      Response response = await _dio.post(
        baseUrl,
        data: {
          "email":email,
          "password":password,
        },
      );
     if(response.statusCode == 201){
       print('user: ${response.data}');
       user = User.fromJson(response.data);
      Notifier.snackbar("Success", user.token);
     }else{
       //Notifier.snackbar("Error", response.data, true);
     }
    }on DioError catch (e) {
      print('user : ${e.message.toString()}');
      Notifier.snackbar("Error", "Something went wrong", true);
    }
    return user;

  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password)async {

    User? user;
    try {
      Response response = await _dio.post(
        baseUrl + '/api/login',
        data: {
          "email" : email,
          "password" : password
        },
      );
      print('User created: ${response.data}');
      user = User.fromJson(response.data);
    } on DioError catch (e) {
      AuthenticationException(message: e.toString());
    }
    return user!;
  }

  @override
  Future<User?> create({required User user})async {
    User? retrievedUser;

    try {
      var _baseUrl = "https://reqres.in/api";
      Response response = await _dio.post(_baseUrl + '/users',
        data: user.toJson(),
      );

     print('api: ${response.data}');
      retrievedUser = User.fromJson(response.data);
    } on DioError catch (e) {
      print('user:${e.message.toString()}');
    }

    return retrievedUser;
  }








}