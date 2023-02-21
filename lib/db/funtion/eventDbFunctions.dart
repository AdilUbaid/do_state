import 'package:do_state/db/model/eventDataModel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// import '../model/eventDataModel.dart';
// import 'package:do_state/db/model/eventDataModel.dart';

ValueNotifier<List<EventModel>> eventListNotifier = ValueNotifier([]);

Future<void> addEvent(EventModel value) async {
  final eventDB = await Hive.openBox<EventModel>('event_db');
  eventDB.add(value);
  eventListNotifier.value.add(value);
  eventListNotifier.notifyListeners();
}

Future<void> getAllEvent() async {
  final eventDB = await Hive.openBox<EventModel>('event_db');
  eventListNotifier.value.clear();
  eventListNotifier.value.addAll(eventDB.values);
  eventListNotifier.notifyListeners();
}

deleteEvent(index, context) async {
  final eventDB = await Hive.openBox<EventModel>('event_db');
  final Map<dynamic, EventModel> taskMap = eventDB.toMap();
  dynamic desiredKey;
  taskMap.forEach((key, value) {
    if (value.id == index) {
      desiredKey = key;
    }
  });
  eventDB.delete(desiredKey);
  getAllEvent();
  Navigator.of(context).pop();
}

editEvent(index, context, EventModel value) async {
  final eventDB = await Hive.openBox<EventModel>('event_db');
  final Map<dynamic, EventModel> eventMap = eventDB.toMap();
  dynamic desiredKey;
  eventMap.forEach((key, value) {
    if (value.id == index) {
      desiredKey = key;
    }
  });
  eventDB.put(desiredKey, value);
  getAllEvent();
}
