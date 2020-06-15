import 'package:flutter/material.dart';
import 'package:inherited_widget/localization.dart';

import 'package:todos_app_core/todos_app_core.dart';

import 'screens/add_edit_screen.dart';
import 'screens/home_screen.dart';

class InheritedWidgetApp extends StatelessWidget {
  const InheritedWidgetApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) =>
          InheritedWidgetLocalizations.of(context).appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        InheritedWidgetLocalizationsDelegate(),
      ],
      routes: {
        ArchSampleRoutes.home: (context) => HomeScreen(),
        ArchSampleRoutes.addTodo: (context) => AddEditScreen(),
      },
    );
  }
}
