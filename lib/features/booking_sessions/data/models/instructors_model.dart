import 'package:flutter_test_app/features/booking_sessions/domain/entities/instructor_entity.dart';

class InstructorModel extends InstructorEntity {
  // final List<InstructorDataModel> instructors;

  const InstructorModel({
    required List<InstructorDataModel> instructors,
  }) : super(instructors: instructors);

  factory InstructorModel.fromJson(Map<String, dynamic> json) =>
      InstructorModel(
        instructors: List<InstructorDataModel>.from(
            json["instructors"].map((x) => InstructorDataModel.fromJson(x))),
      );
}

class InstructorDataModel extends InstructorDataEntity {
  // final String name;
  // final List<String> availableDays;
  // final List<AvailableTimeRangeModel> availableTimeRanges;

  const InstructorDataModel({
    required String name,
    required List<String> availableDays,
    required List<AvailableTimeRangeModel> availableTimeRanges,
  }) : super(
            name: name,
            availableDays: availableDays,
            availableTimeRanges: availableTimeRanges);

  factory InstructorDataModel.fromJson(Map<String, dynamic> json) =>
      InstructorDataModel(
        name: json["name"],
        availableDays: List<String>.from(json["availableDays"].map((x) => x)),
        availableTimeRanges: List<AvailableTimeRangeModel>.from(
            json["availableTimeRanges"]
                .map((x) => AvailableTimeRangeModel.fromJson(x))),
      );
}

class AvailableTimeRangeModel extends AvailableTimeRangeEntity {
  // final List<String> time;

  const AvailableTimeRangeModel({
    required List<String> time,
  }) : super(time: time);

  factory AvailableTimeRangeModel.fromJson(Map<String, dynamic> json) =>
      AvailableTimeRangeModel(
        time: List<String>.from(json["time"].map((x) => x)),
      );
}
