import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Clube do Filme',
                  style: TextStyle(
                      fontSize: 70,
                      color: Colors.black,
                      fontFamily: 'Tangerine')),
              Padding(padding: EdgeInsets.all(30.0)),
              SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Login',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'Roboto')),
                      onPressed: () {
                        Modular.to.navigate('/start');
                      })),
              Padding(padding: EdgeInsets.all(25.0)),
              SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Visitante',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'Roboto')),
                      onPressed: () {}))
            ],
          ),
        ));
  }
}
