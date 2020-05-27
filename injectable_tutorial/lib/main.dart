import 'package:flutter/material.dart';
import 'package:injectable_tutorial/injection.dart';
import 'package:injectable_tutorial/presentation/counter_page.dart';
import 'package:provider/provider.dart';

import 'presentation/counter_change_notifier.dart';

void main() {
  configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        // Manually passing in the production repository
        create: (_) => getIt<CounterChangeNotifier>(),
        child: CounterPage()),
    );
  }
}


