
import 'package:get/get.dart';
import 'package:userbook/data/model/user.dart';


abstract class AuthService extends GetxService{

//  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User?> createAccount({required String email,required String password});
  Future<void> signOut();

}