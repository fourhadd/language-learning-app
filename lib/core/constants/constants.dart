import 'package:flutter/material.dart';
import 'package:language_learning_ui/core/theme/app_color.dart';
import 'package:language_learning_ui/data/models/course_model.dart';
import 'package:language_learning_ui/data/models/instructor_model.dart';
import 'package:language_learning_ui/data/models/topic_model.dart';

class Constants {
  static List<TopicModel> topics = [
    TopicModel(
      color: AppColor.primaryColor,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 99, 128, 0.6),
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, 2),
        ),
      ],
      topic: "interjections & colloquial",
      time: "30 min",
      points: "20",
      image: "assets/images/course-1.png",
    ),
    TopicModel(
      color: Color.fromRGBO(25, 118, 210, 1),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(25, 118, 210, 0.6),
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, 2),
        ),
      ],
      topic: "interjections & colloquial",
      time: "30 min",
      points: "30",
      image: "assets/images/course-2.png",
    )
  ];
  static List<String> courseLevels = [
    "Beginner",
    "Intermediate",
    "Advanced",
    "Professional"
  ];
  static List<CourseModel> courses = [
    CourseModel(
      name: "Daily English Conversation",
      colorValue: 0xFF5683DF,
      image: "assets/images/course-3.png",
    ),
    CourseModel(
      name: "Learn new vocabulary",
      colorValue: 0xFFFF9875,
      image: "assets/images/course-4.png",
    ),
    CourseModel(
      name: "Business English Masterclass",
      colorValue: 0xFF8E56DF,
      image: "assets/images/course-5.png",
    ),
    CourseModel(
      name: "English Grammar Essentials",
      colorValue: 0xFF56DF92,
      image: "assets/images/course-1.png",
    ),
    CourseModel(
      name: "Listening & Speaking Skills",
      colorValue: 0xFFFF857D,
      image: "assets/images/course-2.png",
    ),
  ];
  static List<InstructorModel> instructors = [
    InstructorModel(
      name: "Jennifer Lee",
      occupation: "UI Designer",
      image: "assets/images/person-1.png",
    ),
    InstructorModel(
      name: "Olayemii Garuba",
      occupation: "Software Dev",
      image: "assets/images/person-2.png",
    ),
    InstructorModel(
      name: "Christopher Gary",
      occupation: "Software Dev",
      image: "assets/images/person-3.png",
    )
  ];
}
