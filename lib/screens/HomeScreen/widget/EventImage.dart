import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../function/themeColor.dart';

String imgeGlob = 'x';
bool imgFlag = false;

class EventImage extends StatefulWidget {
  var data;
  var mode;

  EventImage({super.key, required this.data, required this.mode
      // required this.imageStatic,
      });
  // const imageStatic;       

  @override
  State<EventImage> createState() => _EventImageState();
}

class _EventImageState extends State<EventImage> {
  // File? imagePath;

  // late String imgPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: Stack(
        children: [
          Container(
            // color: rWhite,
            height: 220,
            // child: Card(

            // ),
            // width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: rWhite,
              image: DecorationImage(
                  // image: AssetImage(
                  //   'assets/image/wood-blog-placeholder.jpg',
                  // ),
                  image: imageProvide(),
                  fit: BoxFit.fitWidth
                  // scale: 0.9,
                  ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            // alignment: Alignment.bottomLeft,
            child: TextButton(
                onPressed: () async {
                  // imgPath = await pickImage();
                  imgeGlob = await pickImage();
                  imgFlag = true;
                },
                child: Icon(
                  Icons.add_a_photo,
                  color: cBlack,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }

  Future<String> pickImage() async {
    final pickedimage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedimage == null) {
      print('return zero');
      return 'error';
    } else {
      setState(() {
        imgeGlob = pickedimage.path;
        // pickedimage.path = 'x';
      });
      print(pickedimage.path);
      return pickedimage.path;
    }
  }

  imageProvide() {
    print("THis is glob $imgeGlob");

    if (imgFlag == false && widget.mode == "AE") {
      return const AssetImage('assets/image/wood-blog-placeholder.jpg')
          as ImageProvider;
    } else if (widget.mode == "EE" && widget.data == null) {
      // imgeGlob = widget.data.imagePath;
      return FileImage(File(imgeGlob));
      // } else if ((widget.mode != "AE"&&widget.mode != "AT"||widget.mode != "ET") && imgeGlob == 'x') {
    } else if (widget.mode == "EE" && imgeGlob == 'x') {
      imgeGlob = widget.data.imagePath;
      return FileImage(File(imgeGlob));
    } else if (widget.mode == "EE" && imgeGlob != widget.data.imagePath) {
      // imgeGlob = widget.data.imagePath;
      return FileImage(File(imgeGlob));
    } else {
      return FileImage(File(imgeGlob));
    }
  }
}
