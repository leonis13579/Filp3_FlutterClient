import 'package:flip_client/Models/Student.dart';
import 'package:flip_client/Logic/Navigation.dart';
import 'package:flip_client/Widgets/Confirm.dart';
import 'package:flip_client/Widgets/ErrorPage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/Ticket.dart';

class NetworkLogic {
  static NetworkLogic _instance;
  static NetworkLogic get instance =>
      _instance != null ? _instance : NetworkLogic();

  static const String urlBase = "https://filp-exam.herokuapp.com/";

  Future loginStudent(String email) async {
    var client = http.Client();
    final response = await client.get(urlBase + "student/login/" + email);

    if (response.statusCode == 200) {
      Student.instance.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      NavigationApp.instance.mainState.changeContent(Confirm());
    } else {
      Navigator.push(
          NavigationApp.instance.mainState.context,
          MaterialPageRoute(
              builder: (context) => ErrorPage(
                    errorTite: "Введеная электронная почта не найдена",
                  )));
    }
  }

  Future<Ticket> studetTicket() async {
    final response = await http
        .get(urlBase + "ticket/" + Student.instance.studentId.toString());

    if (response.statusCode == 200) {
      return Ticket.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      print("Network Error while getting ticket.");
    }
  }
}
