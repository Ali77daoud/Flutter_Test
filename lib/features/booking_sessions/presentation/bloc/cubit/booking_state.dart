import 'package:equatable/equatable.dart';
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

class ChangeIndexState extends BookingState {
  final int index;

  const ChangeIndexState({required this.index});

  @override
  List<Object> get props => [index];
}

class RestetDayValueState extends BookingState {}

class RestetTimeValueState extends BookingState {}
