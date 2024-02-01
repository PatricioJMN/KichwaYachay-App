class Question {
  String questionSpanish = '';
  String questionKichwa = '';
  String questionType = '';
  late String correctAnswer = '';
  String selectedOption = 'Skipped';
  bool isCorrect = false;
  String audioPath = '';
  String imagePath = '';
  List<dynamic> optionList = [];

  Question.fromJson(Map<String, dynamic> json)
      : questionSpanish = json['questionSpanish'],
        questionKichwa = json['questionKichwa'],
        questionType = json['questionType'],
        correctAnswer = json['correctAnswer'],
        optionList = json['optionList'],
        audioPath = json['audioPath'],
        imagePath = json['imagePath'];

  // void shuffleOptions() {
  //   optionList.shuffle();
  // }

  // void addOptions(List<dynamic> newOptions) {
  //   optionList.addAll(newOptions);
  //   optionList.add(correctAnswer);
  //   optionList.shuffle();
  // }
}
