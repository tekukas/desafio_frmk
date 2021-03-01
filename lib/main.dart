import 'package:flutter/material.dart';
import 'componentes/tela_splash.dart';
import 'funcoes.dart';

void main() {
  runApp(Frwk());
}

class Frwk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primaryColor: roxoFrwk(),
        accentColor: Colors.deepPurpleAccent[100],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurpleAccent[100],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TelaSplash(), //
    );
  }
}
