import 'package:flutter/material.dart';

class ReusableDialog extends StatelessWidget {
  final String title;
  final String content;
  final String defaultTitle = "Default Title";
  final String defaultContent = "Default Content";

  const ReusableDialog({super.key, this.title = "", this.content = ""});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 200.0,
        width: 300.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                title.isEmpty ? defaultTitle : title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                content.isEmpty ? defaultContent : content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
