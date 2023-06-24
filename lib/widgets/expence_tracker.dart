import 'package:flutter/material.dart';
import '../models/expence.dart';
import 'expenses_list/expence_list.dart';
import 'add_item.dart';
import 'charts/chart.dart';


final List<Expence> expenceList = [
  Expence('Food', 20, DateTime.now(), Category.food),
  Expence('Movie', 100, DateTime.now(), Category.leisure),
];

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker(this.changetheme,{super.key});
  final void Function(bool i) changetheme;
  @override
  State<ExpenseTracker> createState() {
    return _ExpenseTrackerState();
  }
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  bool isDarkMode = false;
  void addFunction() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return AddItem(submit);
        },
        isScrollControlled: true);
  }

  void submit(Expence expencedata) {
    setState(() {
      expenceList.insert(0,expencedata);
    });
  }

  void toggle(){
    isDarkMode = !isDarkMode;
    widget.changetheme(isDarkMode);
  }

  void deletion(Expence expencedata) {
    int ind = expenceList.indexOf(expencedata);
    setState(
      () {
        expenceList.remove(expencedata);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('1 Item Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                expenceList.insert(ind, expencedata);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text(
              'Flutter Expence Tracker',
            ),
            actions: [
              IconButton(
                icon: Icon(!isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
                onPressed: toggle,
              ),
              IconButton(
                onPressed: addFunction,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Chart(expenses: expenceList),
          expenceList.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('No Expence Added'),
                  ),
                )
              : Expanded(child: ExpencePrint(expenceList, deletion)),
        ],
      ),
    );
  }
}
