// ignore_for_file: prefer_const_constructors

import 'package:app/store/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

final UserStore userStore = GetIt.I.get<UserStore>();

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors2 = <Color>[
      Color.fromARGB(255, 160, 218, 215),
      Color.fromARGB(255, 0, 188, 212)
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Register

            Observer(
                builder: (_) => Visibility(
                      visible: userStore.isRegister,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment(0.8,
                                  0.0), // 10% of the width, so there are ten blinds.
                              colors: <Color>[
                                Color.fromARGB(255, 160, 218, 215),
                                Color.fromARGB(255, 0, 188, 212)
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              "Crie sua conta",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Observer(builder: (context) {
                                return TextFormField(
                                  onChanged: (value) =>
                                      userStore.validateEmail(value),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      labelText: 'E-mail',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      errorText: userStore.emailRegisterError),
                                );
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Observer(builder: (context) {
                                return TextFormField(
                                  onChanged: (value) =>
                                      userStore.validatePassword(value),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      labelText: 'Senha',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      errorText:
                                          userStore.passwordRegisterError),
                                );
                              }),
                            ),
                            ElevatedButton(
                              onPressed: userStore.register,
                              child: const Text('Cadastrar'),
                            ),
                            InkWell(
                              onTap: () => userStore.toLogin(),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: const Text(
                                  "Já tem conta? Login!",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),

            //Login

            Observer(
              builder: (_) => Visibility(
                visible: !userStore.isRegister,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment(0.8,
                            0.0), // 10% of the width, so there are ten blinds.
                        colors: colors2),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Acesse sua conta",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Observer(builder: (context) {
                          return TextFormField(
                            onChanged: (value) =>
                                userStore.validateEmailLogin(value),
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'E-mail',
                                labelStyle: TextStyle(color: Colors.white),
                                errorText: userStore.emailLoginError),
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Observer(builder: (context) {
                          return TextFormField(
                            onChanged: (value) =>
                                userStore.validatePasswordLogin(value),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelText: 'Senha',
                                labelStyle: TextStyle(color: Colors.white),
                                errorText: userStore.passwordLoginError),
                          );
                        }),
                      ),
                      const Text(
                        "Esqueci a senha",
                        style: TextStyle(color: Colors.white),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await userStore.login();
                          if (userStore.isLoggedin) {
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        child: Text("Entrar"),
                      ),
                      InkWell(
                        onTap: () => userStore.toRegister(),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: const Text(
                            "Ainda não é um usuário? Registre-se!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const Text(
                        "É fornecedor? Trabalhe conosco!",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
