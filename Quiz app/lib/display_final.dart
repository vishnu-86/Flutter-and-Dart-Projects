import 'package:flutter/material.dart';

class displayfinal extends StatelessWidget {
  const displayfinal(this.l, {super.key});
  final List<Map<String, Object>> l;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...l.map(
              (e) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (e['crtans'] == e['userans'])
                            ? const Color.fromARGB(255, 26, 114, 26)
                            : const Color.fromARGB(255, 116, 19, 112),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          (e['serial'] as int).toString(),
                          style: const TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (e['question'] as String),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            (e['crtans'] as String),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 199, 60, 194),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            (e['userans'] as String),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 134, 198, 134),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
