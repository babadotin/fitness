import 'package:fitness/Work_file/Widgets/nextbutton.dart';
import 'package:fitness/Work_file/Widgets/textcontainer.dart';
import 'package:fitness/Work_file/agescreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool mIsChecked = false;
  bool fIsChecked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextContainer(
            size: size,
            text: 'I am a ',
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const CircleImage(gender: 'male'),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: mIsChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          if (fIsChecked == true) {
                            fIsChecked = false;
                          }
                          mIsChecked = value!;
                        });
                        setState(() {});
                        // print('isChecked: $isChecked');
                      },
                      // activeColor: const Color.fromARGB(255, 22, 30, 80),
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return const Color.fromARGB(255, 22, 30, 80)
                              .withOpacity(.32);
                        }
                        return const Color.fromARGB(255, 22, 30, 80);
                      }),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                  const Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 22, 30, 80),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const CircleImage(gender: 'female'),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: fIsChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          if (mIsChecked == true) {
                            mIsChecked = false;
                          }
                          fIsChecked = value!;
                        });
                        setState(
                          () {},
                        );
                        // print('isChecked: $isChecked');
                      },
                      activeColor: const Color.fromARGB(255, 22, 30, 80),
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return const Color.fromARGB(255, 22, 30, 80)
                              .withOpacity(.32);
                        }
                        return const Color.fromARGB(255, 22, 30, 80);
                      }),
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                  const Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 22, 30, 80),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: size.height * 0.16),
          const NextButton(
            // size: size,
            screen: AgeScreen(),
          ),
        ],
      ),
    );
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    required this.gender,
  });

  final String gender;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: const Color.fromARGB(255, 22, 30, 80),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(
          'assets/images/$gender.png',
        ),
      ),
    );
  }
}
