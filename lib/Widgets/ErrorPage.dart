import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorPage extends StatelessWidget {
  final String errorTite;

  ErrorPage({this.errorTite});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              errorTite,
              style: GoogleFonts.roboto(fontSize: 18),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Назад",
                    style: GoogleFonts.roboto(),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
