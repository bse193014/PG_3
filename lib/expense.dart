import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; 
import 'package:intl/intl.dart';
enum CAtagory {
  Food,
  Transport,
  Medical,
  Shopping,
  Rent,
leisure
}
const catagroyICon = {
  CAtagory.Food: Icons.fastfood,
  CAtagory.Transport: Icons.train,
  CAtagory.Medical: Icons.medical_services,
  CAtagory.Shopping: Icons.shopping_cart,
  CAtagory.Rent: Icons.home,
  CAtagory.leisure: Icons.sports_esports,
};

const uuid= Uuid();
final formator = DateFormat.yMd();
class Expense {
Expense({required this.amount,required this .title,required this.date,required this.catogry})
:Id = uuid.v4();

final   String Id ;
final   double amount ;
final   String title;
final   DateTime date;  
final CAtagory catogry;

 String get formateddate {
  return formator.format(date);
 }
}