import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class Cat {
  String imageSrc;
  String name;
  int age;
  int votes;

  Cat(this.imageSrc, this.name, this.age, this.votes);

  operator ==(other) => (other is Cat) && (imageSrc == other.imageSrc);

  int get hashCode => imageSrc.hashCode;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'The Cat List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> CAT_NAMES = [
    "Tom",
    "Oliver",
    "Ginger",
    "Pontouf",
    "Madison",
    "Bubblita",
    "Bubbles"
  ];

  Random _random = Random();
  List<Cat> _cats = [];

  int next(int min, int max) => min + _random.nextInt(max - min);

  _MyHomePageState() : super() {
    for (int i = 200; i < 250; i += 10) {
      _cats.add(Cat("http://placekitten.com/200/${i}", CAT_NAMES[next(0, 6)],
          next(1, 32), 0));
    }
  }

  _buildItem(Cat cat, {int index = -1}) {
    return ListTile(
        key: Key("ListTile:${cat.hashCode.toString()}"),
        leading: CircleAvatar(
            backgroundImage: NetworkImage(cat.imageSrc), radius: 32.0),
        title: Text(cat.name, style: TextStyle(fontSize: 25.0)),
        subtitle: Text("This little thug is ${cat.age} year(s) old.",
            style: TextStyle(fontSize: 15.0)));
  }

  _onDismissed(int index) {
    _cats.remove(index);
  }

  Future<bool> _confirmDismiss(DismissDirection direction) async {
    return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm'),
            content: Text(
                'Are you sure you want to delete this cat?\n\nHe is cute you know...'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('No'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: _cats != null ? _cats.length : 0,
            itemBuilder: (context, index) {
              Cat cat = _cats[index];
              return Dismissible(
                  confirmDismiss: _confirmDismiss,
                  direction: DismissDirection.endToStart,
                  onDismissed: _onDismissed(index),
                  key: ValueKey(cat.hashCode.toString()),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(cat.imageSrc),
                      radius: 32.0,
                    ),
                    title: Text('${cat.name}'),
                    subtitle: Text('Age: ${cat.age}'),
                  ));
            }));
  }
}
