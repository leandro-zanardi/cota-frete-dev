import 'dart:convert';

import 'package:app/service/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Api {
  String? get token {
    FirebaseAuthService authService = GetIt.I.get<FirebaseAuthService>();
    return authService.authToken;
  }

  Future<Map<String, dynamic>> get(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      Response response = await http.get(uri, headers: headers);
      return jsonDecode(utf8.decode(response.bodyBytes));
    } on Exception catch (_, e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> post(Uri uri,
      {Map<String, String>? headers, Object? body}) async {
    try {
      Response response = await http.post(uri,
          headers: headers, body: body, encoding: Encoding.getByName("utf-8"));
      return jsonDecode(utf8.decode(response.bodyBytes));
    } on Exception catch (_, e) {
      throw e;
    }
  }
}
