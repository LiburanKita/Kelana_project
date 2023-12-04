import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/loginpagemodel.dart';
import '../../viewmodel/viewmodel_firebase/loginfirebase.dart';

final RoundedLoadingButtonController _btnController =
    RoundedLoadingButtonController();

const mainColour = Color.fromARGB(255, 181, 240, 240);

class WidgetRoundedLoadingBtn extends ConsumerWidget {
  const WidgetRoundedLoadingBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getUsr = ref.watch(userloginProvider);
    final getPwd = ref.watch(passloginProvider);
    return Center(
      child: RoundedLoadingButton(
        successColor: Colors.purple[600],
        width: 100,
        borderRadius: 20,
        color: Colors.white70,
        child: const Text('LogIn',
            style: TextStyle(color: Color.fromARGB(255, 43, 184, 137))),
        controller: _btnController,
        onPressed: () => doSomething(context, getUsr, getPwd),
        resetAfterDuration: true,
        resetDuration: const Duration(seconds: 3),
      ),
    );
  }
}
