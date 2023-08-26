import 'package:flutter_test_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:flutter_test_app/features/booking_sessions/data/data_sources/booking_local_datasource.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/repositories/booking_repository.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/usecases/book_session_usecase.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/usecases/get_all_sessions_usecase.dart';
import 'package:flutter_test_app/features/booking_sessions/domain/usecases/get_instructor_data_usecase.dart';
import 'package:flutter_test_app/features/booking_sessions/presentation/bloc/cubit/booking_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/route/routes.dart';
import 'features/auth/data/data_sources/auth_local_datasource.dart';
import 'core/database/local_database.dart';
import 'features/auth/data/repositories/auth_repositories_imp.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'features/booking_sessions/data/repositories/booking_repositories_imp.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// features
  /// 1. authentication
  // bloc /////////////////////////////////////////////////
  sl.registerFactory(
      () => AuthCubit(loginUseCase: sl.call(), signUpUseCase: sl.call()));
  // useCase //////////////////////////////////////////////
  sl.registerLazySingleton(() => LoginUseCase(sl.call()));
  sl.registerLazySingleton(() => SignUpUseCase(sl.call()));
  // repository ///////////////////////////////////////////
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authLocalDataSource: sl.call(),
      ));
  // dataSource /////////////////////////////////////////////
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(
        localDataBase: sl.call(),
      ));

  /// 2. booking sessions
  // bloc /////////////////////////////////////////////////
  sl.registerFactory(() => BookingCubit(
        getInstructorsDataUseCase: sl.call(),
        bookSessionUseCase: sl.call(),
        getAllSessionsUseCase: sl.call(),
      ));
  // useCase //////////////////////////////////////////////
  sl.registerLazySingleton(() => GetInstructorsDataUseCase(sl.call()));
  sl.registerLazySingleton(() => BookSessionUseCase(sl.call()));
  sl.registerLazySingleton(() => GetAllSessionsUseCase(sl.call()));
  // repository ///////////////////////////////////////////
  sl.registerLazySingleton<BookingRepository>(() => BookingRepositoryImpl(
        bookingLocalDataSource: sl.call(),
      ));
  // dataSource /////////////////////////////////////////////
  sl.registerLazySingleton<BookingLocalDataSource>(
      () => BookingLocalDataSourceImpl(localDataBase: sl.call()));
  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerSingleton<AppRouter>(AppRouter());
  sl.registerSingleton<LocalDataBase>(LocalDataBase());
}
