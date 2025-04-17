// Package imports:
// ignore_for_file: override_on_non_overriding_member

import 'package:firefuel/firefuel.dart';
import 'package:firefuel_core/firefuel_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Court extends Serializable {
  Court({
    required this.id,
    required this.image,
    required this.amenities,
    required this.website,
    required this.address,
    required this.city,
    required this.nets,
    required this.occupancy,
    required this.pickleheadsLink,
    required this.latitude,
    required this.courts,
    required this.googleMapsLink,
    required this.number,
    required this.pubOrPriv,
    required this.name,
    required this.lines,
    required this.longitude,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
    this.lostPaddles, // Nullable field for lost paddles
  });

  /// Creates a new instance from a Map.
  factory Court.fromMap(Map<String, dynamic> map) {
    return Court(
      id: map['objectID'] as String,
      image: map['image'] as String,
      amenities: map['amenities'] as String,
      website: map['website'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      nets: map['nets'] as String,
      occupancy: map['occupancy'] as String,
      pickleheadsLink: map['pickleheadsLink'] as String,
      latitude: map['latitude'] as String,
      courts: map['courts'] as String,
      googleMapsLink: map['googleMapsLink'] as String,
      number: map['number'] as String,
      pubOrPriv: map['pubOrPriv'] as String,
      name: map['name'] as String,
      lines: map['lines'] as String,
      longitude: map['longitude'] as String,
      monday: map['monday'] as String,
      tuesday: map['tuesday'] as String,
      wednesday: map['wednesday'] as String,
      thursday: map['thursday'] as String,
      friday: map['friday'] as String,
      saturday: map['saturday'] as String,
      sunday: map['sunday'] as String,
      lostPaddles: (map['lostPaddles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(), // Handle null list
    );
  } // Nullable list of strings

  /// Creates a new instance from a JSON map.
  factory Court.fromJson(Map<String, dynamic> json) {
    return Court(
      id: json['id'] as String,
      image: json['image'] as String,
      amenities: json['amenities'] as String,
      website: json['website'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      nets: json['nets'] as String,
      occupancy: json['occupancy'] as String,
      pickleheadsLink: json['pickleheadsLink'] as String,
      latitude: json['latitude'] as String,
      courts: json['courts'] as String,
      googleMapsLink: json['googleMapsLink'] as String,
      number: json['number'] as String,
      pubOrPriv: json['pubOrPriv'] as String,
      name: json['name'] as String,
      lines: json['lines'] as String,
      longitude: json['longitude'] as String,
      monday: json['monday'] as String,
      tuesday: json['tuesday'] as String,
      wednesday: json['wednesday'] as String,
      thursday: json['thursday'] as String,
      friday: json['friday'] as String,
      saturday: json['saturday'] as String,
      sunday: json['sunday'] as String,
      lostPaddles: (json['lostPaddles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(), // Handle null list
    );
  }

  /// Unique court id
  final String id;
  final String image;
  final String amenities;
  final String website;
  final String address;
  final String city;
  final String nets;
  final String occupancy;
  final String pickleheadsLink;
  final String latitude;
  final String courts;
  final String googleMapsLink;
  final String number;
  final String pubOrPriv;
  final String name;
  final String lines;
  final String longitude;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;
  final List<String>? lostPaddles;

  /// Converts the instance to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'amenities': amenities,
      'website': website,
      'address': address,
      'city': city,
      'nets': nets,
      'occupancy': occupancy,
      'pickleheadsLink': pickleheadsLink,
      'latitude': latitude,
      'courts': courts,
      'googleMapsLink': googleMapsLink,
      'number': number,
      'pubOrPriv': pubOrPriv,
      'name': name,
      'lines': lines,
      'longitude': longitude,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
      'lostPaddles': lostPaddles,
    };
  }

  /// Converts the instance to a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'amenities': amenities,
      'website': website,
      'address': address,
      'city': city,
      'nets': nets,
      'occupancy': occupancy,
      'pickleheadsLink': pickleheadsLink,
      'latitude': latitude,
      'courts': courts,
      'googleMapsLink': googleMapsLink,
      'number': number,
      'pubOrPriv': pubOrPriv,
      'name': name,
      'lines': lines,
      'longitude': longitude,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
      'lostPaddles': lostPaddles,
    };
  }

  /// Creates a copy of the instance with the given parameters.
  Court copyWith({
    String? id,
    String? image,
    String? amenities,
    String? website,
    String? address,
    String? city,
    String? nets,
    String? occupancy,
    String? pickleheadsLink,
    String? latitude,
    String? courts,
    String? googleMapsLink,
    String? number,
    String? pubOrPriv,
    String? name,
    String? lines,
    String? longitude,
    String? monday,
    String? tuesday,
    String? wednesday,
    String? thursday,
    String? friday,
    String? saturday,
    String? sunday,
    List<String>? lostPaddles,
  }) {
    return Court(
      id: id ?? this.id,
      image: image ?? this.image,
      amenities: amenities ?? this.amenities,
      website: website ?? this.website,
      address: address ?? this.address,
      city: city ?? this.city,
      nets: nets ?? this.nets,
      occupancy: occupancy ?? this.occupancy,
      pickleheadsLink: pickleheadsLink ?? this.pickleheadsLink,
      latitude: latitude ?? this.latitude,
      courts: courts ?? this.courts,
      googleMapsLink: googleMapsLink ?? this.googleMapsLink,
      number: number ?? this.number,
      pubOrPriv: pubOrPriv ?? this.pubOrPriv,
      name: name ?? this.name,
      lines: lines ?? this.lines,
      longitude: longitude ?? this.longitude,
      monday: monday ?? this.monday,
      tuesday: tuesday ?? this.tuesday,
      wednesday: wednesday ?? this.wednesday,
      thursday: thursday ?? this.thursday,
      friday: friday ?? this.friday,
      saturday: saturday ?? this.saturday,
      sunday: sunday ?? this.sunday,
      lostPaddles: lostPaddles ?? this.lostPaddles,
    );
  }

  /// Additional computed properties and methods.
  List<String> get amenitiesList {
    final amenityList = amenities
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(',')
        .map((e) => e.trim().replaceAll("'", ''))
        .toList();
    final list = <String>[];
    if (amenityList.isNotEmpty && amenityList[0] != '') {
      list.addAll(amenityList);
    }
    if (nets != '') {
      list.insert(0, nets);
    }
    if (pubOrPriv != '') {
      list.insert(0, pubOrPriv);
    }
    if (lines != '') {
      list.insert(0, lines);
    }
    if (courts != '') {
      list.insert(0, courts);
    }

    return list;
  }

  List<int> get dailyHours {
    List<int> parseHoursString(String hoursString) {
      if (hoursString == '') {
        return [];
      } else {
        return hoursString
            .split(',')
            .map((s) => int.parse(s.trim()))
            .toList()
            .sublist(7);
      }
    }

    switch (DateTime.now().weekday) {
      case DateTime.monday:
        return parseHoursString(monday);
      case DateTime.tuesday:
        return parseHoursString(tuesday);
      case DateTime.wednesday:
        return parseHoursString(wednesday);
      case DateTime.thursday:
        return parseHoursString(thursday);
      case DateTime.friday:
        return parseHoursString(friday);
      case DateTime.saturday:
        return parseHoursString(saturday);
      case DateTime.sunday:
        return parseHoursString(sunday);
      default:
        return [];
    }
  }

  @override
  LatLng get location =>
      LatLng(double.parse(latitude), double.parse(longitude));

  /// Equatable properties for comparison.
  @override
  List<Object?> get props => [
        id,
        image,
        amenities,
        website,
        address,
        city,
        nets,
        occupancy,
        pickleheadsLink,
        latitude,
        courts,
        googleMapsLink,
        number,
        pubOrPriv,
        name,
        lines,
        longitude,
        monday,
        tuesday,
        wednesday,
        thursday,
        friday,
        saturday,
        sunday,
        lostPaddles,
      ];

  @override
  bool? get stringify => true;
}
