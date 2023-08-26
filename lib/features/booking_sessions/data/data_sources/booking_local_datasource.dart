import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/constants/database_constants.dart';
import 'package:flutter_test_app/core/database/local_database.dart';
import 'package:flutter_test_app/core/errors/exceptions.dart';
import 'package:flutter_test_app/core/variables/app_var.dart';
import 'package:flutter_test_app/features/booking_sessions/data/models/instructors_model.dart';
import 'package:flutter_test_app/features/booking_sessions/data/models/sessions_model.dart';

abstract class BookingLocalDataSource {
  InstructorModel getInstructors();
  Future<int> bookSession(SessionsModel sessionsModel);
  Future<List<SessionsModel>> getAllSessions();
}

class BookingLocalDataSourceImpl implements BookingLocalDataSource {
  final LocalDataBase localDataBase;

  BookingLocalDataSourceImpl({required this.localDataBase});

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

  @override
  Future<int> bookSession(SessionsModel sessionsModel) async {
    final db = await localDataBase.database;
    final result = await db.query(DataBaseConst.tableName2,
        where:
            '${DataBaseConst.instructorName} = ? AND ${DataBaseConst.day} = ? AND ${DataBaseConst.time} = ?',
        whereArgs: [
          sessionsModel.instructorName,
          sessionsModel.day,
          sessionsModel.time
        ]);
    if (result.isEmpty) {
      int res =
          await db.insert(DataBaseConst.tableName2, sessionsModel.toJson());
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
  Future<List<SessionsModel>> getAllSessions() async {
    final db = await localDataBase.database;

    final result = await db.query(DataBaseConst.tableName2,
        where: '${DataBaseConst.userId} = ?', whereArgs: [userId]);

    debugPrint(result.toString());

    return result.map((json) => SessionsModel.fromJson(json)).toList();
  }
}
