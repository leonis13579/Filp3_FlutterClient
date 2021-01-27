import 'package:flip_client/Models/Ticket.dart';
import 'package:flip_client/Logic/NetworkLogic.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  Future<Ticket> currentTicket;

  bool _isLink(String input) {
    final matcher = new RegExp(
        r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)");
    return matcher.hasMatch(input);
  }

  Widget questionWidget({int questionNum, String questionText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionNum.toString(),
          style: GoogleFonts.roboto(
            fontSize: 18,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: RichText(
                text: TextSpan(
                    children: questionText
                        .split(" ")
                        .map(
                          (e) => _isLink(e)
                              ? TextSpan(
                                  text: e + " ",
                                  style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      print(e);
                                      if (await launcher.canLaunch(e)) {
                                        print("Can launch " + e);
                                        await launcher.launch(e);
                                      }
                                    })
                              : TextSpan(
                                  text: e + " ",
                                  style: GoogleFonts.roboto(fontSize: 15),
                                ),
                        )
                        .toList())),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    currentTicket = NetworkLogic.instance.studetTicket();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ticket>(
      future: currentTicket,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              questionWidget(
                questionNum: 1,
                questionText: snapshot.data.firstQuestion,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 35,
                ),
                child: questionWidget(
                  questionNum: 2,
                  questionText: snapshot.data.secondQuestion,
                ),
              ),
              questionWidget(
                questionNum: 3,
                questionText: snapshot.data.thirdQuestion,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(
            snapshot.error,
            style: GoogleFonts.roboto(
              fontSize: 18,
            ),
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
