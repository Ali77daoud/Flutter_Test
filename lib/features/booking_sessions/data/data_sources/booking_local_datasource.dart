import 'package:flutter_test_app/features/booking_sessions/data/models/instructors_model.dart';

abstract class BookingLocalDataSource {
  InstructorModel getInstructors();
}

class BookingLocalDataSourceImpl implements BookingLocalDataSource {
  @override
  InstructorModel getInstructors() {
    final jsonInstructors = {
      "instructors": [
        {
          "name": "",
          "availableDays": [
            "",
          ],
          "availableTimeRanges": [
            {
              "time": [
                "",
              ]
            }
          ]
        },
        {
          "name": "Instructor 1",
          "availableDays": [
            "",
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Saturday"
          ],
          "availableTimeRanges": [
            {
              "time": [
                "",
                "11:00 AM",
                "12:00 PM",
                "1:00 PM",
                "2:00 PM",
                "3:00 PM",
                "4:00 PM",
                "5:00 PM",
                "6:00 PM",
                "7:00 PM",
                "8:00 PM",
                "9:00 PM"
              ]
            }
          ]
        },
        {
          "name": "Instructor 2",
          "availableDays": [
            "",
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Saturday"
          ],
          "availableTimeRanges": [
            {
              "time": [
                "",
                "4:00 PM",
                "5:00 PM",
                "6:00 PM",
                "7:00 PM",
                "8:00 PM",
                "9:00 PM"
              ]
            }
          ]
        },
        {
          "name": "Instructor 3",
          "availableDays": ["", "Monday", "Tuesday", "Wednesday", "Saturday"],
          "availableTimeRanges": [
            {
              "time": [
                "",
                "5:00 PM",
                "6:00 PM",
                "7:00 PM",
                "8:00 PM",
                "9:00 PM",
                "10:00 PM",
                "11:00 PM"
              ]
            },
            {
              "time": [
                "",
                "10:00 AM",
                "11:00 AM",
                "12:00 PM",
                "1:00 PM",
                "2:00 PM",
                "3:00 PM",
                "4:00 PM",
                "5:00 PM",
                "6:00 PM",
                "7:00 PM",
                "8:00 PM",
                "9:00 PM",
                "10:00 PM"
              ]
            }
          ]
        }
      ]
    };

///////////////
    final InstructorModel instructorData =
        InstructorModel.fromJson(jsonInstructors);

    return instructorData;
  }
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
