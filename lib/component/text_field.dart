import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://medium.com/flutter-community/a-deep-dive-into-flutter-textfields-f0e676aaab7a
class TextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusNode nodeOne = FocusNode();
    FocusNode nodeTwo = FocusNode();

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Enter a text 1'),
              keyboardType: TextInputType.datetime,
              textCapitalization: TextCapitalization.sentences,
              focusNode: nodeOne,
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w700, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Enter a text 2', helperText: "What's up?"),
              focusNode: nodeTwo,
              cursorColor: Colors.red,
              cursorRadius: Radius.circular(16.0),
              cursorWidth: 16.0,
              maxLength: 14,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          RaisedButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(nodeTwo);
            },
            child: Text("Next Field"),
          )
        ],
      )),
    );
  }
}
