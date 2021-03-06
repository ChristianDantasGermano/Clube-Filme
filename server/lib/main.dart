import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:server/RemoteRepositories/emAlta_remoteRepository.dart';
import 'package:server/RemoteRepositories/sliders_remoteRepository.dart';
import 'package:server/RemoteRepositories/synchronize_remoteRepository.dart';
import 'package:server/RemoteRepositories/topCriticos_remoteRepository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sicronizar Banco com API',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sicronizar Banco com API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void testarFirebase() async {
    await Firebase.initializeApp();
    CollectionReference data = FirebaseFirestore.instance.collection('Atores');
    await data
        .add({
          "Imagem": "Sou bunito",
          "Nome": "Very muito bunito",
          "Popularidade": 8001
        })
        .then((value) => print("Foi-se"))
        .catchError((error) => print('Vish kk'));

    data.snapshots().listen((event) {
      event.docs.forEach((element) {
        print(element.data());
      });
    });

    print('Fim Teste Firabase!!!');
  }

  void consumirAPI() async {
    final synchronize = SynchronizeRemoteRepository();
    await synchronize.synchronize();
  }

  void emAlta() async {
    final emAlta = EmAltaRemoteRepository();
    await emAlta.preencherEmAlta();
  }

  void topCriticos() async {
    final topC = TopCriticosRemoteRepository();
    await topC.preencherTopCriticos();
  }

  void sliders() async {
    final slider = SlidersRemoteRepository();
    await slider.preencherSliders();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => consumirAPI(),
              child: const Text('Sincronizar API'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () => testarFirebase(),
              child: const Text('Testar Firebase'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: () => emAlta(),
              child: const Text('Preencher Em Alta'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
              onPressed: () => topCriticos(),
              child: const Text('Preencher Top Criticos'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
              ),
              onPressed: () => sliders(),
              child: const Text('Preencher Sliders'),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
