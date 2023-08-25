import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/color_constants.dart';
import 'package:flutter_test_app/core/utils/screen_size_utils.dart';
import 'package:flutter_test_app/core/widgets/text_widget.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/constants/dropdown_type.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/pages/test_data.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/widgets/custom_dropdown_widget.dart';
import '../bloc/cubit/booking_cubit.dart';
import '../bloc/cubit/booking_state.dart';

@RoutePage()
class AddSessionScreen extends StatelessWidget {
  AddSessionScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryDark,
            centerTitle: true,
            title: TextWidget(
                text: 'Add Session',
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxline: 1),
          ),
          body: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final bookingCubit = BookingCubit.get(context);
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
                                  DropDownType.instructor, newValue.toString());
                              //////////
                              bookingCubit.changeFirstIndex();
                              //////////
                              bookingCubit.resetDayValue();
                              //////////
                              bookingCubit.resetTimeValue();
                            },
                            labelText: 'Instructor Name',
                            hintText: 'Choose Instructor Name',
                            items: instructorData.instructors
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
                            },
                            labelText: 'Available Days',
                            hintText: 'Choose Day',
                            items: instructorData
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
                            items: instructorData
                                .instructors[bookingCubit.firstIndex]
                                .availableTimeRanges[0]
                                .time),
                        SizedBox(
                          height:
                              ScreenSizeUtils.getHeightInPercent(context, 3),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
