import 'package:auto_route/auto_route.dart';
import 'package:flutter_test_app/core/route/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // add your routes here
        CustomRoute(
          path: '/',
          page: SplashRoute.page,
          initial: true,
        ),
        // // auth ////////////////////////////////////////////////////
        CustomRoute(
            path: '/LoginScreen',
            page: LoginRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100),
        ////////////////////////////////////////////////////
        CustomRoute(
            path: '/SignupScreen',
            page: SignUpRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100),
        ///////////////////////////
        CustomRoute(
            path: '/MainScreen',
            page: MainRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100),
      ];
}
