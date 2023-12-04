import 'dart:developer';

import 'package:date_ranger/date_ranger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skuyskuy/view_ui/widget/padding.dart';
import 'package:skuyskuy/view_ui/widget/textformfield.dart';
import 'package:skuyskuy/viewmodel/viewmodel_riverpod/mainmodel.dart';

class FormOpenTrip extends ConsumerStatefulWidget {
  const FormOpenTrip({super.key});

  @override
  ConsumerState<FormOpenTrip> createState() => _FormOpenTripState();
}

class _FormOpenTripState extends ConsumerState<FormOpenTrip> {
  var initialDate = DateTime.now();
  var initialDateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView(
          children: [
            const WidgetPaddingOnly(topPadding: 10),
            WidgetTextFormField(
              globalType: 'title',
              globalUkuran: displayWidth(context),
              globalLabelText: 'Judul :',
              globalFillColor: Colors.white12,
              globalBorderRadius: 15,
              globalValidator: false,
              globalStringVal: 'Silahkan isi judul',
              globalSuffixIcon: false,
              globalIsObscure: false,
            ),
            const WidgetPaddingOnly(topPadding: 10),
            WidgetTextFormField(
              globalType: 'descriptions',
              globalUkuran: displayWidth(context),
              globalLabelText: 'Deskripsi :',
              globalFillColor: Colors.white12,
              globalBorderRadius: 15,
              globalValidator: false,
              globalStringVal: 'Silahkan isi Deskripsi',
              globalSuffixIcon: false,
              globalIsObscure: false,
              globalLines: 5,
            ),
            const WidgetPaddingOnly(
              topPadding: 10,
            ),
            WidgetTextFormField(
              globalType: 'priceOT',
              globalUkuran: displayWidth(context),
              globalLabelText: 'Harga :',
              globalFillColor: Colors.white12,
              globalBorderRadius: 15,
              globalValidator: false,
              globalStringVal: 'Silahkan isi harga',
              globalSuffixIcon: false,
              globalIsObscure: false,
            ),
            const WidgetPaddingOnly(topPadding: 10),
            WidgetTextFormField(
              globalType: 'participants',
              globalUkuran: displayWidth(context),
              globalLabelText: 'Jumlah Peserta :',
              globalFillColor: Colors.white12,
              globalBorderRadius: 15,
              globalValidator: false,
              globalStringVal: 'Silahkan isi jumlah peserta',
              globalSuffixIcon: false,
              globalIsObscure: false,
            ),
            const WidgetPaddingOnly(topPadding: 10),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Durasi Perjalanan:'),
            ),
            const WidgetPaddingOnly(topPadding: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: DateRanger(
                horizontalPadding: 20,
                backgroundColor: Colors.green[100],
                activeItemBackground: Colors.greenAccent,
                initialRange: initialDateRange,
                onRangeChanged: (range) {
                  setState(() {
                    initialDateRange = range;
                    log(range.toString());
                  });
                },
              ),
            ),
          ],
        ),
      );
}
