import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.a, this.b, {super.key});
  final String a;
  final void Function() b;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: b,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 4, 30, 73),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        a,
        textAlign:TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
