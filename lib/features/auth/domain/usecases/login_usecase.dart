import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<Failure, UserEntity>> call(UserEntity userEntity) async {
    return await authRepository.login(userEntity);
  }
}
