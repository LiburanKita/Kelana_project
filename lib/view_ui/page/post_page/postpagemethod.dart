import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

//import 'package:tcard/tcard.dart';
Widget showImage(List<File> image, BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 200,
        width: 408,
        child: image.length == 1
            ? Center(
                child: Image.file(
                  File(image.first.path),
                  width: 200,
                  height: 200,
                ),
              )
            : ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (File img in image)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                      child: GestureDetector(
                        child: Image.file(
                          img,
                          width: 200,
                          height: 200,
                        ),
                        onTap: () {
                          log(img.path);
                        },
                      ),
                    ),
                ],
              ),
      ),
      //TCard(cards: cards),
    ],
  );
}

// List<Widget> cards = List.generate(
//   5,
//   (index) => Container(
//     color: Colors.blue,
//     child: Center(
//       child: Text(
//         '$index',
//         style: const TextStyle(fontSize: 60, color: Colors.white),
//       ),
//     ),
//   ),
// );

// List<Widget> generateCards(List<File> image) {
//   return image.map((file) => Image.file(file)).toList();
// }

uploadContent(
  List<File> listUploadImage,
  File listUploadVideo,
  String titleField,
  String descriptionField,
  String priceOtField,
  String participantField,
) async {
  List urlOnFirestore = [];
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  String? fileName;
  Reference? storageRef;

  for (File file in listUploadImage) {
    fileName = basename(file.path);
    storageRef = storage
        .ref()
        .child('openTrip/openTripContentStorage/' +
            DateFormat('yyyy-MM-dd').format(DateTime.now()).toString() +
            '/' +
            user!.uid)
        .child(fileName);
    await storageRef.putFile(file);
    urlOnFirestore.add(await storageRef.getDownloadURL());
    log('File uploaded successfully.');
  }

  CollectionReference openTrip = firestore.collection('openTripContent');

  try {
    await openTrip.add({
      'title': titleField,
      'description': descriptionField,
      'location': '-',
      'duration': '-',
      'price': priceOtField,
      'participants': participantField,
      'schedule': 'Jadwal Opentrip',
      'image': urlOnFirestore,
      'uploadBy': user!.uid,
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
    });
    log('Konten Opentrip berhasil diunggah ke Cloud Firestore.');
  } catch (e) {
    log('Terjadi kesalahan saat mengunggah konten Opentrip: $e');
  }
}
