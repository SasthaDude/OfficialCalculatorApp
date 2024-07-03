import 'package:calculatorapplication/Calculators/BMICalculator.dart';
import 'package:flutter/material.dart';
import '../Calculators/AgeCalculator.dart';
import '../Calculators/ArthimeticCalculator.dart';
import '../Calculators/GSTCalculator.dart';


class AllCalculators extends StatefulWidget {
  const AllCalculators({super.key});

  @override
  State<AllCalculators> createState() => _AllCalculatorsState();
}

class _AllCalculatorsState extends State<AllCalculators> {

  int _index = 0 ;

  final page= [
    ArithmeticCalculator(),
    BMICalculator(),
    GSTCalculator(),
    AgeCalculator()
  ];

  void tap(index)
  {
    setState(() {
      _index = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined),label: "Arithmetic"),
          BottomNavigationBarItem(icon: Icon(Icons.line_weight),label: "BMI"),
          BottomNavigationBarItem(icon: Icon(Icons.price_change_outlined),label: "GST"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "AGE"),
        ],
        currentIndex: _index,
        onTap: tap,
      ),
    );
  }
}