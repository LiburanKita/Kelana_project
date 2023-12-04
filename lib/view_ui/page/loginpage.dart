import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:skuyskuy/view_ui/page/mainscreen.dart';
import 'package:skuyskuy/view_ui/widget/defaultanimatedtext.dart';
import 'package:skuyskuy/view_ui/widget/padding.dart';
import 'package:skuyskuy/view_ui/widget/roundedanimatedbutton.dart';
import 'package:skuyskuy/view_ui/widget/textformfield.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/mainmodel.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleGoogleSignIn() async {
      try {
        final GoogleSignInAccount? userCred = await _googleSignIn.signIn();
        if (userCred.toString() != '') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => MainScreen(
                  userName: userCred?.displayName,
                ),
              ),
              ModalRoute.withName('/'));
        }
      } catch (error) {
        log(error.toString());
      }
    }

    return Center(
      child: ListView(
        children: [
          SizedBox(
            height: displayHeight(context) * (50 / 100),
          ),
          const WidgetAnimatedText(textValue: 'Kelana'),
          const WidgetPaddingOnly(topPadding: 10),
          WidgetTextFormField(
            globalType: 'user',
            globalUkuran: displayWidth(context),
            globalLabelText: 'Username/E-mail',
            globalFillColor: Colors.white12,
            globalBorderRadius: 25,
            globalValidator: false,
            globalStringVal: 'Username Cannot be empty',
            globalSuffixIcon: false,
            globalIsObscure: false,
            globalInitialVal: 'skuyadmin@gmail.com ',
          ),
          const WidgetPaddingOnly(topPadding: 10),
          WidgetTextFormField(
            globalType: 'pass',
            globalUkuran: displayWidth(context),
            globalLabelText: 'Password',
            globalFillColor: Colors.white12,
            globalBorderRadius: 25,
            globalValidator: false,
            globalStringVal: 'Password Cannot be empty',
            globalSuffixIcon: true,
            globalIsObscure: true,
            globalInitialVal: 'skuyskuy ',
          ),
          const WidgetPaddingOnly(topPadding: 10),
          const WidgetRoundedLoadingBtn(),
          const WidgetPaddingOnly(topPadding: 20),
          Center(
            child: SignInButton(
              Buttons.googleDark,
              text: "Sign up with Google",
              onPressed: () {
                handleGoogleSignIn();
              },
            ),
          ),
        ],
      ),
    );
  }
}
