import 'package:equatable/equatable.dart';

class SessionsEntity extends Equatable {
  final int? id;
  final String instructorName;
  final String day;
  final String time;
  final int userId;

  const SessionsEntity(
      {this.id,
      required this.instructorName,
      required this.day,
      required this.time,
      required this.userId});

  @override
  List<Object?> get props => [id!, instructorName, day, userId];
}
