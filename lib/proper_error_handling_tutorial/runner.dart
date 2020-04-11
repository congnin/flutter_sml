import 'package:flutter/material.dart';
import 'package:flutter_app/proper_error_handling_tutorial/post_change_notifier.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: ChangeNotifierProvider(
          create: (_) => PostChangeNotifier(),
          child: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Error Handling'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<PostChangeNotifier>(
                builder: (_, notifier, __) {
                  if (notifier.state == NotifierState.initial) {
                    return StyledText('Press the button 👇');
                  } else if (notifier.state == NotifierState.loading) {
                    return CircularProgressIndicator();
                  } else {
                    return notifier.post.fold(
                        (failure) => StyledText(failure.toString()),
                        (post) => StyledText(post.toString()));
                  }
                },
              ),
              RaisedButton(
                child: Text('Get Post'),
                onPressed: () async {
                  Provider.of<PostChangeNotifier>(context).getOnePost();
                },
              ),
            ],
          ),
        ));
  }
}

class StyledText extends StatelessWidget {
  final String text;

  const StyledText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40),
    );
  }
}
