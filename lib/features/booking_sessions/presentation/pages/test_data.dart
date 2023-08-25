import 'package:flutter_test_app/features/booking_sessions/data/models/instructors_model.dart';

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
