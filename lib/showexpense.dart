import 'package:flutter/material.dart';
import 'expense.dart';

class ShowExpense extends StatefulWidget{
  ShowExpense({super.key,required this.addexpense});
  final void Function(Expense expense) addexpense;
  @override
  State<ShowExpense> createState() {   
    return _ShowExpnse();
  }
}
class _ShowExpnse extends State<ShowExpense>{
  final _textcontroller = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _pickeddate;
  CAtagory _selectedcatagory = CAtagory.leisure;

  void _submitexpensedata(){
final enterdamount = double.tryParse(_amountController.text);
final amoutisvalid = enterdamount==null||enterdamount<=0;
if(_textcontroller.text.trim().isEmpty||amoutisvalid||_pickeddate==null)
{
showDialog(context: context, builder: (ctx)=>
AlertDialog(title: const Text('invalid input'),
content:const  Text('please enter valid title ,mnumber ,catagory and date'),
 actions: [ TextButton(child:const  Text('okay'),onPressed: ()=>Navigator.pop(ctx),)]
));return;
}widget.addexpense(Expense(
  amount: enterdamount, 
  title: _textcontroller.text, date: _pickeddate!, catogry: _selectedcatagory));
    Navigator.pop(context);
    }
  @override
  void dispose() {
    _amountController.dispose();
    _textcontroller.dispose();
    super.dispose();
  }
  void _percentdatepicker() async{ 
    final now =DateTime.now();
    final firstdate = DateTime(now.year-1, now.month,now.day);
    final pickeddate = await showDatePicker(context: context,initialDate:now , firstDate: firstdate, lastDate: now);
    _pickeddate = pickeddate;
  }

  @override
  Widget build(BuildContext context) {
    final keyboardspcae = MediaQuery.of(context).viewInsets.bottom;
    return  SizedBox(height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
        
          padding: EdgeInsets.fromLTRB(16,48,16,keyboardspcae + 16),
          child: Column(children: [
             TextField(
              controller: _textcontroller,
              maxLength: 50,
            decoration:const InputDecoration(
              label:Text('Title') ) ,
            ),
        Row(children: [
        Expanded(
          child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
              decoration:const InputDecoration(
                prefixText: '\$',
                label:Text('Amount') ) ,
              ),
        ),
            const SizedBox(width: 16,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Text(_pickeddate==null?'no date chosen':formator.format(_pickeddate!),),
              IconButton(onPressed: _percentdatepicker, icon: Icon(Icons.calendar_month))
              ],),
            )
        
        ])
            ,const SizedBox(height: 16,),
            Row(children: [
            DropdownButton(
              value: _selectedcatagory,
              items: 
            CAtagory.values.map((e) => 
            DropdownMenuItem(
              value: e,
              child:
             Text (e.name.toUpperCase(),),),).toList(),
             onChanged: (value){
        if(value==null){return;}
              setState(() {
                _selectedcatagory = value;
              });
             }),
             const Spacer(),
            ElevatedButton(onPressed: _submitexpensedata, child: const Text('save expense')),
            TextButton(onPressed: (){Navigator.pop(context);}, child:const  Text('cancel'),),
            ],)
        ],),
          ),
      ),
    );
  }
}