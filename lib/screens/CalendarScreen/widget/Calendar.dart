import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../controller/calendar/calendar_bloc.dart';
import '../../../function/themeColor.dart';
import 'calenderTask.dart';

DateTime focusedDay = DateTime.now();

class Calendar extends StatelessWidget {
  Calendar({super.key});

  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
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
                      // setState(() {
                      context.read<CalendarBloc>().add(OnTapEvent());
                      selectedDay = selectDay;
                      focusedDay = focusDay;
                      state.selectedDay = selectedDay;
                      log(state.selectedDay.toString());

                      pickedDateNotifier.value = focusDay;

                      // print('look for focus day $focusDay');
                      // print("look for notifier");
                      // taskOfDay(globTaskList);
                      // });
                      // taskOfDay();
                    },
                    calendarStyle: (CalendarStyle(isTodayHighlighted: true)),
                    selectedDayPredicate: (DateTime date) {
                      // print("this is focus day ");

                      return isSameDay(selectedDay, date);
                    },
                  )),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DateFormat('dd MMMM yyy').format(state.selectedDay),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'comic',
                      fontSize: 23,
                      color: rWhite),
                ))
          ],
        );
      },
    );
  }
}
