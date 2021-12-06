import 'package:get/get.dart';
import 'package:userbook/core/state/authentication_state.dart';
import 'package:userbook/data/model/user.dart';
import 'package:userbook/data/services/api/auth_service_impl.dart';


class AuthenticationController extends GetxController {
  final AuthServiceImpl authServiceImpl;
  final _authenticationStateStream = const AuthenticationState().obs;

  AuthenticationState get state => _authenticationStateStream.value;

  AuthenticationController(this.authServiceImpl);

  @override
  void onInit() {
   // _getAuthenticatedUser();
    super.onInit();
  }

  Future<User?> createAccount({
   required String email, required String password
  }) async {
    final user = await authServiceImpl.createAccount(email: email, password: password);
    _authenticationStateStream.value = Authenticated(user: user!);
  }

  void signOut() async {
    await authServiceImpl.signOut();
    _authenticationStateStream.value = UnAuthenticated();
  }

  // void _getAuthenticatedUser() async {
  //   _authenticationStateStream.value = AuthenticationLoading();
  //
  //   final user = await authServiceImpl.getCurrentUser();
  //
  //   if (user == null) {
  //     _authenticationStateStream.value = UnAuthenticated();
  //   } else {
  //     _authenticationStateStream.value = Authenticated(user: user);
  //   }
  // }
}