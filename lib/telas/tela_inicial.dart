import 'package:desafio_frmk/funcoes.dart';
import 'package:desafio_frmk/telas/tabelas.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: roxoFrwk('sec'),
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "componentes/logoFRWK.png",
              height: 48,
            ),
            Text('Menu Principal',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Bem vindo ao aplicativo!',
              style: TextStyle(fontSize: 48),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Tabelas()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text('Acessar', style: TextStyle(fontSize: 40), textAlign: TextAlign.center,),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
            ),
          ],
        ),
      ),
    );
  }
}
