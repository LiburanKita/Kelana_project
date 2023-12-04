import 'package:flutter/material.dart';
import 'package:skuyskuy/view_ui/widget/actionmenucontent.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/mainmodel.dart';

class WidgetCardList extends StatelessWidget {
  const WidgetCardList(
      {super.key,
      this.resizeHeight = 2.0,
      this.paddingValueTBLR = const [0.0, 0.0, 0.0, 0.0],
      this.isShowOwnerContent = true,
      this.isShowActionMenu = true,
      this.data});
  final double resizeHeight;
  final List<double> paddingValueTBLR; //top bottom left right
  final bool isShowOwnerContent;
  final bool isShowActionMenu;
  final Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> imageList = data?['image'] ?? [];
    final String imageUrl = imageList.isNotEmpty
        ? imageList[0]
        : "https://kiryuu.id/wp-content/uploads/2021/05/logo-kiryuu-219671-d1yvN4qK.png";

    return Container(
      height: resizeHeight,
      color: const Color.fromARGB(255, 190, 231, 211),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      child: Stack(children: [
        Image(
          alignment: Alignment.topCenter,
          height: (displayHeight(context) / 1.5),
          width: (displayWidth(context)),
          fit: BoxFit.contain,
          image: NetworkImage(imageUrl),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 5, bottom: paddingValueTBLR[1]),
          child: const Text("Lorem Ipsum Lorem Ipsum \n"
              "Lorem Ipsum Lorem Ipsum... show all"),
        ),
        isShowActionMenu
            ? ActionMenuContent(
                paddingValueTBLR: const [0.0, 5, 0.0, 5],
                isShowOwnerContent: isShowOwnerContent,
              )
            : const SizedBox(),
      ]),
    );
  }
}
