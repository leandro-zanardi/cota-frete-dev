import 'dart:convert';

import 'package:app/model/capital_model.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeCapitais {
  Future<List<CapitalModel>> getCapitais() async {
    List<CapitalModel> capitais = [];
    try {
      DatabaseReference ref =
          FirebaseDatabase.instance.ref("capitais/-N2wnm-IoolNSJmi-DFb/brasil");
      DataSnapshot snapshot = await ref.get();
      List<dynamic> json = jsonDecode(jsonEncode(snapshot.value));

      for (var capitalJson in json) {
        CapitalModel capitalModel = CapitalModel(
            capital: capitalJson["capital"], estado: capitalJson["estado"]);
        capitais.add(capitalModel);
      }
      return capitais;
    } catch (e) {
      rethrow;
    }
  }
}
