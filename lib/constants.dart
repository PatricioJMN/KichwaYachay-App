import 'package:flutter/material.dart';
import 'package:language_learning_ui/models/course_model.dart';
import 'package:language_learning_ui/models/instructor_model.dart';
import 'package:language_learning_ui/models/lesson_model.dart';
import 'package:language_learning_ui/models/topic_model.dart';
import 'package:language_learning_ui/pages/lesson_screen.dart';

class Constants {
  static const Color primaryTextColor = Color.fromRGBO(55, 75, 53, 1);
  static const Color captionTextColor = Color.fromRGBO(231, 106, 38, 1.0);
  static const Color primaryColor = Color.fromRGBO(114, 25, 48, 1.0);

  static const Color orangeLisKY = Color.fromARGB(223, 236, 119, 51);
  static const Color yellowMustard = Color.fromARGB(255, 202, 156, 56);
  static const Color orangeKY = Color.fromRGBO(238, 149, 102, 1);
  static const Color redKY = Color.fromRGBO(114, 25, 48, 1.0);
  static const Color redtortaKY = Color.fromRGBO(242, 138, 144, 1.0);
  static const Color greenKY = Color.fromRGBO(55, 75, 53, 1.0);
  static const Color greenaguitaKY = Color.fromARGB(255, 149, 168, 147);
  static const Color blueKY = Color.fromRGBO(113, 175, 226, 1.0);
  static const Color grayKY = Color.fromRGBO(221, 223, 238, 1.0);
  static const Color yellowKY = Color.fromRGBO(247, 208, 122, 1.0);
  static const Color yellowaguitaKY = Color.fromARGB(255, 217, 190, 131);
  static const Color purpleKY = Color.fromRGBO(81, 65, 84, 1.0);

// Lista de Cursos: Principiante
  static List<TopicModel> topicsPrincipiante = [
    TopicModel(
      color: Constants.redKY,
      boxShadow: [
        const BoxShadow(
          color: Constants.blueKY,
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
      topic: "Unidad 1",
      time: "3 Lecciones",
      points: "15",
      image: "assets/images/course-1.png",
      unity: 1,
      lesson: const LessonScreen(unity: 1),
    ),
    TopicModel(
      color: Constants.greenKY,
      boxShadow: [
        const BoxShadow(
          color: redKY,
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
      topic: "Unidad 2",
      time: "3 Lecciones",
      points: "15",
      image: "assets/images/course-2.png",
      unity: 2,
      lesson: const LessonScreen(unity: 2),
    ),
    TopicModel(
      color: Constants.yellowMustard,
      boxShadow: [
        const BoxShadow(
          color: Color.fromRGBO(255, 99, 128, 0.6),
          spreadRadius: 0,
          blurRadius: 6,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
      topic: "Unidad 3",
      time: "2 Lecciones",
      points: "10",
      image: "assets/images/course-3.png",
      unity: 3,
      lesson: const LessonScreen(unity: 3),
    ),
  ];
// Lista de Cursos: Intermedio
  // static List<TopicModel> topicsIntermedio = [
  //   TopicModel(
  //     color: Constants.blueKY,
  //     boxShadow: [
  //       const BoxShadow(
  //         color: Constants.blueKY,
  //         spreadRadius: 0,
  //         blurRadius: 6,
  //         offset: Offset(0, 2), // changes position of shadow
  //       ),
  //     ],
  //     topic: "Unidad 4",
  //     time: "3 Lecciones",
  //     points: "20",
  //     image: "assets/images/course-1.png",
  //     unity: 4,
  //     lesson: const LessonScreen(unity: 4),
  //   ),
  //   TopicModel(
  //     color: Constants.redtortaKY,
  //     boxShadow: [
  //       const BoxShadow(
  //         color: Color.fromRGBO(255, 99, 128, 0.6),
  //         spreadRadius: 0,
  //         blurRadius: 6,
  //         offset: Offset(0, 2), // changes position of shadow
  //       ),
  //     ],
  //     topic: "Unidad 5",
  //     time: "n Lecciones",
  //     points: "20",
  //     image: "assets/images/course-2.png",
  //     unity: 5,
  //     lesson: const LessonScreen(unity: 5),
  //   ),
  //   TopicModel(
  //     color: Constants.yellowaguitaKY,
  //     boxShadow: [
  //       const BoxShadow(
  //         color: Color.fromRGBO(255, 99, 128, 0.6),
  //         spreadRadius: 0,
  //         blurRadius: 6,
  //         offset: Offset(0, 2), // changes position of shadow
  //       ),
  //     ],
  //     topic: "Unidad 6",
  //     time: "n Lecciones",
  //     points: "20",
  //     image: "assets/images/course-3.png",
  //     unity: 6,
  //     lesson: const LessonScreen(unity: 6),
  //   ),
  // ];
// Lista de Cursos: Principiante
  // static List<TopicModel> topicsAvanzado = [
  //   TopicModel(
  //     color: Constants.blueKY,
  //     boxShadow: [
  //       const BoxShadow(
  //         color: Constants.blueKY,
  //         spreadRadius: 0,
  //         blurRadius: 6,
  //         offset: Offset(0, 2), // changes position of shadow
  //       ),
  //     ],
  //     topic: "Unidad 7",
  //     time: "Contiene 3 Lecciones",
  //     points: "20",
  //     image: "assets/images/course-1.png",
  //     unity: 7,
  //     lesson: const LessonScreen(unity: 7),
  //   ),
  //   TopicModel(
  //     color: Constants.redtortaKY,
  //     boxShadow: [
  //       const BoxShadow(
  //         color: Color.fromRGBO(255, 99, 128, 0.6),
  //         spreadRadius: 0,
  //         blurRadius: 6,
  //         offset: Offset(0, 2), // changes position of shadow
  //       ),
  //     ],
  //     topic: "Unidad 8",
  //     time: "Contiene n Lecciones",
  //     points: "20",
  //     image: "assets/images/course-2.png",
  //     unity: 8,
  //     lesson: const LessonScreen(unity: 8),
  //   ),
  //   TopicModel(
  //     color: Constants.yellowaguitaKY,
  //     boxShadow: [
  //       const BoxShadow(
  //         color: Color.fromRGBO(255, 99, 128, 0.6),
  //         spreadRadius: 0,
  //         blurRadius: 6,
  //         offset: Offset(0, 2), // changes position of shadow
  //       ),
  //     ],
  //     topic: "Unidad 9",
  //     time: "Contiene n Lecciones",
  //     points: "20",
  //     image: "assets/images/course-3.png",
  //     unity: 9,
  //     lesson: const LessonScreen(unity: 9),
  //   ),
  // ];
// Lista de Lecciones
  static List<LessonModel> lessons = [
    // UNITY 1
    LessonModel(
      unityIndex: 1,
      lessonIndex: "1",
      imagePath: "assets/images/lesson.png",
      title: "Lección 01",
      duration: "5 minutos",
    ),
    LessonModel(
      unityIndex: 1,
      lessonIndex: "2",
      imagePath: "assets/images/lesson.png",
      title: "Lección 02",
      duration: "5 minutos",
    ),
    LessonModel(
      unityIndex: 1,
      lessonIndex: "3",
      imagePath: "assets/images/lesson.png",
      title: "Lección 03",
      duration: "5 minutos",
    ),
    // UNITY 2
    LessonModel(
      unityIndex: 2,
      lessonIndex: "1",
      imagePath: "assets/images/lesson.png",
      title: "Lección 01",
      duration: "5 minutos",
    ),
    LessonModel(
      unityIndex: 2,
      lessonIndex: "2",
      imagePath: "assets/images/lesson.png",
      title: "Lección 02",
      duration: "5 minutos",
    ),
    LessonModel(
      unityIndex: 2,
      lessonIndex: "3",
      imagePath: "assets/images/lesson.png",
      title: "Lección 03",
      duration: "5 minutos",
    ),
    // UNITY 3
    LessonModel(
      unityIndex: 3,
      lessonIndex: "1",
      imagePath: "assets/images/lesson.png",
      title: "Lección 01",
      duration: "5 minutos",
    ),
    LessonModel(
      unityIndex: 3,
      lessonIndex: "2",
      imagePath: "assets/images/lesson.png",
      title: "Lección 03",
      duration: "5 minutos",
    ),
  ];
// Lista de Minijuegos
  static List<String> courseLevels = ["Quices", "Minijuegos", "Lecciones"];
// Cursos
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
  // Desarrolladores
  static List<InstructorModel> instructors = [
    InstructorModel(
      name: "Patricio Mendoza",
      occupation: "Softeare Dev",
      image: "assets/images/person-2.png",
    ),
    InstructorModel(
      name: "Saire Conejo",
      occupation: "Software Dev",
      image: "assets/images/person-2.png",
    ),
    InstructorModel(
      name: "Brigitte Solórzano",
      occupation: "Marketing",
      image: "assets/images/person-2.png",
    ),
    InstructorModel(
      name: "Santiago Ajala",
      occupation: "Database Dev",
      image: "assets/images/person-2.png",
    )
  ];
}
