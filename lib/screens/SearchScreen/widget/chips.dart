import 'package:flutter/material.dart';
import 'package:do_state/screens/SearchScreen/SearchHome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/search_screen/chip/chip_bloc.dart';
import '../../../function/themeColor.dart';

// int x = 10;

class chips extends StatelessWidget {
  String title;
  String actionKey;
  Function function;
  var range;

  chips(
      {super.key,
      required this.title,
      required this.actionKey,
      required this.function,
      this.range});

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 3, right: 3),
      child: Container(
        height: 30,
        child: BlocBuilder<ChipBloc, ChipState>(
          builder: (context, state) {
            return FilterChip(
                label: Text(
                  title,
                  style: TextStyle(color: rBlack, fontFamily: 'comic'),
                ),
                selected: state.isSelected,
                backgroundColor: Colors.grey,
                selectedColor: Color.fromARGB(255, 255, 255, 255),
                onSelected: (newState) {
                  // widget.function('tsk', widget.actionKey);
                  if (!isSelected)
                    function(globSearchKey, globAction = actionKey, actionKey);
                  else
                    function(
                      globSearchKey,
                    );
                  // setState(() {
                    // context.read<ChipBloc>().add(OnTap());
                  state.isSelected = newState;
                  isSelected = state.isSelected;
                  

                  // });
                });
          },
        ),
      ),
    );
  }
}
