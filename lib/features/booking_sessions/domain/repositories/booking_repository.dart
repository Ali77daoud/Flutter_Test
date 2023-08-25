import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/instructor_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/sessions_entity.dart';

abstract class BookingRepository {
  InstructorEntity getInstructorsData();
  Future<Either<Failure, int>> bookSession(SessionsEntity sessionsEntity);
  Future<List<SessionsEntity>> getAllSessions();
}
