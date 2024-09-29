import 'package:equatable/equatable.dart';

import 'coord.dart';

class City extends Equatable {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;

  const City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'] as int,
      name: json['name'] as String,
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String,
      population: json['population'] as int,
      timezone: json['timezone'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'coord': coord.toJson(),
      'country': country,
      'population': population,
      'timezone': timezone,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        coord,
        country,
        population,
        timezone,
      ];
}
