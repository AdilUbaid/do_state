import 'package:flutter_riverpod/flutter_riverpod.dart';


final provSelectedDay = StateProvider<DateTime>((ref) => DateTime.now());
final provFocusDay = StateProvider<DateTime>((ref) => DateTime.now());

// class MyAppState {
//     // final int counter;
//     DateTime selectedDay = DateTime.now();
//     DateTime focusedDay = DateTime.now();
//     final String text;

//     MyAppState({required this.counter, required this.text});
// }
// final myAppStateProvider = Provider((ref) => MyAppState(counter: 0, text: 'Hello World'));