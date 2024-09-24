// import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputWidget extends StatefulWidget {
  final void Function(String image) onPickImage;
  const ImageInputWidget({super.key, required this.onPickImage});

  @override
  State<ImageInputWidget> createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  // File? _selectedImageFile;
  String? _selectedImageNetwork;

  Future<void> _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    // also we could use "ImageSource.gallery"

    if (pickedImage == null) {
      return;
    }

    setState(() {
      // _selectedImageFile = File(pickedImage.path); // Convert XFile to File
      _selectedImageNetwork = pickedImage.path;
    });

    widget.onPickImage(_selectedImageNetwork!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: const Text('Take a picture'),
      icon: const Icon(Icons.camera),
    );

    // for testing on a web browser
    if (_selectedImageNetwork != null && kIsWeb) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.network(_selectedImageNetwork!,
            fit: BoxFit.cover, height: double.infinity, width: double.infinity),
      );
    }
    // for testing on an Android/IOS platform
    // if (_selectedImageFile != null && !kIsWeb) {
    //   content = GestureDetector(
    //     onTap: _takePicture,
    //     child: Image.file(_selectedImageFile!,
    //         fit: BoxFit.cover, height: double.infinity, width: double.infinity),
    //   );
    // }

    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
      ),
      child: content,
    );
  }
}
