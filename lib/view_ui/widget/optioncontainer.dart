import 'package:flutter/material.dart';
import 'package:skuyskuy/view_ui/widget/padding.dart';

import '../../viewmodel/viewmodel_riverpod/mainmodel.dart';

class MyOptionContainer extends StatelessWidget {
  const MyOptionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 192, 107, 207),
              ),
              width: displayWidth(context) / 3,
              height: 40,
              child: const Text(
                'All Post',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            const WidgetPaddingOnly(rightPadding: 15),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 192, 107, 207)),
              width: displayWidth(context) / 3,
              height: 40,
              child: const Text(
                'Open Trip',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ));
  }
}
