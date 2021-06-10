import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String title;
  final String startHour;
  final String endHour;
  final int colorType;

  const Event(this.title, this.startHour, this.endHour, this.colorType);

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(3, (index) => index),
    key: (item) => DateTime.utc(2020, 15, item * 2),
    value: (item) => List.generate(
        item % 3 + 1, (index) => Event('with Alex', "9:30AM", "10:30AM", 2)))
  ..addAll({
    DateTime.now(): [
      Event('Firs session with Alex', "9:30AM", "10:30AM", 2),
      Event('Webinar: How to cope', "9:30AM", "10:30AM", 1),
    ],
    DateTime.parse("2021-06-30 00:00:00.000Z"): [
      Event('Hangout', "9:30AM", "10:30AM", 1),
      Event('Meeting at Polo Towerer', "9:30AM", "10:30AM", 2),
    ],
    ////
    DateTime.parse("2021-06-05 00:00:00.000Z"): [
      Event('Meeting  with Micheal', "9:30AM", "10:30AM", 1),
    ],
    DateTime.parse("2021-06-18 00:00:00.000Z"): [
      Event('Meeting with Micheal', "9:30AM", "10:30AM", 1),
      Event('Interview with IT', "9:30AM", "10:30AM", 2),
    ],
    DateTime.parse("2021-06-20 00:00:00.000Z"): [
      Event('Have a nice Day', "9:30AM", "10:30AM", 1),
      Event('Interview with SomeGuys', "9:30AM", "10:30AM", 2),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }

final kNow = DateTime.now();
final kFirstDay = DateTime(kNow.year, kNow.month - 3, kNow.day);
final kLastDay = DateTime(kNow.year, kNow.month + 3, kNow.day);
