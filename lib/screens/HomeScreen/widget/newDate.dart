import 'package:do_state/screens/HomeScreen/Provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:do_state/screens/HomeScreen/widget/addTaskEvent.dart';

import '../../../function/themeColor.dart';

TextEditingController timeController = TextEditingController();

class DateAndTime extends ConsumerWidget {
  DateAndTime({super.key});

  DateTime newDatetime = DateTime.now();

  DateTime date = DateTime(2022, 12, 24, 05, 30);

  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 7, left: 10, right: 10),
      child: TextField(
        readOnly: true,
        controller: timeController,
        cursorColor: cGreen,
        cursorHeight: 25,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: rWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: rWhite),
          ),
          labelText: 'Date and time',
          labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'comic',
              fontSize: 16,
              color: rWhite),
        ),
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'comic',
            fontSize: 17,
            color: rWhite),
        onTap: () {
          datePickerFn(ref, context);
          // setState(() {2
          // timeController.text =1
          //     DateFormat('dd MMM yyy hh:mm a').format(newDatetime);1
          // });2
        },
        // cursorColor: cGreen,
      ),
    );
  }

  datePickerFn(WidgetRef ref, BuildContext context) async {
    final dateValue = ref.watch(provTime);
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (newDate == null) {
      return;
    }

    // setState(() {
    ref.read(provTime.notifier).state = newDate;

    date = newDate;
    // });
    timePickerFn(context);
  }

  timePickerFn(BuildContext context) async {
    TimeOfDay? newTIme = await showTimePicker(
      // context: context,
      initialTime: TimeOfDay.now(), context: context,
    );
    if (newTIme == null) {
      return;
    }
    newDatetime =
        DateTime(date.year, date.month, date.day, newTIme.hour, newTIme.minute);
    timeController.text = DateFormat('dd MMM yyy hh:mm a').format(newDatetime);
    // setState(() {

    //   // print(DateFormat('yyy-MM-dd').format(date));1
    //   // String ktime = newTIme.hour.toString() + '-' + newTIme.minute.toString();
    //   // print(ktime);1

    //   // print(newDatetime);1
    //   // tempTime = newTIme;
    //   // tempDate = newDatetime;
    //   // dateTime= newDatetime;1
    //   // newTIme = time.format(context);1
    // });
    time = newTIme;

    tempTime = newTIme;
    tempDate = newDatetime;
  }
}
