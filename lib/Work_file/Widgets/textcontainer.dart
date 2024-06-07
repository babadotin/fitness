import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required this.size,
    required this.text,
  });

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: Color.fromARGB(255, 19, 27, 70),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/menu/barbell.png',
                    color: Colors.white,
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * 0.3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 45,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '$text...',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
