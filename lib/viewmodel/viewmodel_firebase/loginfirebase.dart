import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../view_ui/page/mainscreen.dart';

void doSomething(BuildContext context, String username, String password) async {
  log('hasilnya : ' + username);
  log('hasilnya : ' + password);
  try {
    log('proses login');
    final UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: username, //'skuyadmin@gmail.com',
            password: password //'skuyskuy',
            );
    if (credential.toString() != '') {
      log(credential.toString());
      log('masuk');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const MainScreen(),
          ),
          ModalRoute.withName('/'));
    }
  } catch (e) {
    log(e.toString());
  }

  // Timer(const Duration(seconds: 3), () {
  //   _btnController.success();
  // });
}
