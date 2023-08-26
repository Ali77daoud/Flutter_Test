import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/cubit/booking_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_theme.dart';
import 'core/bloc_observer.dart';
import 'core/route/routes.dart';
import 'core/variables/app_var.dart';
import 'features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /////////////////
  await di.init();
  //////////////////////////////////////////////////////////////////
  Bloc.observer = MyBlocObserver();

  isLogin = di.sl<SharedPreferences>().getBool('IS_LOGIN') ?? false;
  userId = di.sl<SharedPreferences>().getInt('USER_ID') ?? 0;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = di.sl<AppRouter>();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthCubit>()),
        BlocProvider(create: (_) => di.sl<BookingCubit>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Booking Sessions',
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
