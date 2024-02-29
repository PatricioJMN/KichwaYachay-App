class Question {
  final String questionSpanish;
  final String questionKichwa;
  final String correctAnswer;
  final String audioPath;
  final String imagePath;
  final String questionType;
  final List<String> optionList;
  final List<String> words;
  final List<String> correctOrder;

  Question({
    required this.questionSpanish,
    required this.questionKichwa,
    required this.correctAnswer,
    required this.audioPath,
    required this.imagePath,
    required this.questionType,
    required this.optionList,
    required this.words,
    required this.correctOrder,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionSpanish: json['questionSpanish'],
      questionKichwa: json['questionKichwa'],
      correctAnswer: json['correctAnswer'],
      audioPath: json['audioPath'],
      imagePath: json['imagePath'],
      questionType: json['questionType'],
      optionList: List<String>.from(json['optionList']),
      words: List<String>.from(json['words']),
      correctOrder: List<String>.from(json['correctOrder']),
    );
  }
}
