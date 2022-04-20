import 'package:app/model/point_model.dart';
import 'package:app/model/valor_model.dart';

class CotacaoModel {
  String? userUid;
  List<PointModel> points = [];
  int? cotacaoTime;
  List<ValorModel> valores = [];

  CotacaoModel(this.userUid, this.points, this.cotacaoTime, this.valores);
}
