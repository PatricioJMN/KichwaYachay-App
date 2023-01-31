import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/models/course_model.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  const CourseCard({Key? key, required this.course}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(120.0),
      width: ScreenUtil().setWidth(145.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: course.color,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(course.image),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 40.0,
            child: Text(
              course.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Constants.primaryTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
