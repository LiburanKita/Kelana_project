import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WidgetAnimatedText extends StatelessWidget {
  const WidgetAnimatedText({Key? key, required this.textValue})
      : super(key: key);
  final String textValue;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 30,
        color: Color.fromARGB(255, 43, 184, 137),
      ),
      child: Center(
        child: AnimatedTextKit(
          repeatForever: false,
          isRepeatingAnimation: false,
          pause: const Duration(
            milliseconds: 1,
          ),
          animatedTexts: [
            WavyAnimatedText(textValue),
          ],
        ),
      ),
    );
  }
}
