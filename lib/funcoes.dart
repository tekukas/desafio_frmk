import 'dart:ui';
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

Color roxoFrwk(){
  return Color(0xff6800db);
}