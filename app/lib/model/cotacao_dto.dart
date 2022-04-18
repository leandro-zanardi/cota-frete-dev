import 'package:app/model/cotacao_model.dart';
import 'package:app/model/i_dto.dart';
import 'package:app/model/point_model.dart';

class CotacaoDTO implements IDTO {
  @override
  CotacaoModel fromJson(Map<String, dynamic> json) {
    print(json.toString());

    String userUid = json["userUid"];
    List<PointModel> points = _mapToPoints(json["points"]);
    int cotacaoTime = json["cotacaoTime"];

    CotacaoModel model = CotacaoModel(
        userUid: userUid, points: points, cotacaoTime: cotacaoTime);
    return model;
  }

  Map<String, dynamic> toFirebaseDate(CotacaoModel model) {
    Map<String, dynamic> mapModel = Map<String, dynamic>();
    mapModel["userUid"] = model.userUid;
    mapModel["points"] = _pointsToMap(model.points);
    mapModel["cotacaoTime"] = model.cotacaoTime;
    return mapModel;
  }

  List<Map<String, dynamic>> _pointsToMap(List<PointModel> points) {
    List<Map<String, dynamic>> pointsMap = [];
    for (int x = 0; x < points.length; x++) {
      Map<String, dynamic> point = Map<String, dynamic>();
      point["lat"] = points[x].lat;
      point["lng"] = points[x].lng;
      point["city"] = points[x].city;
      pointsMap.add(point);
    }
    return pointsMap;
  }

  List<PointModel> _mapToPoints(List<Map<String, dynamic>> listMap) {
    List<PointModel> points = [];
    //TODO
    return points;
  }
}
