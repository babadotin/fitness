import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.screen,
  });

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, bottom: 20),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 19, 27, 70),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
