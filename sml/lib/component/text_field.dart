import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: TextFieldApp()));
}

class TextFieldApp extends StatefulWidget {
  @override
  _textApp createState() => new _textApp();
}

class _textApp extends State<TextFieldApp> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text("Text Field App"),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "User name : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              /* onChanged: (String text){  //  on Changed ie while entering value real time.
              setState(() {
                _text = text;
              });
            },*/
              onSubmitted: (String text) {
                setState(() {
                  _text = text;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter User Name", labelText: "User Name"
              ),
            ),
          ),
          Text(_text)
        ],
      ),
    );
  }
}

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
