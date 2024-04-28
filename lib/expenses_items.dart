import 'package:flutter/material.dart';
import 'package:flutter_application_1/expense.dart';
class ExpensesItem extends  StatelessWidget{
  ExpensesItem({super.key,required this.expnse});
  Expense expnse;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5 ),
        child: Column(
          children: [
            Text(expnse.title),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${expnse.amount.toStringAsFixed(2)}'),
                Spacer(),
                Text(expnse.date.toString())
                ,
                Row(
                  children: [
                    Icon(catagroyICon[expnse.catogry]),
                    SizedBox(width: 8,),
                    Text(expnse.formateddate)
                  ],),
              ],)
          ],
        )),
    );
  }
}