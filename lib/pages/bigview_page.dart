import 'package:calendar/color_convert.dart';
import 'package:calendar/models/cell_models.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';

class BigViewPage extends StatelessWidget {
  BigViewPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final _sampleEvents = sampleEvents();
    final cellCalendarPageController = CellCalendarPageController();
    return Scaffold(
      backgroundColor: HexColor.fromHex("#E4F6ED"),
      body: CellCalendar(
        cellCalendarPageController: cellCalendarPageController,
        events: _sampleEvents,
        todayMarkColor: HexColor.fromHex("#0F4C81"),
        todayTextColor: Colors.white,
        daysOfTheWeekBuilder: (dayIndex) {
          final labels = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              labels[dayIndex],
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        monthYearLabelBuilder: (datetime) {
          final year = datetime.year.toString();
          final month = datetime.month.monthName;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  "$month  $year",
                  style: TextStyle(
                    fontSize: 24,
                    color: HexColor.fromHex("#0F4C81"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
        onCellTapped: (date) {
          final eventsOnTheDate = _sampleEvents.where((event) {
            final eventDate = event.eventDate;
            return eventDate.year == date.year &&
                eventDate.month == date.month &&
                eventDate.day == date.day;
          }).toList();
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title:
                        Text(date.month.monthName + " " + date.day.toString()),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: eventsOnTheDate
                          .map(
                            (event) => Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(4),
                              margin: EdgeInsets.only(bottom: 12),
                              color: event.eventBackgroundColor,
                              child: Text(
                                event.eventName,
                                style: TextStyle(color: event.eventTextColor),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ));
        },
      ),
    );
  }
}
