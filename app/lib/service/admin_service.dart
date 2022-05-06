import 'package:app/infra/api/admin/claims_api.dart';
import 'package:get_it/get_it.dart';

class AdminService {
  Future<bool> setAdmin(String userUUID) async {
    return await GetIt.I.get<ClaimsApi>().setCustomClaims(userUUID);
  }
}
