import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/route/routes.gr.dart';
import 'package:flutter_test_app/core/widgets/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/color_constants.dart';
import '../../../../../injection_container.dart' as di;

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            await di.sl<SharedPreferences>().setBool('IS_LOGIN', false);
            ////////////
            // ignore: use_build_context_synchronously
            context.router
                .pushAndPopUntil(LoginRoute(), predicate: (route) => false);
          },
          child: TextWidget(
              text: 'LogOut',
              color: AppColors.primaryDark,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              maxline: 1),
        ),
      ),
    );
  }
}
