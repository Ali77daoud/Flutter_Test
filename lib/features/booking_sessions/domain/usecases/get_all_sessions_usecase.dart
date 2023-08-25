import 'package:flutter_test_app/features/booking_sessions/domain/entities/sessions_entity.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/repositories/booking_repository.dart';

class GetAllSessionsUseCase {
  final BookingRepository bookingRepository;

  GetAllSessionsUseCase(this.bookingRepository);

  Future<List<SessionsEntity>> call() async {
    return await bookingRepository.getAllSessions();
  }
}
