class Question {
  late String color;
  String question = "¿Cómo se dice ";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Question.fromJson(Map<String, dynamic> json)
      : color = json['color'],
        answer = json['traduccion'];

  void addOptions(List<String> newOptions) {
    question += color;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }
}
