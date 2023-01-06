import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../function/themeColor.dart';
import 'calenderTask.dart';

DateTime focusedDay = DateTime.now();

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            height: 380,
            child: TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: CalendarFormat.month,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                 
                  pickedDateNotifier.value = focusDay;
                  // print('look for focus day $focusDay');
                  // print("look for notifier${pickedDateNotifier}");
                  // taskOfDay(globTaskList);
                });
                // taskOfDay();
              },
              calendarStyle: (CalendarStyle(isTodayHighlighted: true)),
              selectedDayPredicate: (DateTime date) {
                // print("this is focus day $focusedDay");
                
                return isSameDay(selectedDay, date);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateFormat('dd MMMM yyy').format(focusedDay),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'comic',
                fontSize: 23,
                color: rWhite),
          ),
        )
      ],
    );
  }
}
