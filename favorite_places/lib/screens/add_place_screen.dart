import 'package:favorite_places/providers/user_places_notifier.dart';
import 'package:favorite_places/widgets/image_input_widget.dart';
import 'package:favorite_places/widgets/location_input_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  String _enteredTitle = '';
  String? _selectedImage;

  void _savePlace() {
    if (_formKey.currentState!.validate() || _selectedImage == null) {
      _formKey.currentState!.save();
      ref
          .read(userPlacesNotifier.notifier)
          .addPlace(_enteredTitle, _selectedImage!);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(labelText: 'Title'),
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length >= 50) {
                      return 'Must be between 1 and 50 characters';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredTitle = newValue!;
                  },
                ),
                const SizedBox(height: 10),
                ImageInputWidget(onPickImage: (image) {
                  _selectedImage = image;
                }),
                const SizedBox(
                  height: 10,
                ),
                const LocationInputWidget(),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: _savePlace,
                  label: const Text('Add Place'),
                  icon: const Icon(Icons.add),
                )
              ],
            )),
      ),
    );
  }
}
