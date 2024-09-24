// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
// import 'package:http/http.dart' as http;

// import 'package:favorite_places/models/place_model.dart';

class LocationInputWidget extends StatefulWidget {
  const LocationInputWidget({super.key});

  @override
  State<LocationInputWidget> createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  // var _isGettingLocation = false;
  // PlaceLocationModel? _pickedLocation;

// Note: Did not work on Chrome browser but did work on Android
  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    // LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // setState(() {
    //   _isGettingLocation = true;
    // });

    // locationData = await location.getLocation();
    // final lat = locationData.latitude;
    // final lng = locationData.longitude;

    // if (lat == null || lng == null) {
    //   // Optional: show an error here
    //   return;
    // }

    // Important note: getting a google API Key is not possible for me at the moment, because I'm banned and need to add a billing method. So I can't test this feature right now!
    // const apiKey = 'fake_key';
    // final url = Uri.parse(
    //     "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey");
    // final response = await http.get(url);
    // final resData = json.decode(response.body);
    // final address = resData['results'][0]['formatted_address'];

    // setState(() {
    // _pickedLocation = const PlaceLocationModel(
    //   latitude: lat,
    //   longitude: lng,
    //   address: address,
    // );
    //   _isGettingLocation = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Image.asset('images/google_maps.jpg');

    // Widget previewContent = Text(
    //   'No location chosen',
    //   textAlign: TextAlign.center,
    //   style: Theme.of(context)
    //       .textTheme
    //       .bodyLarge!
    //       .copyWith(color: Theme.of(context).colorScheme.onSurface),
    // );

    // if (_isGettingLocation) {
    //   previewContent = const CircularProgressIndicator();
    // }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              label: const Text('Get current location'),
              icon: const Icon(Icons.location_on),
              onPressed: () {},
            ),
            TextButton.icon(
              label: const Text('Select on map'),
              icon: const Icon(Icons.map),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
