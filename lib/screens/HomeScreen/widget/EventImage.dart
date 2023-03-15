import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/screen_home/add_image/add_image_bloc.dart';
import '../../../function/themeColor.dart';

String imgeGlob = 'x';
bool imgFlag = false;

class EventImage extends StatelessWidget {
  var data;
  var mode;

  EventImage({super.key, required this.data, required this.mode});

  @override
  @override
  // State<EventImage> createState() => _EventImageState();
// }

// class _EventImageState extends State<EventImage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: BlocBuilder<AddImageBloc, AddImageState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: rWhite,
                  image: DecorationImage(
                      image: imageProvide(), fit: BoxFit.fitWidth),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: TextButton(
                    onPressed: () async {
                      // imgPath = await pickImage();
                      imgeGlob = await pickImage(state);
                      imgFlag = true;
                    },
                    child: Icon(
                      Icons.add_a_photo,
                      color: cBlack,
                      size: 30,
                    )),
              )
            ],
          );
        },
      ),
    );
  }

  Future<String> pickImage(AddImageState state) async {
    final pickedimage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedimage == null) {
      print('return zero');
      return 'error';
    } else {
      // setState(() {
      imgeGlob = pickedimage.path;
      state.image?.path!=pickedimage.path;
      // });
      print(pickedimage.path);
      return pickedimage.path;
    }
  }

  imageProvide() {
    print("THis is glob $imgeGlob");

    if (imgFlag == false && mode == "AE") {
      return const AssetImage('assets/image/wood-blog-placeholder.jpg')
          as ImageProvider;
    } else if (mode == "EE" && data == null) {
      return FileImage(File(imgeGlob));
    } else if (mode == "EE" && imgeGlob == 'x') {
      imgeGlob = data.imagePath;
      return FileImage(File(imgeGlob));
    } else if (mode == "EE" && imgeGlob != data.imagePath) {
      return FileImage(File(imgeGlob));
    } else {
      return FileImage(File(imgeGlob));
    }
  }
}
