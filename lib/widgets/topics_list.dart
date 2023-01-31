import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/widgets/topic_card.dart';

class TopicsList extends StatelessWidget {
  const TopicsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(150.0),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 15.0,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: Constants.topics.length,
        itemBuilder: (BuildContext context, int index) {
          return TopicCard(
            topic: Constants.topics[index],
          );
        },
      ),
    );
  }
}
