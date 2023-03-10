part of 'add_image_bloc.dart';

@immutable
abstract class AddImageEvent {}
class SelectPic extends AddImageEvent {
  final File image;

  SelectPic({required this.image});
}
