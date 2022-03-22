import 'package:app/service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @observable
  String? passwordRegisterError;

  @action
  Future<void> register() async {
    print(" Registrando Usuario $emailRegister");

    FirebaseAuthService service = FirebaseAuthService();
    try {
      UserCredential userCredential =
          await service.register(emailRegister!, passwordRegister!);

      print(userCredential);

      emailRegisterError = null;
      passwordRegisterError = null;
    } on Exception catch (_, e) {
      if (_ is FirebaseAuthException) {
        if (_.code == 'weak-password') {
          //Senha fraca.
          passwordRegisterError = _.message;
        } else if (_.code == 'email-already-in-use') {
         //E-Mail já está em uso
          emailRegisterError = _.message;
        } else {
          emailRegisterError = _.message;
        }
      } else {
        print('Erro generico');
        emailRegisterError = "Erro generico";
        passwordRegisterError = "Erro generico";
      }
    }
  }

  @action
  void login() {}

  @action
  void validateEmail(String value) {
    emailRegister = value;
    emailRegisterError = null;
  }

  @action
  void validatePassword(String password) {
    passwordRegister = password;
    passwordRegisterError = null;
  }
}
