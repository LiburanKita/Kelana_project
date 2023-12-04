import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skuyskuy/view_ui/page/loginpage.dart';
import 'package:skuyskuy/view_ui/page/mainscreen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: GlobalContextService.navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.green,
          // textTheme: const TextTheme(
          //   // ignore: deprecated_member_use
          //   bodyText1: TextStyle(),
          //   // ignore: deprecated_member_use
          //   bodyText2: TextStyle(),
          // ).apply(
          //   bodyColor: Colors.deepPurple[900],
          //   displayColor: Colors.deepPurple[900],
          // ),
        ),
        home: const MyApp(),
      ),
    ),
  );
}

class GlobalContextService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: FirebaseAuth.instance.currentUser != null
            ? const MainScreen()
            : (googleSignIn.currentUser != null
                ? const MainScreen()
                : const LoginPage()),
      ),
    );
  }
}
