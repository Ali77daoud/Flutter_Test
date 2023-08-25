import 'package:equatable/equatable.dart';

class InstructorEntity extends Equatable {
  final List<InstructorDataEntity> instructors;

  const InstructorEntity({required this.instructors});
  @override
  List<Object?> get props => [instructors];
}

class InstructorDataEntity extends Equatable {
  final String name;
  final List<String> availableDays;
  final List<AvailableTimeRangeEntity> availableTimeRanges;

  const InstructorDataEntity(
      {required this.name,
      required this.availableDays,
      required this.availableTimeRanges});

  @override
  List<Object?> get props => [name, availableDays, availableTimeRanges];
}

class AvailableTimeRangeEntity extends Equatable {
  final List<String> time;

  const AvailableTimeRangeEntity({required this.time});

  @override
  List<Object?> get props => [time];
}
