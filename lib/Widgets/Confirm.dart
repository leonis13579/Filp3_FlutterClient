import 'package:flip_client/Models/Student.dart';
import 'package:flip_client/Logic/Navigation.dart';
import 'package:flip_client/Widgets/TicketPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';

class Confirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            bottom: 10,
          ),
          child: Text(
            "Вы " +
                Student.instance.lastName +
                " " +
                Student.instance.name +
                " ?",
            style: GoogleFonts.roboto(fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  NavigationApp.instance.mainState.changeContent(TicketPage());
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Да",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  NavigationApp.instance.mainState.changeContent(Login());
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Нет",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
