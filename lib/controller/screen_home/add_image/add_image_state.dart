part of 'add_image_bloc.dart';

class AddImageState {
  File? image;
  AddImageState({required this.image});
}

class AddImageInitial extends AddImageState {
  AddImageInitial() : super(image: null);
}
