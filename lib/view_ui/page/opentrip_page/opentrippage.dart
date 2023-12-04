import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuyskuy/view_ui/page/opentrip_page/showlist.dart';
import 'package:skuyskuy/view_ui/page/opentrip_page/view_model/opentripmodel.dart';
import 'package:skuyskuy/viewmodel/viewmodel_firebase/getdataot.dart';

class MyOpenTripPage extends ConsumerStatefulWidget {
  const MyOpenTripPage({super.key});

  @override
  ConsumerState<MyOpenTripPage> createState() => _MyOpenTripPageState();
}

class _MyOpenTripPageState extends ConsumerState<MyOpenTripPage>
    with AutomaticKeepAliveClientMixin<MyOpenTripPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<String> imgDataShow = [];
    PageController _pageController = PageController(initialPage: 0);
    lastDocument = null;
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchDataFromFirestore(15),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                imgDataShow.add("");
                return PageView(
                  scrollDirection: Axis.vertical,
                  controller: _pageController,
                  onPageChanged: (value) =>
                      ref.read(showCommentContainer.notifier).state = false,
                  children: [
                    for (var item in snapshot.data!) showListOT(item, context),
                  ],
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
          Positioned(
            bottom: 85,
            right: 35,
            child: FloatingActionButton(
              backgroundColor: Colors.greenAccent.shade400,
              onPressed: () {
                setState(() {
                  // Clear existing data
                  imgDataShow.clear();
                  lastDocument = null;
                });
                fetchDataFromFirestore(15);
              },
              child: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
          ),
          //CommentContainer
        ],
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchDataFromFirestore(int maxData) async {
    List<Map<String, dynamic>> data = await getDataFromFirestore(maxData);
    for (var item in data) {
      log(item.toString());
    }
    return data;
  }
}
