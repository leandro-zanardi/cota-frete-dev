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
    
    Container(
      padding: EdgeInsets.all(4),
      color: Colors.white,
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) -40,
            height: 60,
            child: TextFormField(
              initialValue: isCapital ? "Sim" : "Não",
              //onSaved: (String? value) => {},
              decoration: InputDecoration(
                labelText: 'Capital',
              )),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) -20,
            height: 60,
            child: TextFormField(
              initialValue: estado,
              //onSaved: (String? value) => {},
              decoration: InputDecoration(
                labelText: 'Estado',
              )),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) -12,
            height: 60,
            child: TextFormField(
              initialValue: precoKm.toString(),
              //onSaved: (String? value) => {},
              decoration: InputDecoration(
                labelText: 'Preço/km',
              )),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 4) -12,
            height: 60,
            child: TextFormField(
              initialValue: precoMinimo.toString(),
              //onSaved: (String? value) => {},
              decoration: InputDecoration(
                labelText: 'Preço/Min.',
              )),
          ),
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

        Container(
          color: Colors.white,
          height:70,
          child: Row(
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
