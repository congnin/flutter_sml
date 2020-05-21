import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'routes/route_guards.dart';
import 'routes/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (ctx, __) => ExtendedNavigator<Router>(
        router: Router(),
        guards: [AuthGuard()],),
    );
  }
}


