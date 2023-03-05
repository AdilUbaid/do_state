part of 'calendar_bloc.dart';

class CalendarState {
  DateTime selectedDay;
  DateTime focusedDay;
  CalendarState({required this.selectedDay, required this.focusedDay});
}

class CalendarInitial extends CalendarState {
  CalendarInitial():super(focusedDay: DateTime.now(),selectedDay: DateTime.now());}
