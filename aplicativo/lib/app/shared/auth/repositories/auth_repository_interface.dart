import 'package:aplicativo/app/shared/auth/models/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<UserCredential> getGoogleLogin();
  Usuario? getUsuario();
  Future getLogout();
}
