import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chip_event.dart';
part 'chip_state.dart';

class ChipBloc extends Bloc<ChipEvent, ChipState> {
  ChipBloc() : super(ChipInitial()) {
    on<OnTap>((event, emit) {
      return emit(ChipState(isSelected: (state.isSelected)));
    });
  }
}
