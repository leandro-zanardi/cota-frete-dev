import 'package:app/components/auto_complete/address_search.dart';
import 'package:app/components/auto_complete/suggestion.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AutoComplete extends StatefulWidget {
  const AutoComplete({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AutoCompleteState createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onTap: () async {

              final String sessionToken = const Uuid().v4();
              final Suggestion? result = await showSearch(
                context: context,
                delegate: AddressSearch(sessionToken),
              );

              // This will change the text displayed in the TextField
              if (result != null) {
                setState(() {
                  _controller.text = result.description;
                });
              }

            },
            decoration: InputDecoration(
              icon: Container(
                margin: const EdgeInsets.only(left: 20),
                width: 10,
                height: 10,
                child: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
              hintText: "Enter your shipping address",
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 8.0, top: 16.0),
            ),
          )
        ],
      )
    );
  }
}
