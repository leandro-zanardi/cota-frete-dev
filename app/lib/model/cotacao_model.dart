import 'package:app/model/point_model.dart';

class CotacaoModel {
  late String userUid;
  late List<PointModel> points;
  late int cotacaoTime;

  CotacaoModel(
      {required String userUid,
      required List<PointModel> points,
      required int cotacaoTime}) {
    userUid = userUid;
    points = points;
    cotacaoTime = cotacaoTime;
  }
}
