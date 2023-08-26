import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../constants/database_constants.dart';

class LocalDataBase {
  Database? _database;

  /////////////////////////
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('myDB.db');
    return _database!;
  }

  /////////////////////////
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  /////////////////////////
  Future _createDB(Database db, int version) async {
    await db.execute('''
create table ${DataBaseConst.tableName1} ( 
  ${DataBaseConst.id} integer primary key autoincrement, 
  ${DataBaseConst.username} text not null,
   ${DataBaseConst.password} text not null
 )
''');
///////////////////
    await db.execute('''
create table ${DataBaseConst.tableName2} ( 
  ${DataBaseConst.id} integer primary key autoincrement, 
  ${DataBaseConst.instructorName} text not null,
   ${DataBaseConst.day} text not null,
   ${DataBaseConst.time} text not null,
   ${DataBaseConst.userId} integer not null
 )
''');
  }
}
