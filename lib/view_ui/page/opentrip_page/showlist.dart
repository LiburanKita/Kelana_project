import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:skuyskuy/view_ui/page/opentrip_page/view_model/opentripmodel.dart';
import 'package:skuyskuy/view_ui/widget/padding.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/mainmodel.dart';

showListOT(Map<String, dynamic>? firebaseData, BuildContext context) {
  final List<dynamic>? imageList = firebaseData?['image'] ?? [];
  List<String> urlList =
      imageList!.map((dynamic item) => item.toString()).toList();
  String titleOT = firebaseData?['title'];
  String scheduleOT = firebaseData?['schedule'];
  String descriptionOT = firebaseData?['description'];
  String participantsOT = firebaseData?['participants'];
  String priceOT = firebaseData?['price'];

  return Consumer(
    builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return Stack(
        children: [
          Column(
            children: [
              FanCarouselImageSlider(
                sliderDuration: const Duration(milliseconds: 100),
                imagesLink: urlList,
                isAssets: false,
                initalPageIndex: 0, // Set the initial page index to 0
                autoPlay: false,
                expandedImageFitMode: BoxFit.contain,
                expandImageHeight: 600,
                imageRadius: 40,
              ),
              const WidgetPaddingOnly(topPadding: 15),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.greenAccent.shade400,
                      width: 2.5,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.only(
                      bottom: 5.0, top: 5.0, left: 15, right: 15),
                  child: Text(
                    titleOT,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const WidgetPaddingOnly(
                topPadding: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: displayWidth(context) - 20,
                    height: displayHeight(context) / 4.5,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.greenAccent.shade400,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.all(3),
                    padding: const EdgeInsets.only(
                        bottom: 15.0, top: 10.0, left: 15, right: 15),
                    child: ListView(
                      children: [
                        Stack(
                          children: [
                            const Icon(
                              Icons.arrow_drop_down_circle,
                              size: 40,
                            ),
                            RoundedBackgroundText(
                              "# " +
                                  scheduleOT +
                                  "\n# " +
                                  descriptionOT +
                                  "\n# " +
                                  participantsOT +
                                  "\n#  Rp." +
                                  priceOT,
                              style: const TextStyle(fontSize: 18, height: 1.7),
                              backgroundColor: Colors.greenAccent.shade400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5),
                child: SizedBox(
                  width: displayWidth(context) - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 40,
                        color: Colors.greenAccent.shade700,
                      ),
                      const WidgetPaddingOnly(rightPadding: 20),
                      GestureDetector(
                        onTap: () {
                          ref.read(showCommentContainer.notifier).state = true;
                        },
                        child: Icon(
                          Icons.comment_outlined,
                          size: 40,
                          color: Colors.greenAccent.shade700,
                        ),
                      ),
                      const WidgetPaddingOnly(rightPadding: 20),
                      Icon(
                        Icons.bookmark_add_outlined,
                        size: 40,
                        color: Colors.greenAccent.shade700,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          //akasjdlkasjdlasjdlkasjsad
          !ref.watch(showCommentContainer)
              ? const SizedBox()
              : Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(top: displayHeight(context) / 3),
                    child: Container(
                      width: displayWidth(context),
                      height: displayHeight(context) / 1.5,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 190, 231, 211),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  ref
                                      .read(showCommentContainer.notifier)
                                      .state = false;
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 50,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
          //asdkkasldjaslkjdlkasjdkla
        ],
      );
    },
  );
}
