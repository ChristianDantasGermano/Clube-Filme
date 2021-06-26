import 'package:aplicativo/app/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashLoginPage extends StatefulWidget {
  @override
  SplashLoginPageState createState() => SplashLoginPageState();
}

class SplashLoginPageState extends State<SplashLoginPage> {
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      final auth = Modular.get<AuthController>();
      if (auth.status == AuthStatus.login) {
        Modular.to.pushReplacementNamed('/start');
      } else if (auth.status == AuthStatus.logoff) {
        Modular.to.navigate('/login/google');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
