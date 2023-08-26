import 'package:dartz/dartz.dart';
import 'package:flutter_test_app/core/errors/exceptions.dart';
import 'package:flutter_test_app/core/errors/failures.dart';
import 'package:flutter_test_app/features/auth/data/data_sources/auth_local_datasource.dart';
import 'package:flutter_test_app/features/auth/data/models/user_model.dart';
import 'package:flutter_test_app/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_test_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({required this.authLocalDataSource});

  @override
  Future<Either<Failure, int>> signUp(UserEntity userEntity) async {
    final userModel =
        UserModel(password: userEntity.password, userName: userEntity.userName);
    try {
      final res = await authLocalDataSource.signUp(userModel);
      return right(res);
    } on UnExpectedException {
      return left(UnExpectedFailure());
    } on InfoAlreadyExistsException {
      return left(InfoAlreadyExistsFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(UserEntity userEntity) async {
    final userModel =
        UserModel(password: userEntity.password, userName: userEntity.userName);
    try {
      final res = await authLocalDataSource.login(userModel);
      return right(res);
    } on WrongDataException {
      return left(WrongDataFailure());
    }
  }
}
