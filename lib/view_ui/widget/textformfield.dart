import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/loginpagemodel.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/mainmodel.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/postpagemodel.dart';

class WidgetTextFormField extends ConsumerStatefulWidget {
  final String globalType;
  final double globalUkuran;
  final String globalLabelText;
  final Color globalFillColor;
  final double globalBorderRadius;
  final bool globalValidator;
  final String globalStringVal;
  final bool globalSuffixIcon;
  final bool globalIsObscure;
  final String globalInitialVal;
  final int globalLines;

  const WidgetTextFormField({
    Key? key,
    this.globalType = '',
    this.globalUkuran = 0.0,
    this.globalLabelText = '',
    this.globalFillColor = Colors.deepPurple,
    this.globalBorderRadius = 0.0,
    this.globalValidator = false,
    this.globalStringVal = '',
    this.globalSuffixIcon = false,
    this.globalIsObscure = false,
    this.globalInitialVal = '',
    this.globalLines = 1,
  }) : super(key: key);

  @override
  ConsumerState<WidgetTextFormField> createState() =>
      _WidgetTextFormFieldState();
}

class _WidgetTextFormFieldState extends ConsumerState<WidgetTextFormField> {
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.globalIsObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: displayWidth(context) - 20.0 > 480
            ? 460
            : displayWidth(context) - 20.0,
        child: TextFormField(
          maxLines: widget.globalLines,
          initialValue: widget.globalInitialVal,
          onChanged: (text) {
            if (widget.globalType == 'user') {
              ref.read(userloginProvider.notifier).state = text;
            } else if (widget.globalType == 'pass') {
              ref.read(passloginProvider.notifier).state = text;
            } else if (widget.globalType == 'title') {
              ref.read(titleFieldValueProvider.notifier).state = text;
            } else if (widget.globalType == 'descriptions') {
              ref.read(descriptionsFieldValueProvider.notifier).state = text;
            } else if (widget.globalType == 'priceOT') {
              ref.read(priceOTFieldValueProvider.notifier).state = text;
            } else if (widget.globalType == 'participants') {
              ref.read(participantsFieldValueProvider.notifier).state = text;
            }
          },
          obscureText: widget.globalType == 'user' ? false : _passwordVisible,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: widget.globalLabelText,
            fillColor: widget.globalFillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.globalBorderRadius),
              borderSide: const BorderSide(),
            ),
            suffixIcon: widget.globalSuffixIcon == false
                ? null
                : IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(
                        () {
                          _passwordVisible = !_passwordVisible;
                        },
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
