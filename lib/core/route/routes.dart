import 'package:auto_route/auto_route.dart';
import 'package:flutter_test_app/core/route/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
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
            path: '/RootScreen',
            page: RootRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100),
        ///////////////////////////
        CustomRoute(
            path: '/SessionsScreen',
            page: SessionsRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100),
        ///////////////////////////
        CustomRoute(
            path: '/AddSessionScreen',
            page: AddSessionRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            durationInMilliseconds: 100),
      ];
}
