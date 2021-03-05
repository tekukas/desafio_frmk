import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> pegaDados(String link) async {
  final response =
  await http.get(link);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load');
  }
}

Color roxoFrwk(String op){
  if(op == 'main'){
    return Color(0xff6800db);
  }
  else if (op == 'sec'){
    return Color(0xffe0d0f2);
  }
  else if(op == 'ter') {
    return Colors.deepPurpleAccent[100];
  }
  else{
    return Colors.black;
  }
}