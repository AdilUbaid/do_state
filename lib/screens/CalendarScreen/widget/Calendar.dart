import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../function/themeColor.dart';
import '../provider/provider_calendar_scrn.dart';
import 'calenderTask.dart';

DateTime focusedDay = DateTime.now();

class Calendar extends StatelessWidget {
  Calendar({super.key});

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
            child: Consumer(
              builder: (context, ref, _) {
                final value = ref.watch(provSelectedDay);
                final values2 = ref.watch(provFocusDay);

                return TableCalendar(
                  focusedDay: value,
                  firstDay: DateTime(1990),
                  lastDay: DateTime(2050),
                  calendarFormat: CalendarFormat.month,
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    ref.read(provSelectedDay.notifier).state = selectDay;
                    ref.read(provFocusDay.notifier).state = focusDay;
                    // setState(() {
                    // selecteday = selectDay;
                    // focusedDay = values2;

                    pickedDateNotifier.value = focusDay;
                    // ref.provCalTask;
                    ref.read(provCalTask.notifier).state.value = focusDay;
                    // });
                    // taskOfDay();
                  },
                  calendarStyle:
                      (const CalendarStyle(isTodayHighlighted: true)),
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(values2, date);
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer(
            builder: (context, ref, _) {
              final values2 = ref.watch(provFocusDay);

              return Text(
                DateFormat('dd MMMM yyy').format(values2),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'comic',
                    fontSize: 23,
                    color: rWhite),
              );
            },
          ),
        )
      ],
    );
  }
}
