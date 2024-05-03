import 'package:flutter/material.dart';
import 'expenses.dart';

var kColorscheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 29, 138, 228));
var kDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 90, 125));
void main() {

  runApp( MaterialApp(
    darkTheme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kDarkScheme,
      cardTheme: const CardTheme().copyWith(
      color: kDarkScheme.secondaryContainer,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: 
        ElevatedButton.styleFrom(  backgroundColor: kDarkScheme.primary,
        foregroundColor: kDarkScheme.onPrimaryContainer
        ), ),
    ),
    theme: 
    ThemeData().copyWith(
      useMaterial3: true,
    colorScheme: kColorscheme,
    appBarTheme: AppBarTheme().copyWith(
    backgroundColor: kColorscheme.onPrimaryContainer,
    foregroundColor: kColorscheme.primaryContainer
    
    ),
    cardTheme: const CardTheme().copyWith(
      color: kColorscheme.secondaryContainer,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: 
        ElevatedButton.styleFrom(  backgroundColor: kColorscheme.primary,)
      
        ),
textTheme: 
ThemeData().textTheme.copyWith(
  titleLarge:
   TextStyle(
    fontSize: 24,
     fontWeight: FontWeight.bold,
     color: kColorscheme.onSecondaryContainer),),
    ),
themeMode: ThemeMode.system,

    home: Expenses(),),);
} 