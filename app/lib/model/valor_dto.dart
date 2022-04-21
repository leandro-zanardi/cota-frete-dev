import 'package:app/model/i_dto.dart';
import 'package:app/model/valor_model.dart';

class ValorDTO implements IDTO {
  @override
  ValorModel fromJson(Map<String, dynamic> json) {
    
    return ValorModel(
      json["fid"],
      json["nome"],
      json["preco"]
    );
  }
}
