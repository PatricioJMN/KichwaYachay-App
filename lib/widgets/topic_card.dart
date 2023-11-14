import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
// import 'package:language_learning_ui/models/lesson_model.dart';
import 'package:language_learning_ui/models/topic_model.dart';
import 'package:language_learning_ui/pages/lesson_screen.dart';

class TopicCard extends StatelessWidget {
  final TopicModel topic;
  const TopicCard({Key? key, required this.topic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return LessonScreen(unity: topic.unity);
          }),
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(136.0),
        width: ScreenUtil().setWidth(246.0),
        decoration: BoxDecoration(
          color: topic.color,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: topic.boxShadow,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          Text(
                            topic.topic,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            topic.time,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 0, top: 10, right: 60, bottom: 0),
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 30.0,
                            height: 30.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              topic.points,
                              style: const TextStyle(
                                color: Constants.primaryTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                          ),
                          const SizedBox(
                            width: 0.0,
                            height: 45.0,
                          ),
                          const Text(
                            "Minutos",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                      // const SizedBox(
                      //   width: 30.0,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      topic.image,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
