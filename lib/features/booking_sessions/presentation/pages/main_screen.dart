import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/color_constants.dart';
import 'package:flutter_test_app/core/route/routes.gr.dart';
import 'package:flutter_test_app/core/variables/app_var.dart';
import 'package:flutter_test_app/core/widgets/text_widget.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/cubit/booking_cubit.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/cubit/booking_state.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/widgets/session_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../injection_container.dart' as di;

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryDark,
            centerTitle: true,
            title: TextWidget(
                text: 'Your Sessions',
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 1),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.white,
                ),
                onPressed: () async {
                  await di.sl<SharedPreferences>().setBool('IS_LOGIN', false);
                  isLogin = false;
                  ////////////
                  // ignore: use_build_context_synchronously
                  AutoRouter.of(context).pushAndPopUntil(LoginRoute(),
                      predicate: (route) => false);
                },
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.secondary,
              onPressed: () {
                BookingCubit.get(context).getInstructorData();
                AutoRouter.of(context).push(AddSessionRoute());
              },
              child: const Icon(
                Icons.add_box_outlined,
                color: AppColors.primaryDark,
              )),
          body: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final bookingCubit = BookingCubit.get(context);
              if (state is GetDataLoadingState) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.white,
                );
              } else if (state is GetAllSessionSuccessState) {
                return bookingCubit.sessionsData.isEmpty
                    ? Center(
                        child: TextWidget(
                            text: 'Sessions Is Empty',
                            color: AppColors.primaryDark,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            textAlign: TextAlign.center,
                            maxline: 2),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return SessionWidget(
                                  name: 'Ali',
                                  day: 'Friday',
                                  time: '9 PM',
                                  index: index);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: bookingCubit.sessionsData.length),
                      );
              } else {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.white,
                );
              }
            },
          )),
    );
  }
}
