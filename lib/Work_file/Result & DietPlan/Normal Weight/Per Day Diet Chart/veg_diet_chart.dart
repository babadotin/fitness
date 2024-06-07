import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VegDietChart extends StatefulWidget {
  const VegDietChart({super.key});

  @override
  VegDietChartState createState() => VegDietChartState();
}

class VegDietChartState extends State<VegDietChart> {
  late int selectedIndex;
  late String todayDay;
  late int todayDate;

  @override
  void initState() {
    super.initState();
    DateTime today = DateTime.now();
    todayDay = DateFormat('EEE').format(today).toUpperCase();
    todayDate = today.day;
    selectedIndex = 0;
  }

  void onDayDateButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Veg Diet Chart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Color.fromARGB(255, 22, 32, 92),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$todayDay, $todayDate',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromARGB(255, 22, 32, 92),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 700,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 32, 87),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Text(
                            'Breakfast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/menu/breakfast.png',
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 32, 87),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: Image.asset(
                              'assets/menu/Lunch.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Lunch',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 32, 87),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          const Text(
                            'Dinner',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 150,
                            child: Image.asset(
                              'assets/menu/dinner.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
