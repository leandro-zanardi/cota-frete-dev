import 'package:app/model/fornecedor_model.dart';
import 'package:app/model/i_dto.dart';

class FornecedorDTO implements IDTO {
  FornecedorModel fornecedor;

  FornecedorDTO({required this.fornecedor});

  @override
  Object fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  Map<String, dynamic> toMap() {
    try {
      Map<String, dynamic> fornecedorMap = <String, dynamic>{
        "logo": fornecedor.logo,
        "origens": origensToMap(fornecedor.origens)
      };
      return fornecedorMap;
    } catch (e) {
      print(e);
      throw Exception("Não foi possivel parsear os dados");
    }
  }

  List<Map<String, dynamic>> origensToMap(List<FornecedorOrigem> origens) {
    List<Map<String, dynamic>> origensList = [];
    for (FornecedorOrigem origem in origens) {
      Map<String, dynamic> origemMap = <String, dynamic>{
        "estado": origem.estado,
        "capital": origem.capital,
        "destinos": destinosToMap(origem.destinos)
      };
      origensList.add(origemMap);
    }
    return origensList;
  }

  List<Map<String, dynamic>> destinosToMap(List<FornecedorDestino> destinos) {
    List<Map<String, dynamic>> destinosList = [];
    for (FornecedorDestino destino in destinos) {
      Map<String, dynamic> destinoMap = <String, dynamic>{
        "estado": destino.estado,
        "capital": destino.capital,
        "preco_km": destino.precoKm,
        "preco_min": destino.precoMin
      };
      destinosList.add(destinoMap);
    }
    return destinosList;
  }
}
