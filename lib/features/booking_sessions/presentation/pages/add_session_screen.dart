import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/color_constants.dart';
import 'package:flutter_test_app/core/constants/success_messages.dart';
import 'package:flutter_test_app/core/route/routes.gr.dart';
import 'package:flutter_test_app/core/utils/screen_size_utils.dart';
import 'package:flutter_test_app/core/utils/snackbar_message.dart';
import 'package:flutter_test_app/core/variables/app_var.dart';
import 'package:flutter_test_app/core/widgets/app_buttons.dart';
import 'package:flutter_test_app/core/widgets/text_widget.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/sessions_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/constants/dropdown_type.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/widgets/custom_dropdown_widget.dart';
import '../bloc/cubit/booking_cubit.dart';
import '../bloc/cubit/booking_state.dart';

@RoutePage()
class AddSessionScreen extends StatelessWidget {
  AddSessionScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bookingCubit = BookingCubit.get(context);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          await bookingCubit.getAllSessions();
          return true;
        },
        child: Scaffold(
            appBar: buildAppBar(context),
            body: BlocConsumer<BookingCubit, BookingState>(
              listener: (context, state) async {
                if (state is BookSessionSuccessState) {
                  bookingCubit.hideLoadingScreen();
                  await bookingCubit.getAllSessions();

                  // ignore: use_build_context_synchronously
                  SnackBarMessage().showSnackBar(
                      message: SuccessMessages.bookSessionSuccessMessage,
                      backgroundColor: Colors.green,
                      context: context);

                  // ignore: use_build_context_synchronously
                  AutoRouter.of(context).pushAndPopUntil(const SessionsRoute(),
                      predicate: (route) => false);
                }
                if (state is BookSessionErrorState) {
                  bookingCubit.hideLoadingScreen();
                  // ignore: use_build_context_synchronously
                  SnackBarMessage().showSnackBar(
                      message: state.error,
                      backgroundColor: Colors.redAccent,
                      context: context);
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                ScreenSizeUtils.getHeightInPercent(context, 3),
                          ),
                          CustomDropDownWidget(
                              value: bookingCubit.instructor,
                              onChange: (String? newValue) {
                                bookingCubit.chooseValueFromDropDown(
                                    DropDownType.instructor,
                                    newValue.toString());
                                //////////
                                bookingCubit.changeFirstIndex();
                                //////////
                                bookingCubit.resetDayValue();
                                //////////
                                bookingCubit.resetTimeValue();
                              },
                              labelText: 'Instructor Name',
                              hintText: 'Choose Instructor Name',
                              items: bookingCubit.instructorData.instructors
                                  .map((e) => e.name)
                                  .toList()),
                          SizedBox(
                            height:
                                ScreenSizeUtils.getHeightInPercent(context, 3),
                          ),
                          CustomDropDownWidget(
                              value: bookingCubit.day,
                              onChange: (String? newValue) {
                                bookingCubit.chooseValueFromDropDown(
                                    DropDownType.day, newValue.toString());
                                //////////
                                bookingCubit.changeSecondIndex();
                                //////////
                                bookingCubit.resetTimeValue();
                              },
                              labelText: 'Available Days',
                              hintText: 'Choose Day',
                              items: bookingCubit
                                  .instructorData
                                  .instructors[bookingCubit.firstIndex]
                                  .availableDays),
                          SizedBox(
                            height:
                                ScreenSizeUtils.getHeightInPercent(context, 3),
                          ),
                          CustomDropDownWidget(
                              value: bookingCubit.time,
                              onChange: (String? newValue) {
                                bookingCubit.chooseValueFromDropDown(
                                    DropDownType.time, newValue.toString());
                              },
                              labelText: 'Available Times',
                              hintText: 'Choose Time',
                              items: bookingCubit
                                  .instructorData
                                  .instructors[bookingCubit.firstIndex]
                                  .availableTimeRanges[bookingCubit.secondIndex]
                                  .time),
                          SizedBox(
                            height:
                                ScreenSizeUtils.getHeightInPercent(context, 7),
                          ),
                          AppButton.normalButton(
                            backgroundColor: AppColors.secondary,
                            title: 'Book Session',
                            onPress: () async {
                              if (formKey.currentState!.validate()) {
                                bookingCubit.showLoadingScreen();
                                /////////////////
                                final sessionEntity = SessionsEntity(
                                  instructorName: bookingCubit.instructor,
                                  day: bookingCubit.day,
                                  time: bookingCubit.time,
                                  userId: userId!,
                                );
                                await bookingCubit.bookSession(sessionEntity);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryDark,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
        onPressed: () {
          AutoRouter.of(context).pop();
        },
      ),
      title: TextWidget(
          text: 'Add Session',
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          maxline: 1),
    );
  }
}
