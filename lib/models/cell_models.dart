import 'package:calendar/color_convert.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';

List<CalendarEvent> sampleEvents() {
  final today = DateTime.now();
  final String event = "event";
  final String appointment = "appointment";
  final Color eventColor = HexColor.fromHex("#5684AE");
  final Color appoitColor = HexColor.fromHex("#FFE4C8");

  final sampleEvents = [
    CalendarEvent(
        eventID: appointment,
        eventName: "Webbinar How to Cope",
        eventDate: today.add(Duration(days: -42)),
        eventBackgroundColor: appoitColor),
    CalendarEvent(
        eventID: event,
        eventName: "Writing test",
        eventDate: today.add(Duration(days: 10)),
        eventBackgroundColor: eventColor),
    CalendarEvent(
        eventID: appointment,
        eventName: "Meeting with Alex ",
        eventDate: today.add(Duration(days: -2)),
        eventBackgroundColor: appoitColor),
    CalendarEvent(
        eventID: event,
        eventName: "First session with StandLord",
        eventDate: today.add(Duration(days: -3)),
        eventBackgroundColor: eventColor),
    CalendarEvent(
        eventID: event,
        eventName: "Se session with StandLord",
        eventDate: today.add(Duration(days: -3)),
        eventBackgroundColor: eventColor),
    CalendarEvent(
        eventID: event,
        eventName: "Task Deadline",
        eventDate: today,
        eventBackgroundColor: eventColor),
  ];

  return sampleEvents;
}
