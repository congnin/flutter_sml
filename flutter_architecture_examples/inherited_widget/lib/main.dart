import 'package:flutter/material.dart';
import 'package:key_value_store_flutter/key_value_store_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todos_repository_local_storage/todos_repository_local_storage.dart';
import 'app.dart';
import 'state_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(StateContainer(
    child: const InheritedWidgetApp(),
    repository: LocalStorageRepository(
      localStorage: KeyValueStorage(
        'inherited_widget_todos',
        FlutterKeyValueStore(await SharedPreferences.getInstance()),
      ),
    ),
  ));
}
