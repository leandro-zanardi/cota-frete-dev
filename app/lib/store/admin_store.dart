import 'package:app/model/user_client.dart';
import 'package:app/service/admin_service.dart';
import 'package:app/service/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'admin_store.g.dart';

class AdminStore = _AdminStore with _$AdminStore;

abstract class _AdminStore with Store {
  @observable
  bool loading = false;

  @observable
  ObservableList<UserClient> userClients = ObservableList<UserClient>();

  @action
  void setUserClients(List<UserClient> clients) {
    userClients = ObservableList<UserClient>();
    userClients.addAll(clients);
  }

  Future<void> updateUserClients() async {
    loading = true;
    FirebaseAuthService firebaseAuthService =
        GetIt.I.get<FirebaseAuthService>();
    await firebaseAuthService.updateUserClients();
    loading = false;
  }

  @action
  Future<void> registerUserAdmin(String uuid, bool isAdmin) async {
    loading = true;
    try {
      await GetIt.I.get<AdminService>().setAdmin(uuid, isAdmin);
      await updateUserClients();
      loading = false;
    } catch (e) {
      loading = false;
      print(e);
    }
  }
}
