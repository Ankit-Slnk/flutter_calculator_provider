import 'package:flutter/material.dart';
import 'package:flutter_calculator_provider/providers/calculator_provider.dart';
import 'package:provider/provider.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CalculatorState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}
