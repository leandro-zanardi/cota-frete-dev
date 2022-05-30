import 'package:flutter/material.dart';

class DestinoWidget extends StatelessWidget {
  const DestinoWidget(
      {Key? key,
      required this.isCapital,
      required this.estado,
      required this.precoMinimo,
      required this.precoKm})
      : super(key: key);

  final bool isCapital;
  final String estado;
  final double precoMinimo;
  final double precoKm;

  @override
  Widget build(BuildContext context) {
    return 
    
    SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          // TextFormField(
          //   //onChanged: (value) => ,
          //   initialValue: isCapital ? "Sim" : "Não",
          //   obscureText: false,
          //   decoration: InputDecoration(labelText: 'Capital', errorText: null),
          // ),
          // TextFormField(
          //   //onChanged: (value) => ,
          //   initialValue: estado,
          //   obscureText: false,
          //   decoration: InputDecoration(labelText: 'Estado', errorText: null),
          // ),
          // TextFormField(
          //   //onChanged: (value) => ,
          //   initialValue: precoKm.toString(),
          //   obscureText: false,
          //   decoration: InputDecoration(labelText: 'Preço/km', errorText: null),
          // ),
          // TextFormField(
          //   //onChanged: (value) => ,
          //   initialValue: precoMinimo.toString(),
          //   obscureText: false,
          //   decoration:
          //       InputDecoration(labelText: 'Preço Minimo', errorText: null),
          // ),
        ],
      ),
    );
  }
}

class OrigemWidget extends StatelessWidget {
  const OrigemWidget(
      {Key? key,
      required this.isCapital,
      required this.estado,
      required this.destinos,
      required this.addDestino})
      : super(key: key);

  final bool isCapital;
  final String estado;
  final List<DestinoWidget> destinos;
  final void Function(String estado, bool isCapital) addDestino;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text("Origem"),
          ElevatedButton(
            onPressed: () => addDestino(estado, isCapital),
            child: Text("Novo Destino"),
          ),
        ],),

        SizedBox(
          height:50,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
            Text(estado),
            Text(isCapital ? "Sim" : "Não")
          ],),
        ),
        
         Column(children: [
           for(int x=0; x<destinos.length; x++)
            DestinoWidget(
              isCapital: destinos[x].isCapital, 
              estado: destinos[x].estado,
              precoMinimo: destinos[x].precoMinimo,
              precoKm: destinos[x].precoKm)
           ]
         )
      ],
    );
  }
}
