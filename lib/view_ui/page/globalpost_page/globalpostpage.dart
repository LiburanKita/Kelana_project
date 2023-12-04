import 'package:flutter/material.dart';
import 'package:skuyskuy/view_ui/widget/cardlist.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/mainmodel.dart';

class MyGlobalPostPage extends StatefulWidget {
  const MyGlobalPostPage({super.key});

  @override
  _MyGlobalPostPageState createState() => _MyGlobalPostPageState();
}

class _MyGlobalPostPageState extends State<MyGlobalPostPage>
    with AutomaticKeepAliveClientMixin<MyGlobalPostPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(initialPage: 0);
    super.build(context); // tambahkan baris ini
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        children: [
          for (int i = 0; i <= 5; i++)
            WidgetCardList(
              paddingValueTBLR: [
                0.0,
                displayHeight(context) * (10 / 100),
                0.0,
                15
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: const Icon(Icons.category),
      ),
    );
  }
}
