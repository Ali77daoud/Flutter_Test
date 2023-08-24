import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/failure_messages.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_test_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../injection_container.dart' as di;
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthCubit({required this.loginUseCase, required this.signUpUseCase})
      : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool isLoading = false;

  void showLoadingScreen() {
    isLoading = true;
    emit(LoginLoadingState(isLoading: isLoading));
  }

  void hideLoadingScreen() {
    isLoading = false;
    emit(LoginLoadingState(isLoading: isLoading));
  }

  /// login
  Future<void> login(UserEntity userEntity) async {
    final failureOrLogin = await loginUseCase.call(userEntity);
    failureOrLogin.fold((failure) {
      emit(LoginErrorState(error: _mapFailureToMessage(failure)));
    }, (login) async {
      /////////////
      await di.sl<SharedPreferences>().setBool('IS_LOGIN', true);
      //////////////////////////////////////////
      emit(LoginSuccessState(userEntity: login));
    });
  }

  /// signup
  Future<void> signup(UserEntity userEntity) async {
    final failureOrSignup = await signUpUseCase.call(userEntity);
    failureOrSignup.fold((failure) {
      emit(SignUpErrorState(error: _mapFailureToMessage(failure)));
    }, (res) async {
      /////////////
      await di.sl<SharedPreferences>().setBool('IS_LOGIN', true);
      //////////////////////////////////////////
      emit(SignUpSuccessState(res: res));
    });
  }

  ////////////////////////////
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case WrongDataFailure:
        return FailureMessages.wrongDataFailureMessage;
      case UnExpectedFailure:
        return FailureMessages.unExpectedFailureMessage;
      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
//   final LoginUseCase loginUseCase;
//   final RegisterUseCase registerUseCase;
//   final LogoutUseCase logoutUseCase;
//   final SharedPreferences sharedPreferences;

//   AuthCubit({
//     required this.loginUseCase,
//     required this.registerUseCase,
//     required this.logoutUseCase,
//     required this.sharedPreferences,
//   }) : super(AuthInitialState());
//   static AuthCubit get(context) => BlocProvider.of(context);

//   ////// choose screen

//   Future<void> chooseLoginAs(String interUserType) async {
//     userType = interUserType;
//     emit(ChooseUserTypeState(userType: userType));
//   }

//   //////////////////////
//   bool isLoading = false;

//   bool isObscure = true;

//   void showLoadingScreen() {
//     isLoading = true;
//     emit(LoginLoadingState(isLoading: isLoading));
//   }

//   void hideLoadingScreen() {
//     isLoading = false;
//     emit(LoginLoadingState(isLoading: isLoading));
//   }

//   void changeIsObscure() {
//     isObscure = !isObscure;
//     emit(ChangeIsObscureState(isOscure: isObscure));
//   }

//   /// login
//   Future<void> login(LoginEntity loginEntity) async {
//     final failureOrLogin = await loginUseCase.call(loginEntity);
//     failureOrLogin.fold((failure) async {
//       emit(LoginErrorState(error: _mapFailureToMessage(failure)));
//     }, (login) async {
//       emit(LoginSuccessState(userEntity: login));
//     });
//   }

//   // signup

//   Future<void> signup(RegisterEntity registerEntity) async {
//     final failureOrLogin = await registerUseCase.call(registerEntity);

//     failureOrLogin.fold((failure) async {
//       emit(SignupErrorState(error: _mapFailureToMessage(failure)));
//     }, (signup) async {
//       emit(SignupSuccessState(userEntity: signup));
//     });
//   }

//   // logout
//   Future<void> logout() async {
//     final failureOrLogout = await logoutUseCase.call();
//     // final failureOrLogin = await registerUseCase.call(registerEntity);

//     failureOrLogout.fold((failure) async {
//       emit(LogOutErrorState(error: _mapFailureToMessage(failure)));
//     }, (signup) async {
//       emit(LogOutSuccessState());
//     });
//   }

//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return serverFailureMessage;
//       case OfflineFailure:
//         return offlineFailureMessage;
//       default:
//         return " Unexpected error,Please try again later.";
//     }
//   }
// }
