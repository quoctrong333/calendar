import 'package:calendar/color_convert.dart';
import 'package:calendar/pages/smallview_item.dart';
import 'package:calendar/models/table_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SmallViewPage extends StatefulWidget {
  @override
  _SmallViewPageState createState() => _SmallViewPageState();
}

class _SmallViewPageState extends State<SmallViewPage> {
  ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay;
  DateTime _rangeStart;
  DateTime _rangeEnd;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }


  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#E4F6ED"),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: false,
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  titleTextStyle: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: HexColor.fromHex("#0F4C81")),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: HexColor.fromHex("#0F4C81")),
                  outsideDaysVisible: false,
                ),
                onDaySelected: _onDaySelected,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      switch (value[index].colorType) {
                        case 1:
                          return SmallViewItem(
                            value[index],
                            HexColor.fromHex("#E4F6FD"),
                            HexColor.fromHex("#0F4C81"),
                          );
                          break;
                        case 2:
                          return SmallViewItem(
                            value[index],
                            HexColor.fromHex("#FFE4C8"),
                            HexColor.fromHex("#0F4C81"),
                          );
                          break;
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
