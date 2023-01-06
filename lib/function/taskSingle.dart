class TaskSingle {
  late String id;
  late String description;
  late String date;
  late String time;
  late String location;
  late bool priority;
  late bool isAlarm;

  static  TaskSingle inst = TaskSingle._internal();

  TaskSingle._internal();

  factory TaskSingle(
    String id,
    String description,
    String date,
    String time,
    String location,
    bool priority,
    bool isAlarm,
  ) {
    inst.id = id;
    inst.description = description;
    inst.date = date;
    inst.time = time;
    inst.location = location;
    inst.priority = priority;
    inst.isAlarm = isAlarm;

    return inst;
  }
}
