import 'package:json_annotation/json_annotation.dart';

import '../clouds/clouds.dart';
import '../summary/summary.dart';
import '../temperature/temperature.dart';
import '../wind/wind.dart';

part 'weather.g.dart';

@JsonSerializable(createToJson: false)
class Weather {
  final Summary? summary;
  final Temperature? temperature;
  final Wind? wind;
  final Clouds? clouds;
  final int timestamp;

  Weather({
    this.summary,
    this.temperature,
    this.wind,
    this.clouds,
    this.timestamp = 0,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
