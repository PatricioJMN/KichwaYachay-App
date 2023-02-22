import 'package:flutter/material.dart';
import 'package:language_learning_ui/models/course_model.dart';
import 'package:language_learning_ui/models/instructor_model.dart';
import 'package:language_learning_ui/models/topic_model.dart';

class Constants {
  static const Color primaryTextColor = Color.fromRGBO(55, 75, 53, 1);
  static const Color captionTextColor = Color.fromRGBO(231, 106, 38, 1.0);
  static const Color primaryColor = Color.fromRGBO(114, 25, 48, 1.0);

  static const Color orangeKY = Color.fromRGBO(231, 106, 38, 1.0);
  static const Color redKY = Color.fromRGBO(114, 25, 48, 1.0);
  static const Color redtortaKY = Color.fromRGBO(242, 138, 144, 1.0);
  static const Color greenKY = Color.fromRGBO(55, 75, 53, 1.0);
  static const Color greenaguitaKY = Color.fromARGB(255, 149, 168, 147);
  static const Color blueKY = Color.fromRGBO(113, 175, 226, 1.0);
  static const Color grayKY = Color.fromRGBO(221, 223, 238, 1.0);
  static const Color yellowKY = Color.fromRGBO(247, 208, 122, 1.0);
  static const Color yellowaguitaKY = Color.fromARGB(255, 217, 190, 131);
  static const Color purpleKY = Color.fromRGBO(81, 65, 84, 1.0);

  static List<TopicModel> topics = [
    TopicModel(
      color: Constants.primaryColor,
      boxShadow: [
        const BoxShadow(
          color: Color.fromRGBO(255, 99, 128, 0.6),
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
      topic: "Unidad 1",
      time: "n Lecciones",
      points: "20",
      image: "assets/images/course-1.png",
    ),
  ];
  static List<String> courseLevels = ["Quices", "Minijuegos", "Lecciones"];
  static List<CourseModel> courses = [
    CourseModel(
      name: "Quiz Aleatorio",
      color: const Color.fromRGBO(86, 131, 223, 1),
      image: "assets/images/course-3.png",
    ),
    CourseModel(
      name: "Minijuegos",
      color: const Color.fromRGBO(255, 152, 117, 1),
      image: "assets/images/course-4.png",
    ),
    CourseModel(
      name: "Lecciones",
      color: const Color.fromRGBO(255, 133, 125, 1),
      image: "assets/images/course-5.png",
    ),
  ];
  static List<InstructorModel> instructors = [
    InstructorModel(
      name: "Patricio Mendoza",
      occupation: "UI Designer",
      image: "assets/images/person-2.png",
    ),
    InstructorModel(
      name: "Patricio Mendoza",
      occupation: "Software Dev",
      image: "assets/images/person-2.png",
    ),
    InstructorModel(
      name: "Patricio Mendoza",
      occupation: "Database Dev",
      image: "assets/images/person-2.png",
    )
  ];
}
