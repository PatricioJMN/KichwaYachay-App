import 'package:flutter/material.dart';

class LessonModel {
  final String unityIndex;
  final String lessonIndex;
  final String duration;
  final String title;
  final String imagePath;
  final StatefulWidget quiz;

  LessonModel(
      {required this.unityIndex,
      required this.lessonIndex,
      required this.title,
      required this.imagePath,
      required this.duration,
      required this.quiz});
}
