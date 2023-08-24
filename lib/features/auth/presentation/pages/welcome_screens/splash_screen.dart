import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/features/auth/data/data_sources/local_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/constants/color_constants.dart';
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
  final isLogin = di.sl<SharedPreferences>().getBool('IS_LOGIN') ?? false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        selected = true;
      });
      Timer(const Duration(seconds: 3, milliseconds: 500), () {
        initDb();
        context.router.push(LoginRoute());
        debugPrint('$isLogin islogin');
        isLogin == false
            ? context.router.replace(LoginRoute())
            : context.router.replace(const MainRoute());
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
              Container(decoration: const BoxDecoration(color: AppColors.grey)),
              AnimatedContainer(
                width: selected ? 220 : 70.0,
                height: selected ? 220 : 70.0,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 3),
                curve: Curves.fastOutSlowIn,
                decoration: const BoxDecoration(color: AppColors.primaryDark),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
