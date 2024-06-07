import 'package:fitness/Work_file/Widgets/textcontainer.dart';
import 'package:fitness/Work_file/calculation.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/resultscreen.dart';
import 'package:flutter/material.dart';

class HWScreen extends StatefulWidget {
  const HWScreen({super.key});

  @override
  State<HWScreen> createState() => _HWScreenState();
}

class _HWScreenState extends State<HWScreen> {
  int height = 180;
  int weight = 70;

  Map<String, int> convertHeightToFeetAndInches(int heightCm) {
    double heightInInches = heightCm / 2.54;
    int feet = (heightInInches / 12).floor();
    int inches = (heightInInches % 12).round();
    return {'feet': feet, 'inches': inches};
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, int> heightInFeetAndInches =
        convertHeightToFeetAndInches(height);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 22, 30, 80),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextContainer(size: size, text: 'I have '),
          const SizedBox(height: 50),
          const Title(title: 'Height'),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: const Color.fromARGB(255, 22, 30, 80),
                    inactiveColor:
                        const Color.fromARGB(255, 22, 30, 80).withOpacity(0.25),
                    onChanged: (double newvalue) {
                      setState(
                        () {
                          height = newvalue.round();
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 22, 30, 80)
                          .withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${heightInFeetAndInches['feet']}\' ${heightInFeetAndInches['inches']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 22, 30, 80),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Title(title: 'Weight'),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Slider(
                    value: weight.toDouble(),
                    min: 30,
                    max: 120,
                    activeColor: const Color.fromARGB(255, 22, 30, 80),
                    inactiveColor:
                        const Color.fromARGB(255, 22, 30, 80).withOpacity(0.25),
                    onChanged: (double newvalue) {
                      setState(() {
                        weight = newvalue.round();
                      });
                    },
                  ),
                ),
                Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 22, 30, 80)
                          .withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${weight}kg',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 22, 30, 80),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.1),
          GestureDetector(
            onTap: () {
              Calculation calc = Calculation(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.result(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // width: size.width * 0.72,
                // height: size.height * 0.07,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 22, 30, 80),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: ListTile(
                    title: Text(
                      'Your BMI',
                      style: TextStyle(color: Colors.white, fontSize: 19.9),
                    ),
                    trailing: Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 22, 30, 80),
        ),
      ),
    );
  }
}
