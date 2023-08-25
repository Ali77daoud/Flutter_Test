import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/success_messages.dart';
import 'package:flutter_test_app/core/route/routes.gr.dart';
import 'package:flutter_test_app/core/utils/snackbar_message.dart';
import 'package:flutter_test_app/core/variables/app_var.dart';
import 'package:flutter_test_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_test_app/features/auth/presentation/bloc/cubit/auth_state.dart';
import 'package:flutter_test_app/features/auth/presentation/pages/auth_screens/signup_screen.dart';
import 'package:flutter_test_app/features/auth/presentation/widgets/auth_page_footer.dart';
import 'package:flutter_test_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/constants/color_constants.dart';
import '../../../../../core/utils/screen_size_utils.dart';
import '../../../../../core/widgets/app_buttons.dart';
import '../../bloc/cubit/auth_cubit.dart';
import '../../widgets/gradient_headre.dart';
import '../../../../../injection_container.dart' as di;

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameKey = TextEditingController();
  final TextEditingController passKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          /////////////
          authCubit.hideLoadingScreen();

          AutoRouter.of(context)
              .pushAndPopUntil(const MainRoute(), predicate: (route) => false);

          await di.sl<SharedPreferences>().setBool('IS_LOGIN', true);
          isLogin = true;
          await di
              .sl<SharedPreferences>()
              .setInt('USER_ID', state.userEntity.id!);
          userId = state.userEntity.id!;
          // ignore: use_build_context_synchronously
          SnackBarMessage().showSnackBar(
              message: SuccessMessages.loginSuccessMessage,
              backgroundColor: Colors.green,
              context: context);
        }
        if (state is LoginErrorState) {
          authCubit.hideLoadingScreen();

          // ignore: use_build_context_synchronously
          SnackBarMessage().showSnackBar(
              message: state.error,
              backgroundColor: Colors.redAccent,
              context: context);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const GradientHeader(
                    text1: 'LOGIN',
                    text2: 'To your account',
                  ),
                  /////////////////////////////////////////////
                  SizedBox(
                    height: ScreenSizeUtils.getHeightInPercent(context, 10),
                  ),
                  //////////////////////
                  buildBody(context, authCubit)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildBody(BuildContext context, AuthCubit authCubit) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSizeUtils.getWidthInPercent(context, 10)),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTextField(
              textInputType: TextInputType.text,
              controller: userNameKey,
              hintText: 'Enter  UserName',
              labelText: 'UserName',
              validator: (value) {
                if (value.isEmpty) {
                  return 'UserName should not be empty';
                }
              },
              prefixIcon: const Icon(Icons.person),
              suffixIcon: null,
            ),
            ///////
            SizedBox(
              height: ScreenSizeUtils.getHeightInPercent(context, 3),
            ),
            ////////////
            AuthTextField(
              textInputType: TextInputType.visiblePassword,
              controller: passKey,
              hintText: 'Enter  Password',
              labelText: 'Password',
              validator: (value) {
                if (value.isEmpty) {
                  return 'Password should not be empty';
                } else if (value!.length < 8) {
                  return 'Password should not be less than 8 characters';
                }
              },
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: null,
            ),
            //////////////
            ///
            ///////
            SizedBox(
              height: ScreenSizeUtils.getHeightInPercent(context, 10),
            ),
            ////////////
            AppButton.normalButton(
              backgroundColor: AppColors.secondary,
              title: 'LOGIN',
              onPress: () async {
                AutoRouter.of(context).pushAndPopUntil(const MainRoute(),
                    predicate: (route) => false);
                // if (formKey.currentState!.validate()) {
                //   authCubit.showLoadingScreen();
                //   ///////////////////////
                //   final userEntity = UserEntity(
                //     userName: userNameKey.text,
                //     password: passKey.text,
                //   );
                //   await authCubit.login(userEntity);
                // }
              },
            ),
            ///////
            SizedBox(
              height: ScreenSizeUtils.getHeightInPercent(context, 10),
            ),
            // ////////////
            AuthPageFooter(
              text1: 'Dont have an account?',
              text2: 'SIGN UP',
              page: SignUpScreen(),
            ),
            ///////
            SizedBox(
              height: ScreenSizeUtils.getHeightInPercent(context, 3),
            ),
            // ////////////
          ],
        ),
      ),
    );
  }
}
