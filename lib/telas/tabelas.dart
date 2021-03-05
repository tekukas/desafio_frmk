import 'package:desafio_frmk/componentes/tabelas/albuns.dart';
import 'package:desafio_frmk/componentes/tabelas/postagens.dart';
import 'package:desafio_frmk/componentes/tabelas/to_dos.dart';
import 'package:flutter/material.dart';
import '../funcoes.dart';

class Tabelas extends StatelessWidget {
  final List<Tab> abas = <Tab>[
    Tab(text: 'Postagens'),
    Tab(text: 'Álbuns'),
    Tab(text: 'To Do\'s'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: abas.length,
      child: Scaffold(
        backgroundColor: roxoFrwk('sec'),
        appBar: AppBar(
          title: Text(
            'Tabelas',
            style: TextStyle(fontSize: 24),
          ),
          bottom: TabBar(
            tabs: abas,
          ),
        ),
        body: TabBarView(
          children: [
            Postagens(),
            Albuns(),
            ToDos(),
          ],
        ), // : CircularProgressIndicator(),
      ),
    );
  }
}