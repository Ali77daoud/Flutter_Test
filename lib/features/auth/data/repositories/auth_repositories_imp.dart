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



//   AuthRepositoryImpl(
//       {required this.authRemoteDataSource,
//       required this.authLocalDataSource,
//       required this.networkInfo});

//   // login
//   @override
//   Future<Either<Failure, UserEntity>> postLogin(LoginEntity loginEntity) async {
//     final loginModel = LoginModel(
//         mobileNumber: loginEntity.mobileNumber,
//         password: loginEntity.password,
//         fcmToken: loginEntity.fcmToken);

//     if (await networkInfo.isConnected) {
//       try {
//         final authResponse = await authRemoteDataSource.postLogin(loginModel);
//         if (authResponse.data != null) {
//           await authLocalDataSource
//               .setToken(authResponse.data!.token.toString());
//         }

//         if (authResponse.data != null) {
//           await authLocalDataSource
//               .setUserId(authResponse.data!.user!.id!.toInt());
//         }

//         return Right(authResponse);
//       } on ServerException {
//         return left(ServerFailure());
//       }
//     } else {
//       return Left(OfflineFailure());
//     }
//   }

//   // signup
//   @override
//   Future<Either<Failure, UserEntity>> postRegister(
//       RegisterEntity registerEntity) async {
//     final registerModel = RegisterModel(
//         mobileNumber: registerEntity.mobileNumber,
//         address: registerEntity.address,
//         fullName: registerEntity.fullName,
//         password: registerEntity.password,
//         fcmToken: registerEntity.fcmToken);

//     if (await networkInfo.isConnected) {
//       try {
//         final authResponse =
//             await authRemoteDataSource.postRegister(registerModel);

//         if (authResponse.data != null) {
//           await authLocalDataSource
//               .setToken(authResponse.data!.token.toString());
//         }

//         if (authResponse.data != null) {
//           await authLocalDataSource
//               .setUserId(authResponse.data!.user!.id!.toInt());
//         }

//         return Right(authResponse);
//       } on ServerException {
//         return left(ServerFailure());
//       }
//     } else {
//       return Left(OfflineFailure());
//     }
//   }

//   @override
//   Future<Either<Failure, Unit>> postLogout() async {
//     if (await networkInfo.isConnected) {
//       try {
//         await authRemoteDataSource.postLogout();

//         return const Right(unit);
//       } on ServerException {
//         return left(ServerFailure());
//       }
//     } else {
//       return Left(OfflineFailure());
//     }
//   }
// }
