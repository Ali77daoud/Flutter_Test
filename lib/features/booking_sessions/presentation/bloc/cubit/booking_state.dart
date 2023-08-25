import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/instructor_entity.dart';
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

class GetDataLoadingState extends BookingState {
  final bool isLoading;

  const GetDataLoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class GetInstructorDataSuccessState extends BookingState {
  final InstructorEntity instructorData;

  const GetInstructorDataSuccessState({required this.instructorData});

  @override
  List<Object> get props => [instructorData];
}
