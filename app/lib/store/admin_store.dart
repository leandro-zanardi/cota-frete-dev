import 'package:app/service/admin_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'admin_store.g.dart';

class AdminStore = _AdminStore with _$AdminStore;

abstract class _AdminStore with Store {
  @observable
  String? userUUIDTextField;
  @observable
  bool loading = false;

  @action
  void setUserUUITextField(String value) {
    userUUIDTextField = value;
  }

  @action
  Future<bool> registerUserAdmin() async {
    loading = true;
    if (userUUIDTextField != null) {
      loading = false;
      return await GetIt.I.get<AdminService>().setAdmin(userUUIDTextField!);
    } else {
      loading = false;
      return false;
    }
  }
}
