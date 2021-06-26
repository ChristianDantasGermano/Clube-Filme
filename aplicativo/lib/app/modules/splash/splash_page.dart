import 'package:aplicativo/app/modules/splash/splash_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      // Initialize FlutterFire:
      future: controller.initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(child: Text("Erro"));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          controller.login();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator());
      },
    ));
  }
}
