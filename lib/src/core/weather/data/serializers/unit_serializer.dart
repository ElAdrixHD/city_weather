import 'package:built_value/serializer.dart';

class UnitSerializer implements PrimitiveSerializer<String> {
  @override
  String deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    assert(
      serialized is String,
      "IdSerializer expected 'String' but got ${serialized.runtimeType}",
    );
    return serialized as String;
  }

  @override
  Object serialize(
    Serializers serializers,
    String unit, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      unit;

  @override
  Iterable<Type> get types => [String];

  @override
  String get wireName => 'Unit';
}
