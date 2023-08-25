import 'package:flutter_test_app/features/booking_sessions/domain/entities/instructor_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/repositories/booking_repository.dart';

class GetInstructorsDataUseCase {
  final BookingRepository bookingRepository;

  GetInstructorsDataUseCase(this.bookingRepository);

  InstructorEntity call() {
    return bookingRepository.getInstructorsData();
  }
}
