import 'dart:convert';

import 'package:app/infra/api/api.dart';
import 'package:app/model/user_list_data.dart';

class ListAllUsersApi extends Api {
  Future<UserListData> listAllUsers(String? pageToken) async {
    Uri uri = Uri.parse(
        'https://us-central1-cota-frete-estudo.cloudfunctions.net/admin-listAllUsers');
    try {
      if (pageToken != null) {
        uri.queryParameters["nextPageToken"] = pageToken;
      }
      final Map<String, dynamic> retorno = await get(uri, headers: {
        "Content-Type": "application/json",
        "authorization": token ?? ""
      });

      if (retorno["error"] != true) {
        UserListData userListData = UserListData(
            users: retorno["userData"]["users"],
            pageToken: retorno["userData"]["pageToken"]);
        return userListData;
      } else {
        throw Exception(retorno["status"]);
      }
    } on Exception catch (_, e) {
      print(e);
      throw e;
    }
  }
}
