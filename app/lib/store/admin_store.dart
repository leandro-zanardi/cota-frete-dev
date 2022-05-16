import 'package:app/model/user_client.dart';
import 'package:app/service/admin_service.dart';
import 'package:app/service/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'admin_store.g.dart';

class AdminStore = _AdminStore with _$AdminStore;

abstract class _AdminStore with Store {
  @observable
  String? userUUIDTextField;
  @observable
  bool loading = false;
  @observable
  bool isAdmin = false;

  @observable
  ObservableList<UserClient> userClients = ObservableList<UserClient>();

  @action
  void setUserUUITextField(String value) {
    userUUIDTextField = value;
  }

  @action
  void setUserClients(List<UserClient> clients) {
    userClients = ObservableList<UserClient>();
    userClients.addAll(clients);
  }

  Future<void> updateUserClients() async {
    // TODO
    // instanciar o servicer
    // chamar o service q popula o setUserCLients
    FirebaseAuthService firebaseAuthService =
        GetIt.I.get<FirebaseAuthService>();
    firebaseAuthService.updateUserClients();
  }

  @action
  Future<bool> registerUserAdmin() async {
    loading = true;
    if (userUUIDTextField != null) {
      loading = false;
      return await GetIt.I
          .get<AdminService>()
          .setAdmin(userUUIDTextField!, isAdmin);
    } else {
      loading = false;
      return false;
    }
  }
}
