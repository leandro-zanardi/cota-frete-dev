// ignore_for_file: prefer_const_constructors

import 'package:app/store/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final UserStore userStore = UserStore();

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 178, 208, 213),
                borderRadius: const BorderRadius.all(const Radius.circular(8)),
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text("Crie sua conta"),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Observer(
                      builder: (context) {
                        return TextField(
                          onChanged: (value) => userStore.validateEmail(value),
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                            labelText: 'E-Mail',
                            errorText: userStore.emailRegisterError
                          ),
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Observer(
                      builder: (context) {
                        return TextField(
                          onChanged: (value) => userStore.validatePassword(value),
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Senha',
                              errorText: userStore.passwordRegisterError
                              ),
                        );
                      }
                    ),
                  ),
                  ElevatedButton(
                    onPressed: userStore.register,
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(8),
              child: Column(
                children: const [
                  ElevatedButton(
                    onPressed: null,
                    child: Text("Entrar"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
