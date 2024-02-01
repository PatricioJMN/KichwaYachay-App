import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const DragAndDrop());

class DragAndDrop extends StatelessWidget {
  const DragAndDrop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Matching Game",
      home: DragAndDropHomePage(),
    );
  }
}

class DragAndDropHomePage extends StatefulWidget {
  const DragAndDropHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DragAndDropHomePageState createState() => _DragAndDropHomePageState();
}

class _DragAndDropHomePageState extends State<DragAndDropHomePage> {
  late List<ItemModel> items;
  late List<ItemModel> items2;

  late int score;
  late bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          icon: FontAwesomeIcons.mugSaucer, name: "Coffee", value: "Coffee"),
      ItemModel(icon: FontAwesomeIcons.dog, name: "Dog", value: "Dog"),
      ItemModel(icon: FontAwesomeIcons.cat, name: "Cat", value: "Cat"),
      ItemModel(
          icon: FontAwesomeIcons.cakeCandles, name: "Cake", value: "Cake"),
      ItemModel(icon: FontAwesomeIcons.bus, name: "Bus", value: "Bus"),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) gameOver = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Matching Game'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30.0,
            ),
            Text.rich(TextSpan(children: [
              const TextSpan(
                  text: "Score: ",
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
              TextSpan(
                  text: "$score",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ))
            ])),
            const SizedBox(
              height: 30.0,
            ),
            if (!gameOver)
              Row(
                children: <Widget>[
                  Column(
                      children: items.map((item) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Draggable<ItemModel>(
                        data: item,
                        childWhenDragging: Icon(
                          item.icon,
                          color: Colors.grey,
                          size: 50.0,
                        ),
                        feedback: Icon(
                          item.icon,
                          color: Colors.teal,
                          size: 50,
                        ),
                        child: Icon(
                          item.icon,
                          color: Colors.teal,
                          size: 50,
                        ),
                      ),
                    );
                  }).toList()),
                  const Spacer(),
                  Column(
                      children: items2.map((item) {
                    return DragTarget<ItemModel>(
                      onAccept: (receivedItem) {
                        if (item.value == receivedItem.value) {
                          setState(() {
                            items.remove(receivedItem);
                            items2.remove(item);
                            score += 10;
                            item.accepting = false;
                          });
                        } else {
                          setState(() {
                            score -= 5;
                            item.accepting = false;
                          });
                        }
                      },
                      onLeave: (receivedItem) {
                        setState(() {
                          item.accepting = false;
                        });
                      },
                      onWillAccept: (receivedItem) {
                        setState(() {
                          item.accepting = true;
                        });
                        return true;
                      },
                      builder: (context, acceptedItems, rejectedItem) =>
                          Container(
                        color: item.accepting ? Colors.red : Colors.teal,
                        height: 50,
                        width: 100,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8.0),
                        child: Text(
                          item.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ),
                    );
                  }).toList()),
                ],
              ),
            if (gameOver)
              const Text(
                "GameOver",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            if (gameOver)
              Center(
                child: ElevatedButton(
                  // textColor: Colors.white,
                  // color: Colors.pink,
                  child: const Text("New Game"),
                  onPressed: () {
                    initGame();
                    setState(() {});
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  final String name;
  final String value;
  final IconData icon;
  bool accepting;

  ItemModel(
      {required this.name,
      required this.value,
      required this.icon,
      this.accepting = false});
}
