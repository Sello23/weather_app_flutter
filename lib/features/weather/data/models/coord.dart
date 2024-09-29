import 'package:equatable/equatable.dart';

class Coord extends Equatable {
  final double lon;
  final double lat;

  const Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'] as double,
      lat: json['lat'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }

  @override
  List<Object?> get props => [
    lon,
    lat
  ];
}
