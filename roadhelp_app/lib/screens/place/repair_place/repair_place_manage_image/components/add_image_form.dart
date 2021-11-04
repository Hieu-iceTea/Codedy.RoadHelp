import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImageForm extends StatelessWidget {
  final Function(File) onSelectImage;

  const AddImageForm({
    required this.onSelectImage,
    Key? key,
  }) : super(key: key);

  Future<void> _takeImage() async {
    XFile? imageXFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageXFile == null) {
      return;
    }
    File imageFile = File(imageXFile.path);

    onSelectImage(imageFile);

    //final fileName = path.basename(imageFile.path); //import 'package:path/path.dart' as path;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: IconButton(
        icon: const Icon(Icons.add_a_photo),
        onPressed: () => _takeImage(),
      ),
    );
  }
}
