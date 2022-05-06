import 'dart:convert';

import 'package:app/infra/api/api.dart';

class ClaimsApi extends Api {
  Future<bool> setCustomClaims(String uuidUser) async {
    //TODO obter uuid do admin
    Uri uri = Uri.parse(
        'https://us-central1-cota-frete-estudo.cloudfunctions.net/admin-setCustomClaims');
    try {
      final Map<String, dynamic> retorno =
          await post(
            uri,
            headers: {"Content-Type": "application/json"},
            body: json.encode({"idToken": uuidUser})
            );
      if (retorno.containsKey(["status"]) && retorno["status"] == "success") {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_, e) {
      print(e);
      throw e;
    }
  }
}
