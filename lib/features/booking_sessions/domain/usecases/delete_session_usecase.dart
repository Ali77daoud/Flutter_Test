import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/repositories/booking_repository.dart';

class DeleteSessionUseCase {
  final BookingRepository bookingRepository;

  DeleteSessionUseCase(this.bookingRepository);

  Future<Either<Failure, Unit>> call(int id) async {
    return await bookingRepository.deleteSession(id);
  }
}
