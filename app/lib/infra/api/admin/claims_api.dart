import 'dart:convert';

import 'package:app/infra/api/api.dart';

class ClaimsApi extends Api {
  Future<bool> setCustomClaims(String uuidUser, bool isAdmin) async {

    Uri uri = Uri.parse(
        'https://us-central1-cota-frete-estudo.cloudfunctions.net/admin-setCustomClaims');
    try {
      final Map<String, dynamic> retorno = await post(uri,
          headers: {"Content-Type": "application/json", "authorization": token ?? ""},
          body: json
              .encode({"idToken": uuidUser, "isAdmin": isAdmin}));
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
