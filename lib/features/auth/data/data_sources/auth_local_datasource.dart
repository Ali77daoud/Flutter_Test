import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/database_constants.dart';
import 'package:flutter_test_app/core/errors/exceptions.dart';
import 'package:flutter_test_app/features/auth/data/data_sources/local_database.dart';
import 'package:flutter_test_app/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<int> signUp(UserModel userModel);

  Future<UserModel> login(UserModel userModel);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalDataBase localDataBase;

  AuthLocalDataSourceImpl({required this.localDataBase});

  @override
  Future<int> signUp(UserModel userModel) async {
    final db = await localDataBase.database;
    int res = await db.insert(DataBaseConst.tableName2, userModel.toJson());
    if (res > 0) {
      return res;
    } else {
      throw UnExpectedException();
    }
  }

  @override
  Future<UserModel> login(UserModel userModel) async {
    final db = await localDataBase.database;
    var res = await db.rawQuery(
        "SELECT * FROM ${DataBaseConst.tableName2} WHERE ${DataBaseConst.username} = '${userModel.userName}' and ${DataBaseConst.password} = '${userModel.password}'");

    if (res.isNotEmpty) {
      return UserModel.fromJson(res.first);
    } else {
      debugPrint(res.toString());
      throw WrongDataException();
    }
  }
}
//   final SharedPreferences sharedPreferences;

//   AuthLocalDataSourceImpl({required this.sharedPreferences});
//   @override
//   Future<Unit> setToken(String token) async {
//     await sharedPreferences.setString('USER_TOKEN', token);

//     return Future.value(unit);
//   }

//   ////////////////////////////////////////////////
//   @override
//   Future<Unit> setUserId(int userId) async {
//     await sharedPreferences.setInt('USER_ID', userId);

//     return Future.value(unit);
//   }
// }
