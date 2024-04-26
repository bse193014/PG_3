import 'package:uuid/uuid.dart'; 
enum CAtagory {
  Food,
  Transport,
  Medical,
  Shopping,
  Rent,
leisure
}
final uuid= Uuid();
class Expense {
Expense({required this.amount,required this .title,required this.date,required this.catogry})
:Id = uuid.v4();

final   String Id ;
final   double amount ;
final   String title;
final   DateTime date;  
final CAtagory catogry;
}