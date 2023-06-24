import 'package:flutter/material.dart';
import 'package:quiz/questions_list.dart';
import 'First_Page.dart';
import 'question.dart';
import 'ResultPage.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? a;
  List<String> y=[];
  @override
  void initState() {
    a=FirstPage(buttonpress);
    super.initState();
  }
  void buttonpress(){
    setState(() {
      a=Question(storeanswer);
    });
  }
  void storeanswer(String h){
    y.add(h);
    if(y.length==questions.length){
      setState(() {
        a= resultPage(y,buttonpress);
        y=[];
      });
    }
  }
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 38, 18, 170),
                  Color.fromARGB(255, 85, 63, 145)
                ],
              ),
            ),
            child: a),
      ),
    );
  }
}
