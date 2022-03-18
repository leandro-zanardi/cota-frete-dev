import 'package:mobx/mobx.dart';

part 'user.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  String? emailRegister;

  @observable
  String? emailRegisterError;

  @observable
  String? passwordRegister;

  @action
  void register() {
    print(" Registrando Usuario $emailRegister");
  }

  @action
  void validateEmail(String value) {
    emailRegister = value;
    emailRegisterError = null;
  }
}
