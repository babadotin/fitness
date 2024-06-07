import 'package:fitness/Work_file/Widgets/nextbutton.dart';
import 'package:fitness/Work_file/Widgets/textcontainer.dart';
import 'package:fitness/Work_file/hwscreen.dart';
import 'package:flutter/material.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextContainer(size: size, text: 'I am'),
            SizedBox(height: size.height * 0.15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.1,
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 22, 30, 80)
                              .withOpacity(0.5),
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 22, 30, 80)
                              .withOpacity(0.5),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 22, 30, 80)
                              .withOpacity(0.5),
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(top: 20),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 22, 30, 80),
                    ),
                    onChanged: (value) {
                      setState(
                        () {},
                      );
                    },
                  ),
                ),
                const Text(
                  '  Years Old.   ',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 22, 30, 80),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.16),
            const NextButton(
              // size: size,
              screen: HWScreen(),
            )
          ],
        ),
      ),
    );
  }
}
