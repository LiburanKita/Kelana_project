import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skuyskuy/view_ui/widget/cardlist.dart';
import 'package:skuyskuy/view_ui/widget/customframe.dart';
import 'package:skuyskuy/view_ui/widget/padding.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/mainmodel.dart';

import '../../viewmodel/viewmodel_firebase/logoutapp.dart';
import '../widget/showdialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.uName = ''});
  final String? uName;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const ReusableDialog(
                    title: "Custom Title",
                    content: "Custom Content",
                  ),
                );
                log('klik profil');
              },
              child: const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    "https://kiryuu.id/wp-content/uploads/2021"
                    "/05/logo-kiryuu-219671-d1yvN4qK.png",
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                loginStateCheck(context);
              },
              child: const MyCustomFrame(
                borderRadius: 1,
                strText: 'Log Out',
                heightValue: 35,
              ),
            ),
          )
        ]),
        const WidgetPaddingOnly(topPadding: 10),
        Center(
          child: Text(
            uName!,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const Center(child: Text("@qulbuddin")),
        const WidgetPaddingOnly(topPadding: 10),
        const Align(
            child: MyCustomFrame(
          strText: 'About Me',
          widthValue: 120,
        )),
        const WidgetPaddingOnly(topPadding: 10),
        Center(
          child: Container(
            width: displayWidth(context) - 36,
            height: 2,
            color: Colors.purple[100],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: WidgetCardList(
            resizeHeight: 200,
            isShowOwnerContent: false,
            paddingValueTBLR: [0.0, 0.0, 0.0, 0.0],
            isShowActionMenu: false,
          ),
        ),
      ],
    );
  }
}
