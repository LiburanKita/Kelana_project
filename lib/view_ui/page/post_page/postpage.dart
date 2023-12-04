import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skuyskuy/view_ui/page/post_page/formopentrip.dart';
import 'package:skuyskuy/view_ui/page/post_page/postpagemethod.dart';
import 'package:skuyskuy/view_ui/widget/customframe.dart';
import 'package:skuyskuy/view_ui/widget/padding.dart';
import 'package:skuyskuy/view_ui/widget/showdialog.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/postpagemodel.dart';

class MyPostPage extends ConsumerStatefulWidget {
  const MyPostPage({super.key});

  @override
  ConsumerState<MyPostPage> createState() => _MyPostPageState();

  pickMultiImage() {}
}

class _MyPostPageState extends ConsumerState<MyPostPage> {
  // penggunaan single pick immage
  // File? image;
  // Future getImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   try {
  //     final XFile? imagePicked = await picker.pickImage(
  //       source: ImageSource.gallery,
  //     );
  //     image = File(imagePicked!.path);
  //   } catch (e) {
  //     log(e.toString());
  //   }

  List<File> imagePicked = [];
  var videoPicked = File('');
  getImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final List<XFile> imagePick = await picker.pickMultiImage();
      imagePicked = imagePick.map((e) => File(e.path)).toList();
    } catch (e) {
      log(e.toString());
    }
    setState(() {});
  }

  getVideo() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? videoPick =
          await picker.pickVideo(source: ImageSource.gallery);
      videoPicked = File(videoPick!.path);
    } catch (e) {
      log(e.toString());
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool showPickerAsContent = ref.watch(tapContentProvider);
    bool showPickerAsOpenTrip = ref.watch(tapOpenTripProvider);
    String titleField = ref.watch(titleFieldValueProvider);
    String descriptionField = ref.watch(descriptionsFieldValueProvider);
    String priceOTField = ref.watch(priceOTFieldValueProvider);
    String participantField = ref.watch(participantsFieldValueProvider);
    bool isUploadContent = ref.watch(isUploadProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              showImage(imagePicked, context),
              if (ref.watch(tapContentProvider.notifier).state == true &&
                  imagePicked.isNotEmpty)
                const FormOpenTrip()
              else if (ref.watch(tapOpenTripProvider.notifier).state == true &&
                  imagePicked.isNotEmpty)
                const FormOpenTrip()
              else
                const SizedBox(),
              (ref.watch(tapContentProvider.notifier).state == true ||
                          ref.watch(tapOpenTripProvider.notifier).state ==
                              true) &&
                      imagePicked.isNotEmpty
                  ? const SizedBox()
                  : const Expanded(child: SizedBox()),
              const WidgetPaddingOnly(topPadding: 10),
              Container(
                padding: const EdgeInsets.only(bottom: 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: (showPickerAsContent || showPickerAsOpenTrip) &&
                          (videoPicked.path.isEmpty && imagePicked.isEmpty)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                ref.read(isImgPost.notifier).state = true;
                                getImage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.greenAccent,
                                ),
                                height: 60,
                                width: 100,
                                child: const Center(
                                  child: Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: Color.fromARGB(255, 43, 184, 137),
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                            const WidgetPaddingOnly(rightPadding: 3),
                            GestureDetector(
                              onTap: () {
                                ref.read(isImgPost.notifier).state = false;
                                getVideo();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.greenAccent,
                                ),
                                height: 60,
                                width: 100,
                                child: const Center(
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    color: Color.fromARGB(255, 43, 184, 137),
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
              ),
              const WidgetPaddingOnly(topPadding: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: showPickerAsContent || showPickerAsOpenTrip
                    ? [
                        GestureDetector(
                          child: const MyCustomFrame(
                              strText: 'Cancel',
                              widthValue: 100,
                              heightValue: 60,
                              borderRadius: 5),
                          onTap: () {
                            ref.read(tapContentProvider.notifier).state = false;
                            ref.read(tapOpenTripProvider.notifier).state =
                                false;
                            imagePicked.clear();
                            videoPicked = File('');
                          },
                        ),
                        const WidgetPaddingOnly(
                          rightPadding: 3,
                        ),
                        GestureDetector(
                          child: Stack(
                            children: [
                              !isUploadContent
                                  ? const MyCustomFrame(
                                      strText: 'Upload',
                                      widthValue: 100,
                                      heightValue: 60,
                                      borderRadius: 5,
                                    )
                                  : Visibility(
                                      visible:
                                          isUploadContent, // Assuming `uploadingContent` is a boolean indicating if content is being uploaded
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.greenAccent,
                                        ),
                                        height: 60,
                                        width: 100,
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                          // Circular loading indicator
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          onTap: () {
                            imagePicked.isEmpty && videoPicked.path.isEmpty
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        const ReusableDialog(
                                      title: "-_-",
                                      content: "Content Belum ada !",
                                    ),
                                  )
                                : ref.read(isUploadProvider.notifier).state =
                                    true;
                            uploadContent(
                              imagePicked,
                              videoPicked,
                              titleField,
                              descriptionField,
                              priceOTField,
                              participantField,
                            );
                            Future.delayed(const Duration(seconds: 1), () {
                              ref.read(isUploadProvider.notifier).state = false;
                            });
                          },
                        ),
                      ]
                    : [],
              ),
              //const WidgetPaddingOnly(topPadding: 10),
              Container(
                padding: const EdgeInsets.only(bottom: 60),
                child: showPickerAsOpenTrip == false &&
                        showPickerAsContent == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: const MyCustomFrame(
                              heightValue: 60,
                              widthValue: 100,
                              borderRadius: 5,
                              strText: 'Post\nContent',
                            ),
                            onTap: () {
                              ref.read(tapContentProvider.notifier).state =
                                  true;
                              ref.read(uploadAsOT.notifier).state = false;
                            },
                          ),
                          const WidgetPaddingOnly(rightPadding: 5),
                          GestureDetector(
                            child: const MyCustomFrame(
                              heightValue: 60,
                              widthValue: 100,
                              borderRadius: 5,
                              strText: 'Post\nOpen Trip',
                            ),
                            onTap: () {
                              ref.read(tapOpenTripProvider.notifier).state =
                                  true;
                              ref.read(uploadAsOT.notifier).state = true;
                            },
                          ),
                        ],
                      )
                    : null,
              ),
              const WidgetPaddingOnly(
                topPadding: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
