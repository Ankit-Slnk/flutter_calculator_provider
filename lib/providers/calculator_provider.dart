import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart'; // Import the expressions package

class CalculatorState with ChangeNotifier {
  String _expression = '';
  String _result = '';

  String get expression => _expression;
  String get result => _result;

  // Add a character (digit or operator) to the expression
  void addCharacter(String character) {
    _expression += character;
    notifyListeners();
  }

  // Clear the expression and result
  void clear() {
    _expression = '';
    _result = '';
    notifyListeners();
  }

  // Delete the last character in the expression
  void deleteLastCharacter() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
      notifyListeners();
    }
  }

  // Evaluate the expression and update the result
  void calculateResult() {
    _result = _calculateResult(_expression);
    notifyListeners();
  }

  // Helper function to evaluate the expression
  String _calculateResult(String expression) {
    try {
      final exp = Expression.parse(expression); // Parse the expression
      const evaluator = ExpressionEvaluator();
      final result = evaluator.eval(exp, {}); // Evaluate the parsed expression

      if (result is double || result is int) {
        return result.toString(); // Convert the result to a string
      } else {
        return 'Error'; // Return "Error" for invalid results
      }
    } catch (e) {
      return 'Error'; // If the evaluation fails, return "Error"
    }
  }
}
