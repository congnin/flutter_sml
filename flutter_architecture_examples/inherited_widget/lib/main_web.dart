import 'dart:html';

import 'package:flutter/material.dart';
import 'package:inherited_widget/app.dart';
import 'package:inherited_widget/state_container.dart';
import 'package:key_value_store_web/key_value_store_web.dart';
import 'package:todos_repository_local_storage/todos_repository_local_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(StateContainer(
    child: const InheritedWidgetApp(),
    repository: LocalStorageRepository(
      localStorage: KeyValueStorage(
        'inherited_widget_todos',
        WebKeyValueStore(window.localStorage),
      ),
    ),
  ));
}
