import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/entities/sessions_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/repositories/booking_repository.dart';

class BookSessionUseCase {
  final BookingRepository bookingRepository;

  BookSessionUseCase(this.bookingRepository);

  Future<Either<Failure, int>> call(SessionsEntity sessionsEntity) async {
    return await bookingRepository.bookSession(sessionsEntity);
  }
}
