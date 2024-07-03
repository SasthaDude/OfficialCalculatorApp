import 'dart:math';
import 'package:flutter/material.dart';

class ArithmeticCalculator extends StatefulWidget {
  const ArithmeticCalculator({Key? key}) : super(key: key);

  @override
  State<ArithmeticCalculator> createState() => _ArithmeticCalculatorState();
}

class _ArithmeticCalculatorState extends State<ArithmeticCalculator> {
  final TextEditingController _textEditingController = TextEditingController();
  String n1 = "";
  String n2 = "";
  String opr = "";
  bool clk = false;

  void clearOutput() {
    setState(() {
      _textEditingController.text = '';
      n1 = '';
      n2 = '';
      opr = '';
      clk = false;
    });
  }

  void addToExpression(String value) {
    setState(() {
      if (clk) {
        n2 += value;
        _textEditingController.text = n2;
      } else {
        n1 += value;
        _textEditingController.text = n1;
      }
    });
  }

  void setOperator(String operator) {
    setState(() {
      _textEditingController.text = operator;
      opr = operator;
      clk = true;
    });
  }

  void calculateResult() {
    setState(() {
      double a = double.parse(n1);
      double b = double.parse(n2);
      double result = 0;

      switch (opr) {
        case "+":
          result = a + b;
          break;
        case "-":
          result = a - b;
          break;
        case "x":
          result = a * b;
          break;
        case "÷":
          result = a / b;
          break;
        case "MOD":
          result = a % b;
          break;
      }

      _textEditingController.text = result.toString();
      n1 = _textEditingController.text;
      n2 = "";
      clk = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Arithmetic Calculator', style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textEditingController,
                          readOnly: true,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: screenWidth * 0.1,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      buildRow(["AC", "DEL", "MOD"], [
                        Colors.grey[300]!,
                        Colors.grey[300]!,
                        Colors.deepOrange,
                      ], [
                        clearOutput,
                        deleteLastChar,
                            () => setOperator("MOD"),
                      ], screenWidth),
                      SizedBox(height: 12.0),
                      buildRow(["x²", "√", "%"], [
                        Colors.grey[300]!,
                        Colors.grey[300]!,
                        Colors.deepOrange,
                      ], [
                        square,
                        squareRoot,
                        percentage,
                      ], screenWidth),
                      SizedBox(height: 12.0),
                      buildRow(["7", "8", "9", "÷"], [
                        Colors.grey[800]!,
                        Colors.grey[800]!,
                        Colors.deepOrange,
                        Colors.deepOrange,
                      ], [
                            () => addToExpression("7"),
                            () => addToExpression("8"),
                            () => addToExpression("9"),
                            () => setOperator("÷"),
                      ], screenWidth),
                      SizedBox(height: 12.0),
                      buildRow(["4", "5", "6", "x"], [
                        Colors.grey[800]!,
                        Colors.grey[800]!,
                        Colors.deepOrange,
                        Colors.deepOrange,
                      ], [
                            () => addToExpression("4"),
                            () => addToExpression("5"),
                            () => addToExpression("6"),
                            () => setOperator("x"),
                      ], screenWidth),
                      SizedBox(height: 12.0),
                      buildRow(["1", "2", "3", "+"], [
                        Colors.grey[800]!,
                        Colors.grey[800]!,
                        Colors.deepOrange,
                        Colors.deepOrange,
                      ], [
                            () => addToExpression("1"),
                            () => addToExpression("2"),
                            () => addToExpression("3"),
                            () => setOperator("+"),
                      ], screenWidth),
                      SizedBox(height: 12.0),
                      buildRow(["+/-", "0", ".", "-"], [
                        Colors.grey[800]!,
                        Colors.grey[800]!,
                        Colors.deepOrange,
                        Colors.deepOrange,
                      ], [
                        changeSign,
                            () => addToExpression("0"),
                            () => addToExpression("."),
                            () => setOperator("-"),
                      ], screenWidth),
                      SizedBox(height: 12.0),
                      buildRow(["=", "00"], [
                        Colors.deepOrange,
                        Colors.grey[300]!,
                      ], [
                        calculateResult,
                            () => addToExpression("00"),
                      ], screenWidth),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(List<String> labels, List<Color> colors, List<Function()> onTapFunctions, double screenWidth) {
    assert(labels.length == colors.length && labels.length == onTapFunctions.length);

    final double buttonWidth = (screenWidth - 64) / 4;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        labels.length,
            (index) => ElevatedButton(
          onPressed: () => onTapFunctions[index](),
          child: Text(
            labels[index],
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, backgroundColor: colors[index],
            minimumSize: Size(buttonWidth, 60.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  void deleteLastChar() {
    if (_textEditingController.text.isNotEmpty) {
      // Get the current text from the controller
      String currentText = _textEditingController.text;

      // Remove the last character from the current text
      String newText = currentText.substring(0, currentText.length - 1);

      // Update the text in the controller and set the cursor position
      _textEditingController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length), // Set cursor at the end
      );
    }
  }



  void square() {
    setState(() {
      if (_textEditingController.text.isNotEmpty) {
        double operand = double.parse(_textEditingController.text);
        double result = operand * operand;
        _textEditingController.text = result.toStringAsFixed(0);
        n1 = _textEditingController.text;
        n2 = '';
        clk = false;
        opr = '';
      }
    });
  }

  void squareRoot() {
    setState(() {
      if (_textEditingController.text.isNotEmpty) {
        double operand = double.parse(_textEditingController.text);
        double result = sqrt(operand);
        _textEditingController.text = result.toStringAsFixed(0);
        n1 = _textEditingController.text;
        n2 = '';
        clk = false;
        opr = '';
      }
    });
  }

  void percentage() {
    setState(() {
      if (_textEditingController.text.isNotEmpty) {
        double operand = double.parse(_textEditingController.text);
        double result = operand / 100;
        _textEditingController.text = result.toStringAsFixed(2);
        n1 = _textEditingController.text;
        n2 = '';
        clk = false;
        opr = '';
      }
    });
  }

  void changeSign() {
    setState(() {
      if (_textEditingController.text.isNotEmpty) {
        double a = double.parse(_textEditingController.text);
        a *= -1;
        _textEditingController.text = a.toString();
      }
    });
  }
}