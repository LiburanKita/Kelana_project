import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:skuyskuy/view_ui/page/bookmarkpage.dart';
import 'package:skuyskuy/view_ui/page/globalpost_page/globalpostpage.dart';
import 'package:skuyskuy/view_ui/page/homepage.dart';
import 'package:skuyskuy/view_ui/page/opentrip_page/opentrippage.dart';
import 'package:skuyskuy/view_ui/page/post_page/postpage.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/mainmodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.userName = ''}) : super(key: key);
  final String? userName;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  final List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      if (currentPage == 2) {
        return;
      }
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FractionallySizedBox(
          child: FrostedBottomBar(
            width: displayWidth(context) * 0.6,
            bottomBarColor: Colors.greenAccent,
            opacity: 1,
            sigmaX: 5,
            sigmaY: 5,
            scrollOpposite: true,
            borderRadius: BorderRadius.circular(25),
            duration: const Duration(milliseconds: 800),
            hideOnScroll: true,
            child: TabBar(
              indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              controller: tabController,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.white, width: 4),
                insets: EdgeInsets.fromLTRB(6, 2, 0, 0),
              ),
              tabs: [
                TabsIcon(
                    icons: Icons.home,
                    color: currentPage == 0
                        ? colors[0]
                        : const Color.fromARGB(255, 43, 184, 137)),
                TabsIcon(
                    icons: Icons.search,
                    color: currentPage == 1
                        ? colors[1]
                        : const Color.fromARGB(255, 43, 184, 137)),
                TabsIcon(
                    icons: Icons.add_circle,
                    color: currentPage == 2 ? colors[2] : Colors.white),
                TabsIcon(
                    icons: Icons.explore_outlined,
                    color: currentPage == 3
                        ? colors[3]
                        : const Color.fromARGB(255, 43, 184, 137)),
                TabsIcon(
                    icons: Icons.bookmark_added,
                    color: currentPage == 4
                        ? colors[4]
                        : const Color.fromARGB(255, 43, 184, 137)),
              ],
            ),
            body: (context, controller) => TabBarView(
              controller: tabController,
              dragStartBehavior: DragStartBehavior.down,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomePage(uName: widget.userName),
                const MyGlobalPostPage(),
                // Stack(
                //   children: [
                //     ListView.builder(
                //       itemCount: 10,
                //       controller: controller,
                //       itemBuilder: (context, index) {
                //         if (index == 0) {
                //           return const SizedBox();
                //         } else if (index == 1) {
                //           return const SizedBox();
                //         } else {
                //           return const MyGlobalPost();
                //         }
                //       },
                //     ),
                //     // const Padding(
                //     //   padding: EdgeInsets.only(bottom: 75),
                //     //   child: MyOptionContainer(),
                //     // ),
                //   ],
                // ),
                //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                // ListView.builder(
                //   controller: controller,
                //   itemBuilder: (context, index) {
                //     return const Card(child: FittedBox(child: FlutterLogo()));
                //   },
                // ),
                //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                const MyPostPage(),
                const MyOpenTripPage(),
                const BookmarkPage() //TinderClone()
                // ListView.builder(
                //   controller: controller,
                //   itemBuilder: (context, index) {
                //     return const Card(child: FittedBox(child: FlutterLogo()));
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon(
      {Key? key,
      this.color = Colors.white,
      this.height = 50,
      this.width = 50,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
        ),
      ),
    );
  }
}
