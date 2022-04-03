import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable(createToJson: false)
class Temperature {
  final double actual;
  final double feelsLike;
  final double min;
  final double max;

  Temperature({
    this.actual = 0.0,
    this.feelsLike = 0.0,
    this.min = 0.0,
    this.max = 0.0,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}
