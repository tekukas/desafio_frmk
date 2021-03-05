import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';

import '../../funcoes.dart';

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