import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/questions_list.dart';

class Question extends StatefulWidget {
  const Question(this.storeanswer, {super.key});
  final void Function(String h) storeanswer;
  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  var g = 0;
  void nextquestion(String h) {
    widget.storeanswer(h);
    setState(() {
      g++;
    },);
  }

  @override
  Widget build(context) {
    final answer = questions[g];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              answer.questionsString,
              style: const TextStyle(
                color: Color.fromARGB(255, 136, 162, 168),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ...answer.shuffledlist().map(
              (a) {
                return AnswerButton(
                  a,
                  () {
                    nextquestion(a);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
