import 'package:favorite_places/models/place_model.dart';
import 'package:favorite_places/screens/place_detail_screen.dart';

import 'package:flutter/material.dart';

class PlacesListWidget extends StatelessWidget {
  final List<PlaceModel> places;
  const PlacesListWidget({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(places[index].imageNetwork),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          subtitle: Text(
            'I am a fake address...',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => PlaceDetailScreen(place: places[index]),
              ),
            );
          },
        );
      },
    );
  }
}
