import 'package:app/store/fornecedor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';


final FornecedorStore fornecedorStore = GetIt.I.get<FornecedorStore>();
class ConfiguracaoFornecedorView extends StatelessWidget {
  const ConfiguracaoFornecedorView({Key? key}) : super(key: key);

  List<Widget> buildListaFornecedores() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    fornecedorStore.getFornecedores();

    return Scaffold(
        appBar: AppBar(
          title: const Text('configurações'),
        ),
        body: Center(
          child: Observer(
            builder: (_) => Column(
              children: [
                const Text('Configurações de Fornecedor',
                    style: TextStyle(
                      height: 3,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    )),
                ...buildListaFornecedores()
              ],
            ),
          ),
        ));
  }
}
