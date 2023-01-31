import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/widgets/border_text_field.dart';
import 'package:language_learning_ui/widgets/course_card.dart';
import 'package:language_learning_ui/widgets/instructor_card.dart';
import 'package:language_learning_ui/widgets/topics_list.dart';
import 'package:language_learning_ui/widgets/user_menu_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: const IconThemeData(
          color: Color.fromRGBO(202, 205, 219, 1),
        ),
        selectedIconTheme: const IconThemeData(
          color: Constants.primaryColor,
        ),
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(FlutterIcons.home_fea),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FlutterIcons.calendar_fea,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FlutterIcons.edit_fea,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FlutterIcons.user_fea,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                const UserMenuBar(),
                const SizedBox(
                  height: 15.0,
                ),
                const BorderTextField(
                  prefixIcon: Icon(
                    FlutterIcons.search_fea,
                    color: Colors.grey,
                  ),
                  borderRadius: 50.0,
                  hintText: "Buscar...",
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // RETURNS UNITY LIST
                const TopicsList(),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Actividades",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Constants.primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Mostrar Todo",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Constants.captionTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  height: 22.0,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.courseLevels.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        Constants.courseLevels[index],
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight:
                              index == 0 ? FontWeight.w600 : FontWeight.w400,
                          color: index == 0
                              ? Constants.primaryColor
                              : Constants.captionTextColor,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: ScreenUtil().setHeight(167.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.courses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CourseCard(
                        course: Constants.courses[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Equipo Desarrollador",
                  style: TextStyle(
                    fontSize: 21.0,
                    color: Constants.primaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  height: ScreenUtil().setHeight(140.0),
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10.0,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.instructors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InstructorCard(
                        instructor: Constants.instructors[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
