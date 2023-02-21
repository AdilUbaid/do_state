import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:do_state/screens/HomeScreen/widget/addTaskEvent.dart';

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import '../../../function/themeColor.dart';
import '../../../main.dart';

TextEditingController timeController = TextEditingController();

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  DateTime newDatetime = DateTime.now();

  DateTime date = DateTime(2022, 12, 24, 05, 30);
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  @override
  Widget build(BuildContext context) {
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
          datePickerFn();
          
        },
        // cursorColor: cGreen,
      ),
    );
  }

  datePickerFn() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );
    if (newDate == null) {
      return;
    }
    setState(() {
      date = newDate;
    });
    timePickerFn();
  }

  timePickerFn() async {
    TimeOfDay? newTIme = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTIme == null) {
      return;
    }
    newDatetime =
        DateTime(date.year, date.month, date.day, newTIme.hour, newTIme.minute);
    setState(() {
      time = newTIme;
      // print(DateFormat('yyy-MM-dd').format(date));
      String ktime = newTIme.hour.toString() + '-' + newTIme.minute.toString();
      // print(ktime);
      timeController.text =
          DateFormat('dd MMM yyy hh:mm a').format(newDatetime);
      // print(newDatetime);
      tempTime = newTIme;
      tempDate = newDatetime;
      // dateTime= newDatetime;
      // newTIme = time.format(context);
    });
  }
}
