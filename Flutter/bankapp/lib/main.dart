import 'package:bankapp/Telas/TelaInicial.dart';
import 'package:flutter/material.dart';
import 'Telas/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool authenticated = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Color(0xff5B2434),
        backgroundColor: Color(0xffffffff),
      ),
      home: authenticated? TelaInicial() : TelaLogin(),
    );
  }
}

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}