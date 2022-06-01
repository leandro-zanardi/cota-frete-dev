import 'dart:convert';

import 'package:app/model/fornecedor_model.dart';
import 'package:app/model/regiao_frete_model.dart';
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
          List<RegiaoFreteModel> destinos = [];

          Map<String, dynamic> origemMap = fornecedor["origens"][x];

          for (int y = 0; y < origemMap["destinos"].length; y++) {
            Map<String, dynamic> destinoMap = origemMap["destinos"][y];
            RegiaoFreteModel freteModel = RegiaoFreteModel(
                estado: destinoMap["estado"],
                capital: destinoMap["capital"],
                precoKm: double.tryParse(destinoMap["preco_km"].toString()) ?? 0.0,
                precoMin: double.tryParse(destinoMap["preco_min"].toString()) ?? 0.0);
            destinos.add(freteModel);
          }

          FornecedorOrigem origem = FornecedorOrigem(
              capital: origemMap["capital"],
              destinos: destinos,
              estado: origemMap["estado"]);
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

  Future<void> salvarFornecedor(FornecedorModel fornecedor) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("fornecedor/${fornecedor.nome}");

    await ref.set(fornecedor);

  }
}
