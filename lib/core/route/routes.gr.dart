// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter_test_app/features/auth/presentation/pages/auth_screens/login_screen.dart'
    as _i2;
import 'package:flutter_test_app/features/auth/presentation/pages/auth_screens/signup_screen.dart'
    as _i5;
import 'package:flutter_test_app/features/auth/presentation/pages/welcome_screens/splash_screen.dart'
    as _i6;
import 'package:flutter_test_app/features/booking_sessions/presentation/pages/add_session_screen.dart'
    as _i1;
import 'package:flutter_test_app/features/booking_sessions/presentation/pages/root_screen.dart'
    as _i3;
import 'package:flutter_test_app/features/booking_sessions/presentation/pages/sessions_screen.dart'
    as _i4;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AddSessionRoute.name: (routeData) {
      final args = routeData.argsAs<AddSessionRouteArgs>(
          orElse: () => const AddSessionRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddSessionScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginScreen(key: args.key),
      );
    },
    RootRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RootScreen(),
      );
    },
    SessionsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SessionsScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.SignUpScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddSessionScreen]
class AddSessionRoute extends _i7.PageRouteInfo<AddSessionRouteArgs> {
  AddSessionRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          AddSessionRoute.name,
          args: AddSessionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddSessionRoute';

  static const _i7.PageInfo<AddSessionRouteArgs> page =
      _i7.PageInfo<AddSessionRouteArgs>(name);
}

class AddSessionRouteArgs {
  const AddSessionRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'AddSessionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<LoginRouteArgs> page =
      _i7.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RootScreen]
class RootRoute extends _i7.PageRouteInfo<void> {
  const RootRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SessionsScreen]
class SessionsRoute extends _i7.PageRouteInfo<void> {
  const SessionsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SessionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SessionsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpScreen]
class SignUpRoute extends _i7.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i7.PageInfo<SignUpRouteArgs> page =
      _i7.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
