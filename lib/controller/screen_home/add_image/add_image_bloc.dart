import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_image_event.dart';
part 'add_image_state.dart';

class AddImageBloc extends Bloc<AddImageEvent, AddImageState> {
  AddImageBloc() : super(AddImageInitial()) {
    on<SelectPic>((event, emit) {
return emit(AddImageState(image: event.image));    });
  }
}

