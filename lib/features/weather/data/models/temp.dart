import 'package:equatable/equatable.dart';

class Temp extends Equatable {
  final num day;
  final num min;
  final num max;
  final num night;
  final num eve;
  final num morn;

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
      day: json['day'] as num,
      min: json['min'] as num,
      max: json['max'] as num,
      night: json['night'] as num,
      eve: json['eve'] as num,
      morn: json['morn'] as num,
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
