import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sobre'),
        ),
        body: Center(
            child: Column(children: [
          Column(
            children: [
              const Text('Sobre o Aplicativo',
                  style: TextStyle(
                    height: 3,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  )),
              const Text('Comparador de Logistica',
                  style: TextStyle(
                      height: 5, fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: const Text(
                    'Este aplicativo foi desenvolvido visando ajudar as pessoas a escolher a melhor opção frete para o transporte de produtos.',
                    style: TextStyle(height: 2, fontWeight: FontWeight.w400)),
              )
            ],
          ),
        ])));
  }
}
