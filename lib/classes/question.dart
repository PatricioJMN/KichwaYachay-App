class QuestionMultipleChoice {
  // Obtained from the JSON
  late String questionJSON;
  late String questionKJSON;
  // Exported to the question
  String question = "";
  String questionK = "";
  late String answer;
  List<String> options = [];
  String selected = 'Skipped';
  bool correct = false;
  // Assets (Images and Audio)
  // String audioName = '';

  QuestionMultipleChoice.fromJson(Map<String, dynamic> json)
      : questionJSON = json['question'],
        questionKJSON = json['questionK'],
        answer = json['traduction'];
  // audioName = json['audio'];
  // imagePath = json['image'];

  void addOptions(List<String> newOptions) {
    question = questionJSON;
    questionK = questionKJSON;
    options.add(answer);
    options.addAll(newOptions);
    options.shuffle();
  }
}
