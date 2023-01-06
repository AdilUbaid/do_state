import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:do_state/db/model/dataModel.dart';

ValueNotifier<List<TaskModel>> taskListNotifier = ValueNotifier([]);

Future<void> addTask(TaskModel value) async {
  final taskDB = await Hive.openBox<TaskModel>('task_db');
  taskDB.add(value);
  taskListNotifier.value.add(value);
  taskListNotifier.notifyListeners();
}

Future<void> getAllTask() async {
  final taskDB = await Hive.openBox<TaskModel>('task_db');
  taskListNotifier.value.clear();
  taskListNotifier.value.addAll(taskDB.values);
  taskListNotifier.notifyListeners();
}

deleteTask(index, context) async {
  final taskDB = await Hive.openBox<TaskModel>('task_db');
  final Map<dynamic, TaskModel> taskMap = taskDB.toMap();
  dynamic desiredKey;
  taskMap.forEach((key, value) {
    if (value.id == index) {
      desiredKey = key;
    }
  });
  taskDB.delete(desiredKey);
  getAllTask();
  Navigator.of(context).pop();
}

editTask(index, context, TaskModel value) async {
  final taskDB = await Hive.openBox<TaskModel>('task_db');
  final Map<dynamic, TaskModel> taskMap = taskDB.toMap();
  dynamic desiredKey;
  taskMap.forEach((key, value) {
    if (value.id == index) {
      desiredKey = key;
    }
  });
  taskDB.put(desiredKey, value);
  getAllTask();
}
