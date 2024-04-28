import'package:flutter/material.dart';
import 'package:flutter_application_1/expenses_items.dart';
import'expense.dart';
class ExpenseList extends StatelessWidget {
   ExpenseList({super.key,required this.expenses,required this.removeexpense});
    void Function(Expense expense) removeexpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    const mainContnet = Center(child: Text('no Expense please add some !'));

    return ListView.builder(itemCount: 
    expenses.length,
    itemBuilder: (ctx, index)=> Dismissible(
      onDismissed: (direction){
        removeexpense(expenses[index]);
      },
      key: ValueKey(expenses[index]),
      child: ExpensesItem(expnse: expenses[index])),);
  }
}