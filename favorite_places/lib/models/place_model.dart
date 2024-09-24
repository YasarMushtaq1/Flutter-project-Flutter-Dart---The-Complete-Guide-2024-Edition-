// import 'dart:io';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

// class PlaceLocationModel {
//   final double latitude;
//   final double longitude;
//   final String address;

//   const PlaceLocationModel({
//     required this.latitude,
//     required this.longitude,
//     required this.address,
//   });
// }

class PlaceModel {
  final String id;
  final String title;
  final String imageNetwork;
  // final File imageFile;

  PlaceModel({
    required this.title,
    required this.imageNetwork,
    // required this.imageFile,
  }) : id = uuid.v4();
}
