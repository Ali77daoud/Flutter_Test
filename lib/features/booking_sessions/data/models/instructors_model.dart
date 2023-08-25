class InstructorModel {
  final List<Instructor> instructors;

  InstructorModel({
    required this.instructors,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) =>
      InstructorModel(
        instructors: List<Instructor>.from(
            json["instructors"].map((x) => Instructor.fromJson(x))),
      );
}

class Instructor {
  final String name;
  final List<String> availableDays;
  final List<AvailableTimeRange> availableTimeRanges;

  Instructor({
    required this.name,
    required this.availableDays,
    required this.availableTimeRanges,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        name: json["name"],
        availableDays: List<String>.from(json["availableDays"].map((x) => x)),
        availableTimeRanges: List<AvailableTimeRange>.from(
            json["availableTimeRanges"]
                .map((x) => AvailableTimeRange.fromJson(x))),
      );
}

class AvailableTimeRange {
  final List<String> time;

  AvailableTimeRange({
    required this.time,
  });

  factory AvailableTimeRange.fromJson(Map<String, dynamic> json) =>
      AvailableTimeRange(
        time: List<String>.from(json["time"].map((x) => x)),
      );
}
