import 'package:flutter_riverpod/flutter_riverpod.dart';

final provTime =
    StateProvider<DateTime>((ref) => DateTime(2022, 12, 24, 05, 30));