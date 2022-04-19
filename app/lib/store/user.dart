import 'package:app/service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User? userCredential;

  @observable
  String? emailRegister;

  @observable
  String? emailRegisterError;

  @observable
  String? passwordRegister;

  @observable
  String? passwordRegisterError;

  @observable
  String? emailLogin;

  @observable
  String? emailLoginError;

  @observable
  String? passwordLogin;

  @observable
  String? passwordLoginError;

  @action
  Future<void> register() async {
    print(" Registrando Usuario $emailRegister");

    FirebaseAuthService service = GetIt.I.get<FirebaseAuthService>();
    try {
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
  Future<void> login() async {
    FirebaseAuthService service = GetIt.I.get<FirebaseAuthService>();

    try {
      await service.login(emailLogin!, passwordLogin!);
    } on Exception catch (_, e) {
      if (_ is FirebaseAuthException) {
        if (_.code == 'user-not-found') {
          //print('No user found for that email.');
          emailLoginError = _.message;
        } else if (_.code == 'wrong-password') {
          //print('Wrong password provided for that user.');
          passwordLoginError = _.message;
        }
      } else {
        emailLoginError = 'Erro generico';
        passwordLoginError = 'Erro generico';
      }
    }
  }

  @action
  void setUser(User? user) {
    userCredential = null;
  }

  bool get isLoggedin {
    if (userCredential != null) {
      return true;
    } else {
      return false;
    }
  }

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

  @action
  void validateEmailLogin(String value) {
    emailLogin = value;
    emailLoginError = null;
  }

  @action
  void validatePasswordLogin(String password) {
    passwordLogin = password;
    passwordLoginError = null;
  }
}
