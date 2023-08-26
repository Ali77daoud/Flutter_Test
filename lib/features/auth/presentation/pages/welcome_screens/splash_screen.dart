import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/database/local_database.dart';
import 'package:flutter_test_app/core/variables/app_var.dart';
import '../../../../../core/route/routes.gr.dart';
import '../../../../../injection_container.dart' as di;

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool selected = false;
  final localDataBase = di.sl<LocalDataBase>();
  @override
  void initState() {
    super.initState();
    initDb();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        selected = true;
      });
      Timer(const Duration(seconds: 3, milliseconds: 500), () {
        debugPrint('$isLogin islogin');
        isLogin == false
            ? AutoRouter.of(context)
                .pushAndPopUntil(LoginRoute(), predicate: (route) => false)
            : AutoRouter.of(context).pushAndPopUntil(const RootRoute(),
                predicate: (route) => false);
      });
    });
  }

  void initDb() async {
    await localDataBase.database;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/pictures/splash_backgrounf.png',
                          ),
                          fit: BoxFit.cover))),
              AnimatedContainer(
                width: selected ? 130 : 60,
                height: selected ? 130 : 60,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 3),
                curve: Curves.fastOutSlowIn,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/pictures/logo.png',
                        ),
                        fit: BoxFit.contain)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
