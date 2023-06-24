import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage(this.buttonpress,{super.key});
  final void Function() buttonpress;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(139, 255, 255, 255),
          ),
          const SizedBox(height: 50),
          const Text(
            'Learn flutter the fun way',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: buttonpress,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
