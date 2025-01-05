import 'package:flutter/material.dart';
import 'package:flutter_calculator_provider/providers/calculator_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calculator'),
      ),
      body: Column(
        children: [
          // Display the current expression and the result
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    calculator.expression,
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    calculator.result,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Calculator buttons
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              final buttonLabels = [
                '7',
                '8',
                '9',
                '/',
                '4',
                '5',
                '6',
                '*',
                '1',
                '2',
                '3',
                '-',
                'C',
                '0',
                '=',
                '+',
                'DEL',
                '.',
                '(',
                ')'
              ];

              final label = buttonLabels[index];
              return CalculatorButton(
                label: label,
                onPressed: () {
                  if (label == 'C') {
                    calculator.clear();
                  } else if (label == 'DEL') {
                    calculator.deleteLastCharacter();
                  } else if (label == '=') {
                    calculator.calculateResult();
                  } else {
                    calculator.addCharacter(label);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
