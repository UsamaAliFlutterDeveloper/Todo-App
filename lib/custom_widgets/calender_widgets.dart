import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalendarFormat _calenderFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010),
                lastDay: DateTime.utc(2030),
                focusedDay: DateTime.now(),
                calendarFormat: _calenderFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                rowHeight: 60,
                daysOfWeekHeight: 60,
                headerStyle: HeaderStyle(
                  titleTextStyle: const TextStyle(
                      color: Color(
                        0xff334ca1,
                      ),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  formatButtonTextStyle: const TextStyle(
                      color: Color(
                        0xff334ca1,
                      ),
                      fontWeight: FontWeight.bold),
                  formatButtonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: const Color(0xff334ca1), width: 2)),
                  leftChevronIcon: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Color(0xff334ca1),
                  ),
                  rightChevronIcon: const Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: Color(0xff334ca1),
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Colors.red),
                ),
                calendarStyle: const CalendarStyle(
                    weekendTextStyle: TextStyle(color: Colors.red),
                    todayDecoration: BoxDecoration(
                      color: Color(0xff334ca1),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Color(0xff334ca1),
                      shape: BoxShape.circle,
                    )),
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, _focusedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onFormatChanged: (format) {
                  if (_calenderFormat != format) {
                    setState(() {
                      _calenderFormat = format;
                    });
                  }
                },
                onPageChanged: ((focusedDay) {
                  _focusedDay = focusedDay;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
