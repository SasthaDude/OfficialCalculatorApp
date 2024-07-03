import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController calu = TextEditingController();
  String bmiRes = "";

  void bmiCalc() {
    double wei = double.tryParse(weight.text) ?? 0;
    double hei = double.tryParse(height.text) ?? 0;

    if (hei > 0) {
      double bmi = wei / ((hei / 100) * (hei / 100));
      calu.text = bmi.toStringAsFixed(2);

      setState(() {
        if (bmi < 18.5) {
          bmiRes = "Underweight";
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          bmiRes = "Normal weight";
        } else if (bmi >= 25 && bmi <= 29.9) {
          bmiRes = "Overweight";
        } else if (bmi >= 30) {
          bmiRes = "Obesity";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("BMI CALCULATOR"),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weight in KG:",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(fontSize: screenWidth * 0.06),
                    controller: weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Height in cm:",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(fontSize: screenWidth * 0.06),
                    controller: height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            ElevatedButton(
              onPressed: () {
                bmiCalc();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                  horizontal: screenWidth * 0.1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow),
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade900,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Your Body Mass Index",
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "BMI is",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(fontSize: screenWidth * 0.06, color: Colors.black, fontWeight: FontWeight.bold),
                          controller: calu,
                          enabled: false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Result:",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        bmiRes,
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}


