import 'package:app/model/point_model.dart';

class CotacaoModel {
  String? userUid;
  List<PointModel> points = [];
  int? cotacaoTime;

  CotacaoModel(this.userUid, this.points, this.cotacaoTime);
}
