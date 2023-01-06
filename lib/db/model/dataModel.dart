import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'dataModel.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String description;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  final String time;

  @HiveField(4)
  final String location;

  @HiveField(5)
  final bool priority;

  @HiveField(6)
  final bool isAlarm;

  TaskModel({
    required this.id,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.priority,
    required this.isAlarm,
  });
}
