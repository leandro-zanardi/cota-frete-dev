import 'package:app/model/fornecedor_model.dart';
import 'package:app/model/regiao_frete_model.dart';
import 'package:flutter/material.dart';

class DestinoWidget extends StatelessWidget {
  const DestinoWidget(
      {Key? key,
      required this.origem,
      required this.destino,
      required this.editDestino})
      : super(key: key);

  final FornecedorOrigem origem;
  final RegiaoFreteModel destino;
  final void Function(FornecedorOrigem origem, RegiaoFreteModel destino)
      editDestino;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      color: Colors.white,
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) - 40,
            height: 60,
            child: TextFormField(
                initialValue: destino.capital ? "Sim" : "Não",
                onSaved: (String? value) {
                  destino.capital = value == 'Sim' ? true : false;
                  editDestino(origem, destino);
                },
                decoration: InputDecoration(
                    labelText: 'Capital', errorText: destino.capitalInvalida)),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) - 20,
            height: 60,
            child: TextFormField(
                initialValue: destino.estado,
                onChanged: (String? value) {
                  destino.estado = value ?? '';
                  editDestino(origem, destino);
                },
                decoration: InputDecoration(
                    labelText: 'Estado', errorText: destino.estadoInvalido)),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) - 12,
            height: 60,
            child: TextFormField(
                initialValue: destino.precoKm.toString(),
                //onSaved: (String? value) => {},
                decoration: InputDecoration(
                  labelText: 'Preço/km',
                )),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) - 12,
            height: 60,
            child: TextFormField(
                initialValue: destino.precoMin.toString(),
                //onSaved: (String? value) => {},
                decoration: InputDecoration(
                    labelText: 'Preço/Min.',
                    errorText: destino.precoMinInvalido)),
          ),
        ],
      ),
    );
  }
}

class OrigemWidget extends StatelessWidget {
  const OrigemWidget(
      {Key? key,
      required this.origem,
      required this.destinos,
      required this.addDestino,
      required this.editDestino,
      required this.editOrigemCapital,
      required this.editOrigemEstado})
      : super(key: key);

  final FornecedorOrigem origem;
  final List<DestinoWidget> destinos;
  final void Function(String estado, bool isCapital) addDestino;
  final void Function(FornecedorOrigem origem, RegiaoFreteModel destino)
      editDestino;
  final void Function(FornecedorOrigem origem, bool capital) editOrigemCapital;
  final void Function(FornecedorOrigem origem, String estado) editOrigemEstado;

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
              SizedBox(
                width: (MediaQuery.of(context).size.width / 4) - 12,
                height: 60,
                child: TextFormField(
                    initialValue: origem.estado,
                    onSaved: (String? value) => {},
                    decoration: InputDecoration(
                      labelText: 'Estado',
                    )),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 4) - 12,
                height: 60,
                child: TextFormField(
                    initialValue: origem.capital ? "Sim" : "Não",
                    onSaved: (String? value) => {},
                    decoration: InputDecoration(
                      labelText: 'Capital',
                    )),
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
