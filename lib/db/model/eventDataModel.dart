import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'eventDataModel.g.dart';

@HiveType(typeId: 2)
class EventModel extends HiveObject {
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

  @HiveField(7)
  final String imagePath;

  EventModel(
      {required this.date,
      required this.id,
      required this.description,
      required this.time,
      required this.location,
      required this.priority,
      required this.isAlarm,
      required this.imagePath});
}
