import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<OnTapEvent>((event, emit) {
      return emit(CalendarState(selectedDay: state.selectedDay, focusedDay: state.focusedDay));
    });
  }
}
