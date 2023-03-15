part of 'search_bar_bloc.dart';

@immutable
abstract class SearchBarEvent {}

class SearchKey extends SearchBarEvent {
  final String key;

  SearchKey({required this.key});
}
