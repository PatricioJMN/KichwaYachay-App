class WordFindQues {
  String question;
  String pathImage;
  String answer;
  bool isDone = false;
  bool isFull = false;
  List<WordFindChar> puzzles = [];
  List<String> arrayBtns = [];

  WordFindQues({
    required this.pathImage,
    required this.question,
    required this.answer,
    this.arrayBtns = const [],
  });

  WordFindQues clone() {
    return WordFindQues(
      answer: answer,
      pathImage: pathImage,
      question: question,
    );
  }

  bool fieldCompleteCorrect() {
    bool complete =
        puzzles.where((puzzle) => puzzle.currentValue.isEmpty).isEmpty;

    if (!complete) {
      isFull = false;
      return complete;
    }

    isFull = true;

    String answeredString =
        puzzles.map((puzzle) => puzzle.currentValue).join("");

    // print("answeredString: $answeredString");
    // print("expected answer: ${answer}");
    return answeredString.toLowerCase() == answer.toLowerCase();
    //return answeredString == this.answer;
  }
}

class WordFindChar {
  String currentValue;
  int? currentIndex;
  String correctValue;
  bool hintShow;

  WordFindChar({
    this.hintShow = false,
    required this.correctValue,
    this.currentIndex,
    this.currentValue = '',
  });

/*   getCurrentValue() {
    if (this.correctValue != null)
      return this.currentValue;
    else if (this.hintShow) return this.correctValue;
  } */
  getCurrentValue() {
    return hintShow ? correctValue : currentValue;
  }

  void clearValue() {
    currentIndex = null;
    currentValue = '';
  }
}
