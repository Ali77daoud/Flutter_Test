import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/instructor_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/sessions_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/constants/dropdown_type.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitialState extends BookingState {}

class ChooseValueFromDropDownState extends BookingState {
  final DropDownType type;
  final String value;

  const ChooseValueFromDropDownState({required this.value, required this.type});

  @override
  List<Object> get props => [value, type];
}

class ChangeFirstIndexState extends BookingState {
  final int index;

  const ChangeFirstIndexState({required this.index});

  @override
  List<Object> get props => [index];
}

class ChangeSecondIndexState extends BookingState {
  final int index;

  const ChangeSecondIndexState({required this.index});

  @override
  List<Object> get props => [index];
}

class RestetDayValueState extends BookingState {}

class RestetTimeValueState extends BookingState {}

///////////////////Instructor/////////////////////////////////////////

class GetInstructorDataSuccessState extends BookingState {
  final InstructorEntity instructorData;

  const GetInstructorDataSuccessState({required this.instructorData});

  @override
  List<Object> get props => [instructorData];
}

/////////////BookSession/////////////////////////
class BookSessionSuccessState extends BookingState {
  final int res;

  const BookSessionSuccessState({required this.res});

  @override
  List<Object> get props => [res];
}

class BookSessionErrorState extends BookingState {
  final String error;

  const BookSessionErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

////////////////////////////////////////////////////////////////////
class GetDataLoadingState extends BookingState {}

class GetAllSessionSuccessState extends BookingState {
  final List<SessionsEntity> res;

  const GetAllSessionSuccessState({required this.res});

  @override
  List<Object> get props => [res];
}

class BookSessionLoadingState extends BookingState {
  final bool isLoading;

  const BookSessionLoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

/////////////DeleteSession/////////////////////////
class DeleteSessionSuccessState extends BookingState {}

class DeleteSessionErrorState extends BookingState {
  final String error;

  const DeleteSessionErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
