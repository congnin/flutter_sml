import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tut/routes/router.gr.dart';

class AuthGuard extends RouteGuard {
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName, Object arguments) async {
    if (isLoggedIn) {
      return true;
    }
    navigator.pushReplacementNamed(Routes.loginScreen);
    return true;
  }
}

var isLoggedIn = true;