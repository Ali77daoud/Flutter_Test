import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/database_constants.dart';
import 'package:flutter_test_app/core/errors/exceptions.dart';
import 'package:flutter_test_app/core/database/local_database.dart';
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

    final result = await db.query(DataBaseConst.tableName1,
        where: '${DataBaseConst.username} = ?',
        whereArgs: [userModel.userName]);

    if (result.isEmpty) {
      int res = await db.insert(DataBaseConst.tableName1, userModel.toJson());
      if (res > 0) {
        return res;
      } else {
        throw UnExpectedException();
      }
    } else {
      throw InfoAlreadyExistsException();
    }
  }

  @override
  Future<UserModel> login(UserModel userModel) async {
    final db = await localDataBase.database;
    var res = await db.rawQuery(
        "SELECT * FROM ${DataBaseConst.tableName1} WHERE ${DataBaseConst.username} = '${userModel.userName}' and ${DataBaseConst.password} = '${userModel.password}'");

    if (res.isNotEmpty) {
      return UserModel.fromJson(res.first);
    } else {
      debugPrint(res.toString());
      throw WrongDataException();
    }
  }
}
