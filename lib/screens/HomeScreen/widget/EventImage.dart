import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../function/themeColor.dart';

String imgeGlob = 'x';
bool imgFlag = false;
final ProvimgeGlob = StateProvider<String>((ref) => imgeGlob);
final ProvimgFlag = StateProvider<bool>((ref) => imgFlag);

class EventImage extends ConsumerWidget {
  var data;
  var mode;

  EventImage({super.key, required this.data, required this.mode
      // required this.imageStatic,
      });
  // const imageStatic;

  // File? imagePath;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageGlobEL = ref.watch(ProvimgeGlob);
    final imageFlagEL = ref.watch(ProvimgFlag);
    // final value = ref.watch(provCalTask);
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
                  image: imageProvide(imageGlobEL, imageFlagEL,ref),
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
                  // imgeGlob = await pickImage(ref);
                  ref.read(ProvimgeGlob.notifier).state = await pickImage(ref);
                  imgeGlob = imageGlobEL;
                  imgFlag = true;
                  ref.read(ProvimgFlag.notifier).state = true;
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

  Future<String> pickImage(WidgetRef ref) async {
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
      ref.read(ProvimgeGlob.notifier).state = pickedimage.path;

      // });
      print(pickedimage.path);
      return pickedimage.path;
    }
  }

  imageProvide(String imageGlobEL, bool imageFlagEL,WidgetRef ref) {
    print("THis is glob $imgeGlob");

    if (imageFlagEL == false && mode == "AE") {
      return const AssetImage('assets/image/wood-blog-placeholder.jpg')
          as ImageProvider;
    } else if (mode == "EE" && data == null) {
      // imgeGlob = widget.data.imagePath;1
      return FileImage(File(imageGlobEL));
      // } else if ((widget.mode != "AE"&&widget.mode != "AT"||widget.mode != "ET") && imgeGlob == 'x') {1
    } else if (mode == "EE" && imageGlobEL == 'x') {
      ref.read(ProvimgeGlob.notifier).state =data.imagePath;
      imgeGlob = data.imagePath;
      return FileImage(File(imageGlobEL));
    } else if (mode == "EE" && imageGlobEL != data.imagePath) {
      // imgeGlob = widget.data.imagePath;1
      return FileImage(File(imageGlobEL));
    } else {
      return FileImage(File(imageGlobEL));
    }
  }
}
