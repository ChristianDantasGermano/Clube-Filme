import 'package:aplicativo/app/shared/auth/models/Usuario.dart';
import 'package:aplicativo/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Usuario? user;

  @override
  Future<UserCredential> getGoogleLogin() async {
    print("começo do get google login");
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    print("Antes da função sigInCredentials");
    var res = await _auth.signInWithCredential(credential);
    print("Antes do Cadastrar Firebase");
    cadastrarFirebase();
    print("Antes do Preencher Usuario");
    preencherUsuario();
    print("Antes de retornar credenciais");
    return res;
  }

  Usuario? getUsuario() {
    return user;
  }

  @override
  Future getLogout() {
    user!.clean();
    return _auth.signOut();
  }

  Future cadastrarFirebase() async {
    final idUser = _auth.currentUser!.uid.toString();
    CollectionReference usersRemote =
        FirebaseFirestore.instance.collection('Usuarios');

    await usersRemote.doc(idUser).set({
      "Imagem": _auth.currentUser!.photoURL.toString(),
      "Nome": _auth.currentUser!.displayName.toString(),
      "Email": _auth.currentUser!.email.toString(),
    });
  }

  Future preencherUsuario() async {
    final idUser = _auth.currentUser!.uid.toString();
    CollectionReference usersRemote =
        FirebaseFirestore.instance.collection('Usuarios');
    await usersRemote
        .doc(idUser)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        user = Usuario?.fromDocument(documentSnapshot);
      }
    });
  }
}
