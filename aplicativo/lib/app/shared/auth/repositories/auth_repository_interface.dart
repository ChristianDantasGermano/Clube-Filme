import 'package:aplicativo/app/shared/auth/models/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {
  Future<UserCredential> getGoogleLogin();
  Usuario? getUsuario();
  User? getUsuarioGoogle();
  Future preencherUsuario();
  Future getLogout();
  Future cadastrarFirebase();
}
