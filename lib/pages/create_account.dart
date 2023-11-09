import 'package:flutter/material.dart';
import 'package:language_learning_ui/constants.dart';
import 'package:language_learning_ui/pages/choose_language.dart';
import 'package:language_learning_ui/pages/login.dart';
import 'package:language_learning_ui/widgets/border_text_field.dart';
import 'package:language_learning_ui/widgets/primary_button.dart';
import 'package:language_learning_ui/widgets/social_logins.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Crea tu Cuenta \nGratis",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: Constants.primaryTextColor,
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                const SocialLogins(),
                const SizedBox(
                  height: 40.0,
                ),
                const Form(
                  child: Column(
                    children: [
                      BorderTextField(hintText: "Nombre"),
                      SizedBox(
                        height: 15.0,
                      ),
                      BorderTextField(hintText: "Apellido"),
                      SizedBox(
                        height: 15.0,
                      ),
                      BorderTextField(hintText: "Email"),
                      SizedBox(
                        height: 15.0,
                      ),
                      BorderTextField(
                        hintText: "Contraseña",
                        obscureText: true,
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                PrimaryButton(
                  text: "Registrarse",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ChooseLanguage();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Al registrarte, aceptas nuestras Politicas de Privacidad y Servicios",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Constants.captionTextColor,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        "¿Ya tienes una cuenta? ",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(169, 176, 185, 1),
                        ),
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
                        child: const Text(
                          "Ingresar",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
