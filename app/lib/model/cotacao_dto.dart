import 'package:app/model/cotacao_model.dart';
import 'package:app/model/i_dto.dart';

class CotacaoDTO implements IDTO {
  String? id;

  @override
  CotacaoModel? fromFirebaseData(Object? data) {
    //TODO interpretar o data
    print(data.toString());

    return CotacaoModel(id: "id");
  }

  @override
  Object fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
