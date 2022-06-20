import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget(
      {Key? key, required this.erro, required this.clearFunction})
      : super(key: key);

  final String? erro;

  final void Function() clearFunction;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: erro != null,
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black45,
          ),
          AlertDialog(
            title: const Text('Alerta'),
            content: Text(erro ?? ''),
            elevation: 24,
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  clearFunction();
                },
                child: const Text('OK'),
              ),
            ],
          )
        ]));
  }
}
