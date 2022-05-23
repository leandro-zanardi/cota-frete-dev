import 'package:app/model/fornecedor_model.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseRealtimeFornecedor {
  Future<List<FornecedorModel>> getFornecedores() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("fornecedor");
    ref.get().then((value) => {
      print(value)
    });

    List<FornecedorModel> retorno = [];

    return retorno;
  }
}
