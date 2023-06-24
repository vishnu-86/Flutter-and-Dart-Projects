import 'package:flutter/material.dart';
import '../../models/expence.dart';
import 'expences_item.dart';

class ExpencePrint extends StatelessWidget{
  const ExpencePrint(this.l,this.deletion,{super.key});
  final List<Expence> l;
  final void Function(Expence expencedata) deletion;
  @override
  Widget build(context){
    return ListView.builder(
      itemCount: l.length,
      itemBuilder: (context, index) {
        return ExpenceItem(l[index],deletion) ;
      },
    );
  }
}