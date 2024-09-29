import 'package:equatable/equatable.dart';

class Location extends Equatable{
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  const Location({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] as String,
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      country: json['country'] as String,
      state: json['state'] as String?,
    );
  }

  Map<String, dynamic>toJson() {
    return {
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
      'state': state,
    };
  }

  @override
  List<Object?> get props => [
    name,
    lat,
    lon,
    country,
    state
  ];
}