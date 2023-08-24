import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/auth/domain/repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  Future<Either<Failure, int>> call(UserEntity userEntity) async {
    return authRepository.signUp(userEntity);
  }
}
