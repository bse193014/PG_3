import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/expense_list.dart';
import 'expense.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  
  }
}
class _ExpensesState extends State<Expenses>{
  List<Expense> _expensesdata = [
    Expense(amount: 100.5, title: 'bilopoint', date: DateTime.now(), catogry: CAtagory.leisure),
    Expense(amount: 200.5, title: 'travel', date: DateTime.now(), catogry: CAtagory.Transport),

  ];
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Column(children: [
        const Text('Expenses chart'),
        Expanded(child: ExpenseList(expenses: _expensesdata),),
      ],)
    );
  }
}