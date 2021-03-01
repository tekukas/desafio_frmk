import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import '../funcoes.dart';

class Tabelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tabelas',
            style: TextStyle(fontSize: 24),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Postagens'),
              Tab(text: 'Álbuns'),
              Tab(text: 'Todos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Postagens(),
            Albuns(),
            Todos(),
          ],
        ),
      ),
    );
  }
}

class Albuns extends StatefulWidget {
  @override
  _AlbunsState createState() => _AlbunsState();
}

class _AlbunsState extends State<Albuns> {
  String arqJson;

  @override
  Widget build(BuildContext context) {
    var json = jsonDecode(arqJson);
    var columns = [
      JsonTableColumn("id", label: "Id"),
      JsonTableColumn("title", label: "Título"),
    ];
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: JsonTable(
          json,
          columns: columns,
          showColumnToggle: true,
          allowRowHighlight: true,
          rowHighlightColor: Colors.deepPurpleAccent[100].withOpacity(0.7),
          paginationRowCount: 10,
          onRowSelect: (index, map) {
            print(index);
            print(map);
          },
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    pegaDados('https://jsonplaceholder.typicode.com/albums')
        .then((String result) {
      setState(() {
        arqJson = result;
      });
    });
  }
}

class Postagens extends StatefulWidget {
  @override
  _PostagensState createState() => _PostagensState();
}

class _PostagensState extends State<Postagens> {
  String arqJson;

  @override
  Widget build(BuildContext context) {
    var json = jsonDecode(arqJson);
    var columns = [
      JsonTableColumn("id", label: "Id"),
      JsonTableColumn("title", label: "Título"),
    ];
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: JsonTable(
          json,
          columns: columns,
          showColumnToggle: true,
          allowRowHighlight: true,
          rowHighlightColor: Colors.deepPurpleAccent[100].withOpacity(0.7),
          paginationRowCount: 10,
          onRowSelect: (index, map) {
            print(index);
            print(map);
          },
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    pegaDados('https://jsonplaceholder.typicode.com/posts')
        .then((String result) {
      setState(() {
        arqJson = result;
      });
    });
  }
}

class Todos extends StatefulWidget {
  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  String arqJson;

  @override
  Widget build(BuildContext context) {
    var json = jsonDecode(arqJson);
    String completo(value) => value ? "Sim" : "Não";
    var columns = [
      JsonTableColumn("id", label: "Id"),
      JsonTableColumn("title", label: "Título"),
      JsonTableColumn('completed', label: 'Completo?', valueBuilder: completo)
    ];
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: JsonTable(
          json,
          columns: columns,
          showColumnToggle: true,
          allowRowHighlight: true,
          rowHighlightColor: Colors.deepPurpleAccent[100].withOpacity(0.7),
          paginationRowCount: 10,
          onRowSelect: (index, map) {
            print(index);
            print(map);
          },
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    pegaDados('https://jsonplaceholder.typicode.com/todos')
        .then((String result) {
      setState(() {
        arqJson = result;
      });
    });
  }
}
