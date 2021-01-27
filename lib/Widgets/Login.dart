import 'package:flip_client/Logic/NetworkLogic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              "Введите вашу учебную почту",
              style: GoogleFonts.roboto(
                fontSize: 25,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                icon: const Icon(Icons.email),
                hintText: "...@edu.mirea.ru",
                labelText: "Ваша учебная почта на портале СДО",
                labelStyle: GoogleFonts.roboto(
                  fontSize: 18,
                ),
                errorStyle: GoogleFonts.roboto(
                  fontSize: 18,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.roboto(
                fontSize: 18,
              ),
              validator: (String value) {
                return !value.contains("@edu.mirea.ru")
                    ? "Вы ввели не вашу учебную почту"
                    : null;
              },
              controller: loginController,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  NetworkLogic.instance.loginStudent(loginController.text);
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Приступить к экзамену",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
