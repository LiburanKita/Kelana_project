import 'package:flutter/material.dart';
import 'package:skuyskuy/view_ui/widget/padding.dart';

import '../../viewmodel/viewmodel_riverpod/mainmodel.dart';

class ActionMenuContent extends StatelessWidget {
  const ActionMenuContent(
      {super.key,
      this.resizeHeight = 2.0,
      this.paddingValueTBLR = const [0.0, 0.0, 0.0, 0.0],
      this.isShowOwnerContent = true});
  final double resizeHeight;
  final List<double> paddingValueTBLR;
  final bool isShowOwnerContent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: paddingValueTBLR[3],
      bottom: paddingValueTBLR[1],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            height: displayWidth(context) / 3,
            width: 40,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // const WidgetPaddingOnly(topPadding: 5),
                // Icon(
                //   Icons.keyboard_arrow_down_sharp,
                //   color: Colors.purple[300],
                //   size: 30,
                // ),
                // const WidgetPaddingOnly(topPadding: 10),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.bookmark_add,
                  color: Colors.white,
                  size: 40,
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 40,
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.comment,
                  color: Colors.white,
                  size: 40,
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          const WidgetPaddingOnly(bottomPadding: 5),
          isShowOwnerContent
              ? const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    "https://kiryuu.id/wp-content/uploads/2021"
                    "/05/logo-kiryuu-219671-d1yvN4qK.png",
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
