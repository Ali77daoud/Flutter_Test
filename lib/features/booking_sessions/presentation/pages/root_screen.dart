import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/cubit/booking_cubit.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/pages/sessions_screen.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    super.initState();
    BookingCubit.get(context).getAllSessions();
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
