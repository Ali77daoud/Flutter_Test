import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

// /////////Login////////////////////////////////////////////////////
class LoginLoadingState extends AuthState {
  final bool isLoading;

  const LoginLoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class LoginSuccessState extends AuthState {
  final UserEntity userEntity;

  const LoginSuccessState({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

class LoginErrorState extends AuthState {
  final String error;

  const LoginErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

// ////////////////SignUp///////////////////////////////////////

class SignUpSuccessState extends AuthState {
  final int res;

  const SignUpSuccessState({required this.res});

  @override
  List<Object> get props => [res];
}

class SignUpErrorState extends AuthState {
  final String error;

  const SignUpErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
// class SignupLoadingState extends AuthState {}

// class SignupSuccessState extends AuthState {
//   final UserEntity userEntity;

//   const SignupSuccessState({required this.userEntity});

//   @override
//   List<Object> get props => [userEntity];
// }

// class SignupErrorState extends AuthState {
//   final String error;

//   const SignupErrorState({required this.error});

//   @override
//   List<Object> get props => [error];
// }

// ///////////////////////////////////////////////////////

// class LogOutLoadingState extends AuthState {}

// class LogOutSuccessState extends AuthState {}

// class LogOutErrorState extends AuthState {
//   final String error;

//   const LogOutErrorState({required this.error});

//   @override
//   List<Object> get props => [error];
// }

// /////////////////////////////////////////////////////////////////////
// class ChangeIsObscureState extends AuthState {
//   final bool isOscure;

//   const ChangeIsObscureState({required this.isOscure});

//   @override
//   List<Object> get props => [isOscure];
// }
