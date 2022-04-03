import 'package:json_annotation/json_annotation.dart';

part 'summary.g.dart';

@JsonSerializable(createToJson: false)
class Summary {
  final String title;
  final String description;
  final String icon;

  Summary({
    this.title = '',
    this.description = '',
    this.icon = '',
  });

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}
