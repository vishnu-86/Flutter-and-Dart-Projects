import 'package:flutter/material.dart';
import 'questions_list.dart';
import 'display_final.dart';

class resultPage extends StatelessWidget {
  resultPage(this.g,this.buttonpress, {super.key});
  final List<String> g;
  final void Function() buttonpress;
  final List<Map<String, Object>> l = [];

  List<Map<String, Object>> creation() {
    for (int i = 0; i < g.length; i++) {
      l.add({
        "serial": i + 1,
        "question": questions[i].questionsString,
        "crtans": questions[i].options[0],
        "userans": g[i]
      });
    }
    return l;
  }

  @override
  Widget build(context) {
    final z = creation();
    int y = z.length;
    int x = z.where((e) {
      return e["crtans"] == e["userans"];
    }).length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $x out of $y questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            const SizedBox(height: 20),
            displayfinal(z),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: buttonpress,
              icon: const Icon(
                Icons.refresh_rounded,
                color: Colors.white,
                size: 30,
              ),
              label: const Text(
                'Restart quiz!',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
