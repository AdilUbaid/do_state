import 'dart:io';

import 'package:flutter/material.dart';
import 'package:do_state/main.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class ImageDialog extends StatelessWidget {
  var data;

  // ImageDialog(thidata);
  ImageDialog({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 350,
        // clipBehavior: cli,
        height: 500,
        decoration: BoxDecoration(
          // color: cBlack,
          image: DecorationImage(
            image: FileImage(
              File(data.imagePath),
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
