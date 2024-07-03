import 'package:flutter/material.dart';

class GSTCalculator extends StatefulWidget {
  const GSTCalculator({Key? key}) : super(key: key);

  @override
  State<GSTCalculator> createState() => _GSTCalculatorState();
}

class _GSTCalculatorState extends State<GSTCalculator> {
  TextEditingController price = TextEditingController();
  TextEditingController gstRate = TextEditingController();
  TextEditingController excl = TextEditingController();
  TextEditingController incl = TextEditingController();
  TextEditingController cent = TextEditingController();
  TextEditingController sta = TextEditingController();

  void calcGst() {
    double gst = double.tryParse(gstRate.text) ?? 0;
    double prc = double.tryParse(price.text) ?? 0;

    double excluding = (gst / 100) * prc;
    double including = prc - (prc / (1 + (gst / 100)));
    double central = excluding / 2;
    double state = including / 2;

    excl.text = excluding.toStringAsFixed(2);
    incl.text = including.toStringAsFixed(2);
    cent.text = central.toStringAsFixed(2);
    sta.text = state.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "GST Calculator",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "PRICE (₹)",
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
            ),
            SizedBox(height: screenHeight * 0.01),
            TextFormField(
              style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.06),
              controller: price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              "GST RATE (%)",
              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.05),
            ),
            SizedBox(height: screenHeight * 0.01),
            TextFormField(
              style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.06),
              controller: gstRate,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: () {
                calcGst();
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
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Excluding",
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                        controller: excl,
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Including",
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(

                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                        controller: incl,
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "CGST",
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                        controller: cent,
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "SGST",
                      style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(

                      height: screenHeight * 0.1,
                      width: screenWidth * 0.3,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                        controller: sta,
                        enabled: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}


