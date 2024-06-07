import 'package:flutter/material.dart';
import 'package:fitness/Work_file/homescreen.dart';
import 'package:fitness/Work_file/calculation.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double bmi = double.tryParse(bmiResult) ?? 0.0;

    Calculation calc = Calculation(
        height: 0,
        weight:
            0); // Height and weight are not used in these methods, hence dummy values
    calc.setBMI(bmi);

    Color buttonColor = calc.getButtonColor();
    String buttonText = calc.getButtonText();
    Widget nextPage = calc.getNextPage();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 19, 27, 70),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 19, 27, 70),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/menu/heart.png',
              color: const Color.fromARGB(255, 19, 27, 70),
            ),
            Text(
              '$resultText\n\nBMI:',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 19, 27, 70),
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              bmiResult,
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 19, 27, 70),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                interpretation,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 19, 27, 70),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size.height * 0.08),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => nextPage,
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: 12.0,
                  bottom: 30,
                  left: size.width * 0.3,
                ),
                child: Container(
                  width: size.width * 0.65,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19.8,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: 12.0,
                  bottom: 30,
                  left: size.width * 0.3,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 27, 70),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const ListTile(
                    title: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Find BMI Again!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
