import 'package:fitness/Work_file/Result%20&%20DietPlan/Normal%20Weight/nonveg_diet_chart.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/Normal%20Weight/Per%20Day%20Diet%20Chart/veg_diet_chart.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/Normal%20Weight/exercise_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NormalWeightPage extends StatelessWidget {
  const NormalWeightPage({super.key});
  void _showDietTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Diet Type'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VegDietChart(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 20, 30, 82)),
              ),
              child: const Text(
                'Vegetarian',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NonvegDietChart(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 20, 30, 82)),
              ),
              child: const Text(
                'Non-Vegetarian',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Normal Weight Page')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                _showDietTypeDialog(context);
              },
              child: SvgPicture.asset(
                'assets/menu/diet_plan.svg',
              ),
            ),
            const Text(
              'Diet Plan',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 22, 31, 83),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExerciseChart(),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/menu/healthy_habit.svg',
              ),
            ),
            const Text(
              'My WorkOut',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 22, 31, 83),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         PersonalTrainer(),
                //   ),
                // );
              },
              child: SvgPicture.asset(
                'assets/menu/personal_trainer.svg',
              ),
            ),
            const Text(
              'Personal Trainer',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 22, 31, 83),
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     // Define your action here
            //   },
            //   child: Image.asset(
            //     'assets/menu/personal_trainer.svg',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
