import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/database/local_database.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/cubit/booking_cubit.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/pages/sessions_screen.dart';
import '../../../../../injection_container.dart' as di;

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool selected = false;
  final localDataBase = di.sl<LocalDataBase>();
  @override
  void initState() {
    super.initState();
    initDb();
    BookingCubit.get(context).getAllSessions();
  }

  void initDb() async {
    await localDataBase.database;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: const SessionsScreen());
  }
}
