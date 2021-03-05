import 'package:desafio_frmk/telas/tela_inicial.dart';
import 'package:flutter/material.dart';
import '../funcoes.dart';

final Tween _tween = Tween(begin: 0.0, end: 1.0);

class TelaSplash extends StatefulWidget {
  @override
  _TelaSplashState createState() => _TelaSplashState();
}

class _TelaSplashState extends State<TelaSplash> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TelaInicial()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: roxoFrwk('main')),
        child: Center(
          child: TweenAnimationBuilder(
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 2),
            tween: _tween,
            builder: (BuildContext context, size, Widget child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? Image.asset(
                          "componentes/logoFRWK.png",
                          width: MediaQuery.of(context).size.width * size,
                          fit: BoxFit.fitWidth,
                        )
                      : Image.asset(
                          "componentes/logoFRWK.png",
                          height: MediaQuery.of(context).size.height * size,
                          fit: BoxFit.fitHeight,
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
