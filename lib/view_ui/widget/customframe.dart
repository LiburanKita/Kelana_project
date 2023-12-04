import 'package:flutter/material.dart';

class MyCustomFrame extends StatelessWidget {
  const MyCustomFrame({
    super.key,
    this.strText = '',
    this.borderRadius = 15,
    this.heightValue = 30,
    this.widthValue = 100,
  });
  final String strText;
  final double borderRadius;
  final double heightValue;
  final double widthValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.greenAccent,
      ),
      height: heightValue,
      width: widthValue,
      child: Center(
        child: Text(
          strText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
