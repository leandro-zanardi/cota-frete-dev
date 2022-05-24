import 'dart:convert';

import 'package:app/model/fornecedor_model.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeFornecedor {
  Future<List<FornecedorModel>> getFornecedores() async {
    List<FornecedorModel> retorno = [];
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("fornecedor");
      DataSnapshot snapshot = await ref.get();
      Map<String, dynamic> json = jsonDecode(jsonEncode(snapshot.value));

      List<String> fornecedores = json.keys.toList();

      fornecedores.forEach((nomeFornecedor) {
        List<FornecedorOrigem> origens = [];
        Map<String, dynamic> fornecedor = json[nomeFornecedor];

        for (int x = 0; x < fornecedor["origens"].length; x++) {
          FornecedorOrigem origem =
              FornecedorOrigem(capital: false, destinos: [], estado: "teste");
          origens.add(origem);
        }

        FornecedorModel model =
            FornecedorModel(nome: nomeFornecedor, origens: origens);

        retorno.add(model);
      });

      return retorno;
    } catch (e) {
      rethrow;
    }
  }
}
