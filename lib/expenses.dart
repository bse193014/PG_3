import 'package:flutter/material.dart';
import 'package:flutter_application_1/chart.dart';
import 'package:flutter_application_1/expense_list.dart';
import 'package:flutter_application_1/showexpense.dart';
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
  void _addExpense(Expense expense){
    
    setState(() {
      _expensesdata.add(expense);
    });
  }
  void _removeExpense(Expense expense){
    final expnseindex = _expensesdata.indexOf(expense);
    setState(() {
      _expensesdata.remove(expense);
    });
ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(

        action: SnackBarAction(
          label:'undo',
         onPressed: (){
            setState(() {
              _expensesdata.insert(expnseindex, expense);
            });
         }),
      duration:  Duration(seconds: 2),
      content: Text("expnse delted")),);
  }
void _openAddExpenceOverly(){

showModalBottomSheet(
  isScrollControlled: true,
  context: context, builder:(ctx)=> ShowExpense(addexpense: _addExpense));
}


@override
  Widget build(BuildContext context) {
    Widget mainContent = Center(child: Text('No expenses added yet'),);

if(_expensesdata.isNotEmpty){
  mainContent = ExpenseList(expenses: _expensesdata,removeexpense: _removeExpense,);
}
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _openAddExpenceOverly,
           icon:Icon(Icons.add))
        ],
        title: const Text('Expenses'),
      ),
      body: Column(children: [
        Chart(expenses: _expensesdata),
        Expanded(child: mainContent)
      ],)
    );
  }
}