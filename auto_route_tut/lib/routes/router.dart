import 'package:auto_route/auto_route_annotations.dart';
import 'package:auto_route_tut/pages/home_screen.dart';
import 'package:auto_route_tut/pages/login_screen.dart';
import 'package:auto_route_tut/pages/second_screen.dart';
import 'package:auto_route_tut/pages/unknown_route.dart';
import 'package:auto_route_tut/routes/route_guards.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  generateArgsHolderForSingleParameterRoutes: true,
  routesClassName: 'Routes',
//  routePrefix: '/prefix/',
)
class $Router {
  @initial
  HomeScreen homeScreen;

  @CustomRoute(fullscreenDialog: true)
  @GuardedBy([AuthGuard])
  SecondScreen secondScreen;

  LoginScreen loginScreen;

  @unknownRoute
  UnknownRouteScreen unknownRouteScreen;
}