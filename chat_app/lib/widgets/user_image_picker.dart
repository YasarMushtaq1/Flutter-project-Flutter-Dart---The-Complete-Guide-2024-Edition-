import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(String pickedImage) onPickImage;
  const UserImagePicker({super.key, required this.onPickImage});

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  String? _pickedImageFile;

  Future<void> _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 150, imageQuality: 50);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImageFile = pickedImage.path;
    });

    widget.onPickImage(_pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage:
              _pickedImageFile != null ? NetworkImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage,
          label: Text(
            'Add Image',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          icon: const Icon(Icons.image),
        ),
      ],
    );
  }
}
