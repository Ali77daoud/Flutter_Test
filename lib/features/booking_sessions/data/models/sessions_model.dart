import 'package:flutter_test_app/features/booking_sessions/domain/entities/sessions_entity.dart';

class SessionsModel extends SessionsEntity {
  const SessionsModel(
      {int? id,
      required String instructorName,
      required String day,
      required String time,
      required int userId})
      : super(
            id: id,
            instructorName: instructorName,
            day: day,
            time: time,
            userId: userId);

  factory SessionsModel.fromJson(Map<String, dynamic> json) {
    return SessionsModel(
      id: json['id'],
      instructorName: json['name'],
      day: json['day'],
      time: json['time'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': instructorName,
      'day': day,
      'time': time,
      'userId': userId
    };
  }
}
