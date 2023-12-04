import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skuyskuy/main.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
loginStateCheck(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    const Center(
      child: CircularProgressIndicator(),
    );
    const Duration(milliseconds: 3000);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const MyApp(),
      ),
    );
  } catch (e) {
    log(e.toString());
  }
}
