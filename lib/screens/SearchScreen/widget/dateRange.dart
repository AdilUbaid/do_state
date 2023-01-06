import 'package:flutter/material.dart';

import '../SearchHome.dart';

DateTimeRange dateRange =
    DateTimeRange(start: DateTime.now(), end: DateTime(2022, 12, 25));

Future picRange(BuildContext context, Function function) async {
  DateTimeRange? newDateRange = await showDateRangePicker(
    context: context,
    initialDateRange: dateRange,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (newDateRange == null) return;
  print(
      "${newDateRange.start.year} / ${newDateRange.start.month} / ${newDateRange.start.day}");
  print(
      "${newDateRange.end.year} / ${newDateRange.end.month} / ${newDateRange.end.day}");
  dateRange = newDateRange;
  function(globSearchKey, globAction = 'R','R');
}
