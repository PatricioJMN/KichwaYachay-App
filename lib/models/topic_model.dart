import 'package:flutter/material.dart';

class TopicModel {
  final String topic;
  final String points;
  final String time;
  final String image;
  final Color color;
  final int unity;
  final StatefulWidget lesson;

  final List<BoxShadow> boxShadow;
  TopicModel(
      {required this.time,
      required this.topic,
      required this.points,
      required this.image,
      required this.color,
      required this.boxShadow,
      required this.unity,
      required this.lesson});
}
