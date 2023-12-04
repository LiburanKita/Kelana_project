import 'package:flutter/cupertino.dart';

class WidgetPaddingOnly extends StatelessWidget {
  const WidgetPaddingOnly(
      {Key? key,
      this.topPadding = 0,
      this.bottomPadding = 0,
      this.leftPadding = 0,
      this.rightPadding = 0})
      : super(key: key);

  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
        left: leftPadding,
        right: rightPadding,
      ),
    );
  }
}
