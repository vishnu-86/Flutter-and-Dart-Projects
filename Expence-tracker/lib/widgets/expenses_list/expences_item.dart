import 'package:flutter/material.dart';
import '../../models/expence.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(this.exp, this.deletion, {super.key});
  final Expence exp;
  final void Function(Expence exp) deletion;
  @override
  Widget build(context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  exp.tittle,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text('Delete Expence'),
                          content: const Text(
                              'Are you sure you want to delete this expence?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                deletion(exp);
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14,right: 14,bottom: 5),
            child: Row(
              children: [
                Text('Rs: ${exp.amount.toString()}',style: const TextStyle(fontSize: 15),),
                const Spacer(),
                Row(
                  children: [
                    Icon(ico[exp.category]),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      exp.dateForm(),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
