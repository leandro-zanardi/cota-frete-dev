import 'package:app/model/capital_model.dart';
import 'package:app/model/fornecedor_model.dart';
import 'package:flutter/material.dart';

class DestinoWidget extends StatelessWidget {
  const DestinoWidget(
      {Key? key,
      required this.capitais,
      required this.origem,
      required this.destino,
      required this.editDestino})
      : super(key: key);

  final List<CapitalModel> capitais;
  final FornecedorOrigem origem;
  final FornecedorDestino destino;
  final void Function(FornecedorOrigem origem, FornecedorDestino destino)
      editDestino;

  List<Map<String, dynamic>> buildSimNao() {
    List<Map<String, dynamic>> simNao = [];
    simNao.add({"value": true, "label": "Sim"});
    simNao.add({"value": false, "label": "Não"});
    return simNao;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      color: Colors.white,
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) - 45,
            child: DropdownButton<bool>(
              value: destino.capital,
              items: buildSimNao()
                  .map((item) => DropdownMenuItem<bool>(
                      value: item["value"] as bool,
                      child: Text(item["label"] as String)))
                  .toList(),
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 1,
                color:
                    destino.capitalInvalida == null ? Colors.grey : Colors.red,
              ),
              onChanged: (item) {
                destino.capital = item ?? false;
                editDestino(origem, destino);
              },
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) + 60,
            child: DropdownButton<String>(
              hint: const Text("estado..."),
              value: destino.estado == '' ? null : destino.estado,
              items: capitais
                  .map((item) => DropdownMenuItem<String>(
                      value: item.estado, child: Text(item.estado)))
                  .toList(),
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 1,
                color:
                    destino.estadoInvalido == null ? Colors.grey : Colors.red,
              ),
              onChanged: (item) {
                destino.estado = item ?? '';
                editDestino(origem, destino);
              },
            ),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) - 40,
            height: 85,
            child: TextFormField(
                initialValue: destino.precoKm.toString(),
                onChanged: (String? value) {
                  if (value != null && value != '') {
                    destino.precoKm = double.tryParse(value) ?? 0;
                  } else {
                    destino.precoKm = 0;
                  }
                  editDestino(origem, destino);
                },
                decoration: InputDecoration(
                    labelText: 'Preço/km',
                    errorText: destino.precoKmInvalido,
                    errorMaxLines: 3,
                    errorStyle: TextStyle(overflow: TextOverflow.ellipsis))),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) - 40,
            height: 85,
            child: TextFormField(
                initialValue: destino.precoMin.toString(),
                onChanged: (String? value) {
                  if (value != null) {
                    destino.precoMin = double.tryParse(value) ?? 0;
                  } else {
                    destino.precoMin = 0;
                  }
                  editDestino(origem, destino);
                },
                decoration: InputDecoration(
                    labelText: 'Preço/Min.',
                    errorText: destino.precoMinInvalido,
                    errorMaxLines: 3,
                    errorStyle: TextStyle(overflow: TextOverflow.ellipsis))),
          ),
        ],
      ),
    );
  }
}

class OrigemWidget extends StatelessWidget {
  const OrigemWidget(
      {Key? key,
      required this.capitais,
      required this.origem,
      required this.destinos,
      required this.addDestino,
      required this.editDestino,
      required this.editOrigemCapital,
      required this.editOrigemEstado})
      : super(key: key);

  final List<CapitalModel> capitais;
  final FornecedorOrigem origem;
  final List<DestinoWidget> destinos;
  final void Function(String estado, bool isCapital) addDestino;
  final void Function(FornecedorOrigem origem, FornecedorDestino destino)
      editDestino;
  final void Function(FornecedorOrigem origem, bool capital) editOrigemCapital;
  final void Function(FornecedorOrigem origem, String estado) editOrigemEstado;

  List<Map<String, dynamic>> buildSimNao() {
    List<Map<String, dynamic>> simNao = [];
    simNao.add({"value": true, "label": "Sim"});
    simNao.add({"value": false, "label": "Não"});
    return simNao;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Origem:"),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: DropdownButton<String>(
                  hint: const Text("estado..."),
                  value: origem.estado == '' ? null : origem.estado,
                  items: capitais
                      .map((item) => DropdownMenuItem<String>(
                          value: item.estado, child: Text(item.estado)))
                      .toList(),
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 1,
                    color: origem.estadoInvalido == null
                        ? Colors.grey
                        : Colors.red,
                  ),
                  onChanged: (item) {
                    origem.estado = item ?? '';
                    editOrigemEstado(origem, item ?? '');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: 
                DropdownButton<bool>(
              value: origem.capital,
              items: buildSimNao()
                  .map((item) => DropdownMenuItem<bool>(
                      value: item["value"] as bool,
                      child: Text(item["label"] as String)))
                  .toList(),
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 1,
                color:
                    origem.capitalInvalida == null ? Colors.grey : Colors.red,
              ),
              onChanged: (item) {
                origem.capital = item ?? false;
                editOrigemCapital(origem, item ?? false);
              },
            ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(children: [
            Row(
              children: [
                const Text("Destinos:"),
                ElevatedButton(
                  onPressed: () => addDestino(origem.estado, origem.capital),
                  child: const Text("Novo Destino"),
                ),
              ],
            ),
            for (int x = 0; x < destinos.length; x++)
              DestinoWidget(
                capitais: capitais,
                origem: origem,
                destino: destinos[x].destino,
                editDestino: editDestino,
              )
          ]),
        )
      ],
    );
  }
}
