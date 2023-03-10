import 'dart:developer';

import 'package:do_state/controller/search_screen/search_bar/search_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:do_state/screens/SearchScreen/SearchHome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../function/themeColor.dart';

class SearchBar extends StatefulWidget {
  Function function;

  SearchBar({super.key, required this.function});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _SearchHomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: BlocBuilder<SearchBarBloc, SearchBarState>(
        builder: (context, state) {
          return TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            autofocus: true,
            controller: _SearchHomeController,
            cursorColor: cGreen,
            style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'comic',
                fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: rWhite,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: rWhite,
                  ),
                  onPressed: () {
                    // _SearchHomeController.clear();
                  },
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 29, 29, 29),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey)),
            onChanged: (value) {
              globSearchKey = value;
              state.key = value;
              // log(value);
              widget.function(value, globAction);
              // log('on click works');
              // search
            },
          );
        },
      ),
    );
  }
}
