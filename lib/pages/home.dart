import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/create_account.dart';
// ignore: unused_import
import 'package:language_learning_ui/pages/dashboard.dart';
import 'package:language_learning_ui/pages/login.dart';
import 'package:language_learning_ui/widgets/primary_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(
              height: 100.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "\nBienvenido/a",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: Constants.primaryTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Image.asset("assets/images/logo_kichwa_yachay.png"),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Constants.captionTextColor,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Login();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: ScreenUtil().setHeight(50.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(169, 176, 185, 0.42),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Ingresar",
                    style: GoogleFonts.roboto(
                      color: Constants.redKY,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            PrimaryButton(
              text: "Registrarse",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const CreateAccount();
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            // Wrap(
            //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: 50,
            //       decoration: const BoxDecoration(
            //         image: DecorationImage(
            //             image:
            //                 AssetImage("assets/images/logo_yachay_tech.png")),
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: 50,
            //       decoration: const BoxDecoration(
            //         image: DecorationImage(
            //             image:
            //                 AssetImage("assets/images/logo_dep_language.png")),
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: 50,
            //       decoration: const BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage("assets/images/logo_dep_tics.png")),
            //       ),
            //     ),
            //   ],
            // )
          ]),
        ),
      ),
    );
  }
}
