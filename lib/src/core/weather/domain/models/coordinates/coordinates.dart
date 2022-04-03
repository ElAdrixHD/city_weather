import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable(createToJson: false)
class Coordinates {
  final double lon;
  final double lat;

  Coordinates({
    this.lon = 0.0,
    this.lat = 0.0,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}
