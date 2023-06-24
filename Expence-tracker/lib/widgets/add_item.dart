import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expence.dart';

class AddItem extends StatefulWidget {
  const AddItem(this.submit,{super.key});
  final void Function(Expence exp) submit;
  @override
  State<AddItem> createState() {
    return _AddItemState();
  }
}

class _AddItemState extends State<AddItem> {
  final tc = TextEditingController();
  final ac = TextEditingController();
  Category selectedCategory = Category.food;
  DateTime date=DateTime.now();
  @override
  void dispose() {
    tc.dispose();
    ac.dispose();
    super.dispose();
  }

  void datepick() async {
    final initialDate = DateTime.now();
    final firstDate =
        DateTime(initialDate.year - 1, initialDate.month, initialDate.day);
    final lastDate = initialDate;
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      date = pickedDate!;
    });
  }

  void submitData() {
    final a = int.tryParse(ac.text);
    final amountvalid = (a == null) || (a <= 0);
    if ((tc.text.trim().isEmpty) || (amountvalid)) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Invalid Input'),
            content: amountvalid == true
                ? const Text('Enter Valid Amound')
                : const Text('Enter valid Tittle'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('OKAY'),
              )
            ],
          );
        },
      );
      return;
    }
    widget.submit(Expence( tc.text[0].toUpperCase() + tc.text.substring(1), a, date, selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Column(
        children: [
          TextField(
            controller: tc,
            maxLength: 20,
            decoration: const InputDecoration(
              label: Text('Tittle'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: ac,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: 'Rs: ',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(d.format(date)),
                    IconButton(
                      onPressed: datepick,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (i) {
                  setState(
                    () {
                      if (i == null) {
                        return;
                      }
                      selectedCategory = i;
                    },
                  );
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  submitData();
                },
                child: const Text('Save Expence'),
              )
            ],
          )
        ],
      ),
    );
  }
}
