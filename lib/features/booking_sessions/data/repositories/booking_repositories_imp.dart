import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/core/errors/exceptions.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/booking_sessions/data/data_sources/booking_local_datasource.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/instructor_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/sessions_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/repositories/booking_repository.dart';
import '../models/sessions_model.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingLocalDataSource bookingLocalDataSource;

  BookingRepositoryImpl({required this.bookingLocalDataSource});

  @override
  InstructorEntity getInstructorsData() {
    final res = bookingLocalDataSource.getInstructors();
    return res;
  }

  @override
  Future<Either<Failure, int>> bookSession(
      SessionsEntity sessionsEntity) async {
    final sessionModel = SessionsModel(
        instructorName: sessionsEntity.instructorName,
        day: sessionsEntity.day,
        time: sessionsEntity.time,
        userId: sessionsEntity.userId);
    try {
      final res = await bookingLocalDataSource.bookSession(sessionModel);
      return right(res);
    } on UnExpectedException {
      return left(UnExpectedFailure());
    }
  }

  @override
  Future<List<SessionsEntity>> getAllSessions() {
    final res = bookingLocalDataSource.getAllSessions();
    return res;
  }
}
