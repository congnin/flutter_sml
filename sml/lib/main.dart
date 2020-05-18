import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/component/navigation.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.amber,
      primaryColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.red,
      backgroundColor: Colors.amber,
      textTheme: _appTextTheme(base.textTheme));
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
          headline: base.headline.copyWith(
            fontWeight: FontWeight.w500,
          ),
          title:
              base.title.copyWith(fontSize: 18.0, fontStyle: FontStyle.italic),
          caption: base.caption
              .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
          button: base.button.copyWith(
              //fontSize: 23.9,

              ),
          body1: base.body1.copyWith(
            fontSize: 16.9,
            fontFamily: "Lobster",
            color: Colors.white,
          ))
      .apply(
        fontFamily: "Lobster",
        displayColor: Colors.amber,
        //bodyColor: Colors.red
      );
}

//void main() async {
//  SystemChrome.setEnabledSystemUIOverlays([]);
//  runApp(MyApp());
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tune In Music Player",
      home: FirstRoute(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "homeScreen" named route. In this case, the app starts
    // on the HomeScreen widget.
    initialRoute: 'homeScreen',
    routes: {
      // When navigating to the "homeScreen" route, build the HomeScreen widget.
      'homeScreen': (context) => FirstScreen(),
      // When navigating to the "secondScreen" route, build the SecondScreen widget.
      'secondScreen': (context) => SecondScreen(),
    },
  ));
}

