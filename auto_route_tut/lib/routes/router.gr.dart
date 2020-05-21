// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tut/pages/home_screen.dart';
import 'package:auto_route_tut/pages/second_screen.dart';
import 'package:auto_route_tut/routes/route_guards.dart';
import 'package:auto_route_tut/pages/login_screen.dart';
import 'package:auto_route_tut/pages/unknown_route.dart';

abstract class Routes {
  static const homeScreen = '/';
  static const secondScreen = '/second-screen';
  static const loginScreen = '/login-screen';
  static const all = {
    homeScreen,
    secondScreen,
    loginScreen,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.secondScreen: [AuthGuard],
      };
  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      case Routes.secondScreen:
        if (hasInvalidArgs<SecondScreenArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<SecondScreenArguments>(args);
        }
        final typedArgs = args as SecondScreenArguments;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SecondScreen(typedArgs.title).wrappedRoute(context),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.loginScreen:
        if (hasInvalidArgs<LoginScreenArguments>(args)) {
          return misTypedArgsRoute<LoginScreenArguments>(args);
        }
        final typedArgs =
            args as LoginScreenArguments ?? LoginScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginScreen(id: typedArgs.id),
          settings: settings,
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (context) => UnknownRouteScreen(settings.name),
          settings: settings,
        );
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//SecondScreen arguments holder class
class SecondScreenArguments {
  final String title;
  SecondScreenArguments({@required this.title});
}

//LoginScreen arguments holder class
class LoginScreenArguments {
  final double id;
  LoginScreenArguments({this.id = 20.0});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushHomeScreen() => pushNamed(Routes.homeScreen);

  Future pushSecondScreen(
          {@required String title, OnNavigationRejected onReject}) =>
      pushNamed(
        Routes.secondScreen,
        arguments: SecondScreenArguments(title: title),
        onReject: onReject,
      );

  Future pushLoginScreen({
    double id = 20.0,
  }) =>
      pushNamed(
        Routes.loginScreen,
        arguments: LoginScreenArguments(id: id),
      );
}
