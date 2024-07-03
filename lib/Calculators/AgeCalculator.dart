import 'package:flutter/material.dart';

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({Key? key}) : super(key: key);

  @override
  State<AgeCalculator> createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  TextEditingController dobDate = TextEditingController();
  TextEditingController dobMonth = TextEditingController();
  TextEditingController dobYear = TextEditingController();
  TextEditingController prDate = TextEditingController();
  TextEditingController prMonth = TextEditingController();
  TextEditingController prYear = TextEditingController();
  TextEditingController ageDays = TextEditingController();
  TextEditingController ageYears = TextEditingController();
  TextEditingController ageMonths = TextEditingController();

  void calculateAge() {
    int dDate = int.tryParse(dobDate.text) ?? 1;
    int dMonth = int.tryParse(dobMonth.text) ?? 1;
    int dYear = int.tryParse(dobYear.text) ?? 2000;
    int pDate = int.tryParse(prDate.text) ?? 1;
    int pMonth = int.tryParse(prMonth.text) ?? 1;
    int pYear = int.tryParse(prYear.text) ?? 2023;

    int daysInMonth = 30; // Assuming 30 days per month for simplicity

    int ageYearsResult = pYear - dYear;
    int ageMonthsResult = pMonth - dMonth;
    int ageDaysResult = pDate - dDate;

    if (ageDaysResult < 0) {
      ageMonthsResult--;
      ageDaysResult += daysInMonth;
    }
    if (ageMonthsResult < 0) {
      ageYearsResult--;
      ageMonthsResult += 12;
    }

    ageYears.text = ageYearsResult.toString();
    ageMonths.text = ageMonthsResult.toString();
    ageDays.text = ageDaysResult.toString();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("AGE CALCULATOR"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Date of Birth",
              style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: dobDate,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Date",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    controller: dobMonth,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Month",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    controller: dobYear,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Year",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              "Age at the date of",
              style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: prDate,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Date",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    controller: prMonth,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Month",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    controller: prYear,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Year",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                calculateAge();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
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
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Age in years:",
                  style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    controller: ageYears,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Years",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Age in months:",
                  style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    controller: ageMonths,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Months",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Age in days:",
                  style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: TextFormField(
                    controller: ageDays,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Days",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
