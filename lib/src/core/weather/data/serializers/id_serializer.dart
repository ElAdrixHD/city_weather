import 'package:built_value/serializer.dart';

class IdSerializer implements PrimitiveSerializer<int> {
  @override
  int deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    assert(
      serialized is String || serialized is int,
      "IdSerializer expected 'String' or 'int' but got ${serialized.runtimeType}",
    );
    return serialized is String ? int.parse(serialized) : serialized as int;
  }

  @override
  Object serialize(
    Serializers serializers,
    int id, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      id;

  @override
  Iterable<Type> get types => [int];

  @override
  String get wireName => 'ID';
}
