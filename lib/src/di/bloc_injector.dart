import 'package:flutter_app/src/app.dart';
import 'package:flutter_app/src/di/bloc_module.dart';
import 'package:inject/inject.dart';
import 'bloc_injector.inject.dart' as g;

@Injector(const [BlocModule])
abstract class BlocInjector{
  @provide
  App get app;

  static final create = g.BlocInjector$Injector.create;
}