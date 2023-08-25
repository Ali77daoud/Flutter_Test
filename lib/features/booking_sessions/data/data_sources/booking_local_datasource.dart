abstract class BookingLocalDataSource {
  // Future<int> signUp(UserModel userModel);

  // Future<UserModel> login(UserModel userModel);
}

class BookingLocalDataSourceImpl implements BookingLocalDataSource {
  // final LocalDataBase localDataBase;

  // AuthLocalDataSourceImpl({required this.localDataBase});

  // @override
  // Future<int> signUp(UserModel userModel) async {
  //   final db = await localDataBase.database;
  //   int res = await db.insert(DataBaseConst.tableName2, userModel.toJson());
  //   if (res > 0) {
  //     return res;
  //   } else {
  //     throw UnExpectedException();
  //   }
  // }

  // @override
  // Future<UserModel> login(UserModel userModel) async {
  //   final db = await localDataBase.database;
  //   var res = await db.rawQuery(
  //       "SELECT * FROM ${DataBaseConst.tableName2} WHERE ${DataBaseConst.username} = '${userModel.userName}' and ${DataBaseConst.password} = '${userModel.password}'");

  //   if (res.isNotEmpty) {
  //     return UserModel.fromJson(res.first);
  //   } else {
  //     debugPrint(res.toString());
  //     throw WrongDataException();
  //   }
  // }
}
