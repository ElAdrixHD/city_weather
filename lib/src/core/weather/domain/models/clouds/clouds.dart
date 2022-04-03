import 'package:json_annotation/json_annotation.dart';

part 'clouds.g.dart';

@JsonSerializable(createToJson: false)
class Clouds {
  final int all;
  final int visibility;
  final int humidity;

  Clouds({
    this.all = 0,
    this.visibility = 0,
    this.humidity = 0,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}
