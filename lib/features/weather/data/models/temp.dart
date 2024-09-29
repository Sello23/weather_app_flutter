import 'package:equatable/equatable.dart';

class Temp extends Equatable {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  const Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(
      day: json['day'] as double,
      min: json['min'] as double,
      max: json['max'] as double,
      night: json['night'] as double,
      eve: json['eve'] as double,
      morn: json['morn'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'min': min,
      'max': max,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  @override
  List<Object?> get props => [
    day,
    min,
    max,
    night,
    eve,
    morn
  ];
}
