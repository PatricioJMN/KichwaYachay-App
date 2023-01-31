import 'package:language_learning_ui/classes/question.dart';

class Quiz {
  String name;
  List<Question> questions;
  int right = 0;

  Quiz({required this.name, required this.questions});

  int get percent => ((right / questions.length) * 100).round();
}
