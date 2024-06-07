import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/Normal%20Weight/nonveg_diet_chart.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/Normal%20Weight/Per%20Day%20Diet%20Chart/veg_diet_chart.dart';
import 'package:fitness/Work_file/Result%20&%20DietPlan/Normal%20Weight/exercise_chart.dart';

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
      body: SizedBox.expand(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            _buildPage(
              context,
              'assets/menu/diet_plan.svg',
              'Diet Plan',
              () => _showDietTypeDialog(context),
            ),
            _buildPage(
              context,
              'assets/menu/healthy_habit.svg',
              'My WorkOut',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExerciseChart(),
                  ),
                );
              },
            ),
            _buildPage(
              context,
              'assets/menu/personal_trainer.svg',
              'Personal Trainer',
              () {
                // Uncomment the following lines to navigate to the Personal Trainer page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PersonalTrainer(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, String assetPath, String title,
      VoidCallback onTap) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset(assetPath),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 22, 31, 83),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
