import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/widgets/text_widget.dart';

class AuthPageFooter extends StatelessWidget {
  final String text1, text2;
  final PageRouteInfo page;
  const AuthPageFooter(
      {Key? key, required this.text1, required this.text2, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
            text: text1,
            color: AppColors.primaryDark,
            fontSize: 13,
            minFontSize: 10,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            maxline: 1),
        const SizedBox(
          width: 2,
        ),
        InkWell(
          onTap: () {
            // AutoRouter.of(context).navigate(page);
            AutoRouter.of(context)
                .pushAndPopUntil(page, predicate: (route) => false);
          },
          child: TextWidget(
              text: text2,
              color: AppColors.primaryLight,
              fontSize: 13,
              minFontSize: 10,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.start,
              maxline: 1),
        ),
      ],
    );
  }
}
