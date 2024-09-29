import 'package:equatable/equatable.dart';

class FeelsLike extends Equatable {
  final double day;
  final double night;
  final double eve;
  final double morn;

  const FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return FeelsLike(
      day: json['day'] as double,
      night: json['night'] as double,
      eve: json['eve'] as double,
      morn: json['morn'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    day,
    night,
    eve,
    morn
  ];
}
