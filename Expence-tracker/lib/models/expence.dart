import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const u = Uuid();
final d = DateFormat('d-M-y');

enum Category { food, travel, leisure, work, other }

const ico = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie_creation_outlined,
  Category.travel: Icons.airplanemode_on,
  Category.work: Icons.work_outline,
  Category.other: Icons.family_restroom,
};

class Expence {
  Expence(this.tittle, this.amount, this.date, this.category) : id = u.v4();
  final String id;
  final String tittle;
  final int amount;
  final DateTime date;
  final Category category;
  String dateForm() {
    return d.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket(
    this.category,
    this.expence,
  );
  final Category category;
  final List<Expence> expence;
  ExpenseBucket.forCategory(List<Expence> allexpence,this.category):
  expence=allexpence.where((element) => element.category==category).toList();

  int getexpence(){
    int sum=0;
    for(final i in expence){
      sum+=i.amount;
    }
    return sum;
  }
}
