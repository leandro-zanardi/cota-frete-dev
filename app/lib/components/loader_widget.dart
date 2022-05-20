import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  
  const LoaderWidget({Key? key, required this.visible}) : super(key: key);

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible,
        child: Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black45,
          ),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Carregando...",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Center(child: CircularProgressIndicator()),
                      ]))),
        ]));
  }
}
