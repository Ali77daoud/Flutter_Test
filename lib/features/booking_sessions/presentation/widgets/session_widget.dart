import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/color_constants.dart';
import 'package:flutter_test_app/core/utils/screen_size_utils.dart';
import 'package:flutter_test_app/core/widgets/text_widget.dart';

class SessionWidget extends StatelessWidget {
  final String name, day, time;
  final int index;

  const SessionWidget({
    super.key,
    required this.name,
    required this.day,
    required this.time,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.lightGray,
              offset: Offset(0, 4),
              blurRadius: 2,
              spreadRadius: 1)
        ],
      ),
      child: Row(
        children: [
          Container(
            height: ScreenSizeUtils.getHeightInPercent(context, 100),
            width: ScreenSizeUtils.getWidthInPercent(context, 10),
            color: AppColors.primaryDark,
            child: Center(
              child: TextWidget(
                  text: '# ${index + 1}',
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxline: 2),
            ),
          ),
          ////////////////////
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                      text: '${'Instructor'} : $name',
                      color: AppColors.darkGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxline: 2),
                  /////////////
                  TextWidget(
                      text: '${'Day'} : $day',
                      color: AppColors.darkGrey,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxline: 2),
                  /////////////
                  TextWidget(
                      text: '${'Time'} : $time',
                      color: AppColors.darkGrey,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxline: 2),
                ],
              ),
            ),
          ),
          ////////////////////
          ////////////////////
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.primaryDark,
              child: Center(
                child: TextWidget(
                    text: 'Session',
                    color: AppColors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    maxline: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
