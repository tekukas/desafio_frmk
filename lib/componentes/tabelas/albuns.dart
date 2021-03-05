import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

import '../../funcoes.dart';

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
          tableHeaderBuilder: (String header) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(border: Border.all(width: 0.5),color: Color(0xffccaaf2)),
              child: Text(
                header,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.w700, fontSize: 14.0,color: Colors.black87),
              ),
            );
          },
          showColumnToggle: true,
          allowRowHighlight: true,
          rowHighlightColor: Colors.deepPurpleAccent[100].withOpacity(0.7),
          paginationRowCount: 20,
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