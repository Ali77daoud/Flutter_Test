import 'package:flutter_test_app/features/booking_sessions/domain/entities/instructor_entity.dart';

abstract class BookingRepository {
  InstructorEntity getInstructorsData();
}
