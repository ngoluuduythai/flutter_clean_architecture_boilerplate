import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  int minusFifteenSeconds() {
    return millisecondsSinceEpoch - 15000;
  }

  String formatWithTimeZone() {
    final offset = timeZoneOffset.inHours;
    final offsetString = offset > 0 ? "+$offset" : "$offset";
    return DateFormat('MM/d/yyy, hh:mm:ss a, UTC$offsetString').format(this);
  }

  String formatWithTime() {
    return DateFormat('MM/d/yyy').format(this);
  }

  String formatWithSecond() {
    return DateFormat('MM/d/yyy, hh:mm:ss').format(this);
  }


  String hourFormat() {
    return DateFormat('h:mma').format(DateTime.now());
  }

  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  String formatWithDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

}
