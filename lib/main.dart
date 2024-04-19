import 'package:flutter/material.dart';
import 'package:ukk_kalkulator2/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kalkulator',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}

class CalculationHistory {
  final String date;
  final String expression;
  final double result;

  CalculationHistory(this.date, this.expression, this.result);

  static CalculationHistory fromString(String str) {
    List<String> parts = str.split(' ');
    String date = parts[0];
    String expression = parts[1];
    double result = double.parse(parts[2]);
    return CalculationHistory(date, expression, result);
  }

  @override
  String toString() {
    return '$date $expression $result';
  }
}