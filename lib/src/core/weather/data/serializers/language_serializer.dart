import 'package:built_value/serializer.dart';

class LanguageSerializer implements PrimitiveSerializer<String> {
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
    String language, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      language;

  @override
  Iterable<Type> get types => [String];

  @override
  String get wireName => 'Language';
}
