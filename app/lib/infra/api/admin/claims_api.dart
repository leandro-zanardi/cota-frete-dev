import 'package:app/infra/api/api.dart';

class ClaimsApi extends Api {
  Future<bool> setCustomClaims(String uuidUser) async {
    //TODO obter uuid do admin
    Uri uri = Uri.parse(
        'https://us-central1-cota-frete-estudo.cloudfunctions.net/admin-setCustomClaims');
    try {
      await post(uri, body: {"idToken": uuidUser});
      return true;
    } on Exception catch (_, e) {
      throw e;
    }
  }
}
