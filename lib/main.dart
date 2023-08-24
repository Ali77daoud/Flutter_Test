import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/app_theme.dart';
import 'core/bloc_observer.dart';
import 'core/route/routes.dart';
import 'features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /////////////////
  await di.init();
  //////////////////////////////////////////////////////////////////
  Bloc.observer = MyBlocObserver();
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
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        title: 'Flutter Test',
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
