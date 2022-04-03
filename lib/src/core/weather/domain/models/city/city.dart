import 'package:json_annotation/json_annotation.dart';

import '../coordinates/coordinates.dart';
import '../weather/weather.dart';

part 'city.g.dart';

@JsonSerializable(createToJson: false)
class City {
  final String id;
  final String name;
  final String country;
  final Coordinates? coord;
  final Weather? weather;

  City({
    required this.id,
    this.name = '',
    this.country = '',
    this.coord,
    this.weather,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
