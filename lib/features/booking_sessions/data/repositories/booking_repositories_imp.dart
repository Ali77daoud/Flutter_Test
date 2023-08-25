import 'package:flutter_test_app/features/booking_sessions/domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  // final AuthLocalDataSource authLocalDataSource;

  // AuthRepositoryImpl({required this.authLocalDataSource});

  // @override
  // Future<Either<Failure, int>> signUp(UserEntity userEntity) async {
  //   final userModel =
  //       UserModel(password: userEntity.password, userName: userEntity.userName);
  //   try {
  //     final res = await authLocalDataSource.signUp(userModel);
  //     return right(res);
  //   } on UnExpectedException {
  //     return left(UnExpectedFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, UserEntity>> login(UserEntity userEntity) async {
  //   final userModel =
  //       UserModel(password: userEntity.password, userName: userEntity.userName);
  //   try {
  //     final res = await authLocalDataSource.login(userModel);
  //     return right(res);
  //   } on WrongDataException {
  //     return left(WrongDataFailure());
  //   }
  // }
}
