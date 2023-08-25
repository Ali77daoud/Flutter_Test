import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/core/constants/failure_messages.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_test_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_test_app/features/auth/domain/usecases/signup_usecase.dart';
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
    }, (login) {
      /////////////
      emit(LoginSuccessState(userEntity: login));
    });
  }

  /// signup
  Future<void> signup(UserEntity userEntity) async {
    final failureOrSignup = await signUpUseCase.call(userEntity);
    failureOrSignup.fold((failure) {
      emit(SignUpErrorState(error: _mapFailureToMessage(failure)));
    }, (res) {
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
