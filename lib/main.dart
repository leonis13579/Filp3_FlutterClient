import 'package:flip_client/Logic/Navigation.dart';
import 'package:flip_client/Widgets/Login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FiLP Exam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Widget _content = Login();

  @override
  BuildContext get context => super.context;
  void changeContent(Widget newContent) {
    setState(() {
      _content = newContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    NavigationApp.instance.setMainState(this);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: _content,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
