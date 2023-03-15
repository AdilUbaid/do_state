part of 'search_bar_bloc.dart';

class SearchBarState {
  String key;
  SearchBarState({required this.key});
}

class SearchBarInitial extends SearchBarState {
  SearchBarInitial():super(key: '');
}
