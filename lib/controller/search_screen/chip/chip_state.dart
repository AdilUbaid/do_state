part of 'chip_bloc.dart';

class ChipState {
  bool isSelected;
  ChipState({required this.isSelected});
}

class ChipInitial extends ChipState {
  ChipInitial():super(isSelected: false);
}
