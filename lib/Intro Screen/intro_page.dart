import 'package:fitness/Intro%20Screen/care_view.dart';
import 'package:fitness/Intro%20Screen/center_next_button.dart';
import 'package:fitness/Intro%20Screen/mood_diary_view.dart';
import 'package:fitness/Intro%20Screen/relax_view.dart';
import 'package:fitness/Intro%20Screen/splash_view.dart';
import 'package:fitness/Intro%20Screen/top_back_skip_view.dart';
import 'package:fitness/Intro%20Screen/welcome_view.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(animationController!.value.toString());
    return Scaffold(
      backgroundColor: const Color(0xffF7EBE1),
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: animationController!,
            ),
            RelaxView(
              animationController: animationController!,
            ),
            CareView(
              animationController: animationController!,
            ),
            MoodDiaryVew(
              animationController: animationController!,
            ),
            WelcomeView(
              animationController: animationController!,
            ),
            TopBackSkipView(
              onBackClick: onBackClick,
              onSkipClick: onSkipClick,
              animationController: animationController!,
            ),
            CenterNextButton(
              animationController: animationController!,
              onNextClick: onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void onSkipClick() {
    animationController?.animateTo(0.8,
        duration: const Duration(milliseconds: 1200));
  }

  void onBackClick() {
    if (animationController!.value >= 0 && animationController!.value <= 0.2) {
      animationController?.animateTo(0.0);
    } else if (animationController!.value > 0.2 &&
        animationController!.value <= 0.4) {
      animationController?.animateTo(0.2);
    } else if (animationController!.value > 0.4 &&
        animationController!.value <= 0.6) {
      animationController?.animateTo(0.4);
    } else if (animationController!.value > 0.6 &&
        animationController!.value <= 0.8) {
      animationController?.animateTo(0.6);
    } else if (animationController!.value > 0.8 &&
        animationController!.value <= 1.0) {
      animationController?.animateTo(0.8);
    }
  }

  void onNextClick() {
    if (animationController!.value >= 0 && animationController!.value <= 0.2) {
      animationController?.animateTo(0.4);
    } else if (animationController!.value > 0.2 &&
        animationController!.value <= 0.4) {
      animationController?.animateTo(0.6);
    } else if (animationController!.value > 0.4 &&
        animationController!.value <= 0.6) {
      animationController?.animateTo(0.8);
    } else if (animationController!.value > 0.6 &&
        animationController!.value <= 0.8) {
      signUpClick();
    }
  }

  void signUpClick() {
    Navigator.pop(context);
  }
}
