import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/quiz_home_page.dart';

class LeccionesWidget extends StatefulWidget {
  const LeccionesWidget({Key? key}) : super(key: key);

  @override
  _LeccionesWidgetState createState() => _LeccionesWidgetState();
}

class _LeccionesWidgetState extends State<LeccionesWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Constants.grayKY,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: 362.8,
            height: 605.7,
            decoration: const BoxDecoration(
              color: Constants.grayKY,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Image.network(
                          'https://picsum.photos/seed/155/600',
                          width: 70.3,
                          height: 66.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text('Lección 1',
                                style: TextStyle(
                                    color: Constants.primaryTextColor)),
                          ),
                          Text('Duración: 5 minutos',
                              style:
                                  TextStyle(color: Constants.primaryTextColor)),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30, 0, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const QuizHomePage()));
                              },
                              child: const Text('Quiz'),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Image.network(
                          'https://picsum.photos/seed/155/600',
                          width: 70.3,
                          height: 66.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text('Lección 2',
                                style: TextStyle(
                                    color: Constants.primaryTextColor)),
                          ),
                          Text('Duración: 5 minutos',
                              style:
                                  TextStyle(color: Constants.primaryTextColor)),
                        ],
                      ),
                      Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuizHomePage()));
                            },
                            child: const Text('Quiz'),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Image.network(
                          'https://picsum.photos/seed/155/600',
                          width: 70.3,
                          height: 66.4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text('Lección 3',
                                style: TextStyle(
                                    color: Constants.primaryTextColor)),
                          ),
                          Text('Duración: 5 minutos',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Constants.primaryTextColor)),
                        ],
                      ),
                      Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuizHomePage()));
                            },
                            child: const Text('Quiz'),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
