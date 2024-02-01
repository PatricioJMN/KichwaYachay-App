import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning_ui/pages/choose_language.dart';
import 'package:language_learning_ui/pages/create_account.dart';
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/pages/home.dart';
import 'package:language_learning_ui/pages/lesson_screen.dart';
import 'package:language_learning_ui/pages/word_find.dart';
// import 'package:language_learning_ui/constants.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Kichwa',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // textTheme: GoogleFonts.rubikTextTheme(
          //   const TextTheme(),
          // ),
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Home();
      });
    case "/create-account":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const CreateAccount();
      });
    case "/choose-language":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const ChooseLanguage();
      });
    case "/word-find":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const WordFind();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Dashboard();
      });
    case "/lesson-screen":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const LessonScreen(unity: 1);
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return const Home();
      });
  }
}
