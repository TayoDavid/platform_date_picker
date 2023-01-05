import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final DateTime today = DateTime.now();
final DateTime seventyYearAgo = today.subtract(const Duration(days: 365 * 70));
final DateTime seventyYearAhead = today.add(const Duration(days: 365 * 70));

Future<DateTime?> showPlatformDatePicker(BuildContext context) async {
  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      final result = await showCupertinoDatePicker(context);
      return result;
    default:
      return showMaterialDatePicker(context);
  }
}

Future<DateTime?> showMaterialDatePicker(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialEntryMode: DatePickerEntryMode.input,
    firstDate: seventyYearAgo,
    initialDate: DateTime.now(),
    lastDate: seventyYearAhead,
  );
}

Future<DateTime?> showCupertinoDatePicker(BuildContext context) async {
  DateTime? pickedDate;
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        height: MediaQuery.of(context).copyWith().size.height / 3,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (picked) => pickedDate = picked,
          initialDateTime: DateTime.now(),
        ),
      );
    },
  );

  return pickedDate;
}
