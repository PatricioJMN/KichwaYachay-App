import 'dart:math';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/models/wordfind_model.dart';

class WordFind extends StatefulWidget {
  static const String routeName = '/word-find';
  const WordFind({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WordFindState createState() => _WordFindState();
}

class _WordFindState extends State<WordFind> {
  GlobalKey<_WordFindWidgetState> globalKey = GlobalKey();
  List<WordFindQues>? listQuestions;

  @override
  void initState() {
    super.initState();
    listQuestions = [
      WordFindQues(
        question: "What is the name of this game?",
        answer: "mario",
        pathImage: "assets/images/mario.jpeg",
      ),
      WordFindQues(
        question: "What is this animal?",
        answer: "cat",
        pathImage:
            "https://images.pexels.com/photos/617278/pexels-photo-617278.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      ),
      WordFindQues(
        question: "What is the name of this animal?",
        answer: "wolf",
        pathImage:
            "https://as1.ftcdn.net/v2/jpg/02/48/64/04/1000_F_248640483_5KAZi0GqcWrBu6GOhFEAxk1quNEuOzHJ.jpg",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.green,
          child: Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      color: Colors.blue,
                      child: WordFindWidget(
                        constraints.biggest,
                        listQuestions?.map((ques) => ques.clone()).toList() ??
                            [],
                        key: globalKey,
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  globalKey.currentState?.generatePuzzle(
                    loop: listQuestions?.map((ques) => ques.clone()).toList() ??
                        [],
                  );
                },
                child: const Text("Reload"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (!(ModalRoute.of(context)?.settings.name ==
                      WordFind.routeName)) {
                    Navigator.pushNamed(context, WordFind.routeName);
                  }
                },
                child: const Text("Go to WordFind Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WordFindWidget extends StatefulWidget {
  final Size size;
  final List<WordFindQues> listQuestions;

  const WordFindWidget(this.size, this.listQuestions, {Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WordFindWidgetState createState() => _WordFindWidgetState();
}

class _WordFindWidgetState extends State<WordFindWidget> {
  Size? size;
  List<WordFindQues>? listQuestions;
  int indexQues = 0;
  int hintCount = 0;
  WordFindQues? currentQues;

  @override
  void initState() {
    super.initState();
    size = widget.size;
    listQuestions = widget.listQuestions;
    generatePuzzle();
  }

  @override
  Widget build(BuildContext context) {
    WordFindQues currentQues = listQuestions![indexQues];

    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => generateHint(),
                  child: Icon(
                    Icons.healing_outlined,
                    size: 45,
                    color: Colors.yellow[200],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => generatePuzzle(left: true),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 45,
                        color: Colors.yellow[200],
                      ),
                    ),
                    InkWell(
                      onTap: () => generatePuzzle(next: true),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 45,
                        color: Colors.yellow[200],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  maxWidth: size!.width / 2 * 1.5,
                ),
                child: Image.asset(currentQues.pathImage),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              currentQues.question,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: currentQues.puzzles.map((puzzle) {
                    Color color;
                    if (currentQues.isDone) {
                      color = Colors.green[300] ?? Colors.transparent;
                    } else if (puzzle.hintShow) {
                      color = Colors.yellow[100] ?? Colors.transparent;
                    } else if (currentQues.isFull) {
                      color = Colors.red;
                    } else {
                      color = const Color.fromARGB(255, 147, 211, 225);
                    }
                    return InkWell(
                      onTap: () {
                        if (puzzle.hintShow || currentQues.isDone) return;

                        currentQues.isFull = false;
                        puzzle.clearValue();
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: constraints.biggest.width / 7 - 6,
                        height: constraints.biggest.width / 7 - 6,
                        margin: const EdgeInsets.all(3),
                        child: Text(
                          puzzle.currentValue.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 8,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: 16,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                bool statusBtn = currentQues.puzzles
                        .indexWhere((puzzle) => puzzle.currentIndex == index) >=
                    0;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    Color color;
                    if (statusBtn) {
                      color = Colors.white70;
                    } else {
                      color = const Color.fromARGB(255, 126, 170, 253);
                    }

                    return Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          if (!statusBtn) setBtnClick(index);
                        },
                        style: TextButton.styleFrom(
                          // foregroundColor: Color.fromARGB(255, 156, 45, 113),
                          // minimumSize: Size(
                          //   constraints.biggest.width / 7 - 12,
                          //   constraints.biggest.width / 7 - 12,
                          // ),
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          currentQues.arrayBtns[index].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void generatePuzzle(
      {List<WordFindQues>? loop, bool next = false, bool left = false}) {
    if (loop != null) {
      indexQues = 0;
      listQuestions = List<WordFindQues>.from(loop);
    } else {
      if (next && indexQues < listQuestions!.length - 1) {
        indexQues++;
      } else if (left && indexQues > 0) {
        indexQues--;
      } else if (indexQues >= listQuestions!.length - 1) {
        return;
      }

      if (listQuestions![indexQues].isDone) {
        return;
      }
    }

    WordFindQues currentQues = listQuestions![indexQues];

    final List<String> answerChars = currentQues.answer.split('');
    currentQues.arrayBtns = answerChars + generateRandomChars();

    currentQues.arrayBtns.shuffle();
    currentQues.puzzles = List.generate(answerChars.length, (index) {
      return WordFindChar(correctValue: answerChars[index]);
    });

    setState(() {});

    hintCount = 0;
  }

  List<String> generateRandomChars() {
    List<String> randomChars = [];
    Random random = Random();

    for (int i = 0; i < 16 - (currentQues?.answer.length ?? 0); i++) {
      randomChars
          .add(String.fromCharCode(random.nextInt(26) + 'A'.codeUnitAt(0)));
    }

    return randomChars;
  }

  void generateHint() async {
    WordFindQues currentQues = listQuestions![indexQues];

    List<WordFindChar> puzzleNoHints = currentQues.puzzles
        .where((puzzle) => !puzzle.hintShow && puzzle.currentIndex == null)
        .toList();

    if (puzzleNoHints.isNotEmpty) {
      hintCount++;
      int indexHint = Random().nextInt(puzzleNoHints.length);
      int countTemp = 0;

      currentQues.puzzles = currentQues.puzzles.map((puzzle) {
        if (!puzzle.hintShow && puzzle.currentIndex == null) countTemp++;

        if (indexHint == countTemp - 1) {
          puzzle.hintShow = true;
          puzzle.currentValue = puzzle.correctValue;
          puzzle.currentIndex = currentQues.arrayBtns
              .indexWhere((btn) => btn == puzzle.correctValue);
        }

        return puzzle;
      }).toList();

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }

      setState(() {});
    }
  }

  Future<void> setBtnClick(int index) async {
    WordFindQues currentQues = listQuestions![indexQues];

    int currentIndexEmpty =
        currentQues.puzzles.indexWhere((puzzle) => puzzle.currentValue.isEmpty);

    if (currentIndexEmpty >= 0) {
      // print(
      //     "Antes de asignar valor: ${currentQues.puzzles[currentIndexEmpty].currentValue}");
      currentQues.puzzles[currentIndexEmpty].currentIndex = index;
      currentQues.puzzles[currentIndexEmpty].currentValue =
          currentQues.arrayBtns[index];

      if (currentQues.fieldCompleteCorrect()) {
        currentQues.isDone = true;

        setState(() {});

        await Future.delayed(const Duration(seconds: 1));
        generatePuzzle(next: true);
      }
      // print(
      //     "Después de asignar valor: ${currentQues.puzzles[currentIndexEmpty].currentValue}");
      setState(() {});
    }
  }
}
