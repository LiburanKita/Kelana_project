import 'dart:developer';

import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final List<Color> colors;
  final BorderRadius borderRadius;

  const GradientButton({
    super.key,
    this.text = 'Button',
    required this.onPressed,
    this.colors = const [Colors.blue, Colors.red],
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {
            log("message");
          },
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
