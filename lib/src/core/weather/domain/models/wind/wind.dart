import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable(createToJson: false)
class Wind {
  final double speed;
  final int deg;

  Wind({
    this.speed = 0.0,
    this.deg = 0,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
