class Question {
  String question = "";
  String questionK = "";
  String audioPath = "";
  String imagePath = "";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;

  Question.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        questionK = json['questionK'],
        answer = json['traduccion'],
        audioPath = json['audioPath'],
        imagePath = json['imagePath'];

  void addOptions(List<String> newOptions) {
    question;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }
}
