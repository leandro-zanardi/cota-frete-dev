import 'package:flutter/material.dart';

class FornecedoresView extends StatelessWidget {
  const FornecedoresView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fornecedores'),
      ),
      body: Center(child: Text('Fornecedores'))
    );
  }
}
