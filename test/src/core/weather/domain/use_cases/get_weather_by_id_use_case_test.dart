import 'package:city_weather/src/core/weather/domain/interfaces/i_weather_repository.dart';
import 'package:city_weather/src/core/weather/domain/models/city/city.dart';
import 'package:city_weather/src/core/weather/domain/use_cases/get_cities_saved_use_case.dart';
import 'package:city_weather/src/core/weather/domain/use_cases/get_weather_by_name_use_case.dart';
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_weather_by_id_use_case_test.mocks.dart';

final faker = Faker.instance;
@GenerateMocks([IWeatherRepository])
void main() {
  final repository = MockIWeatherRepository();
  final getWeatherByNameUseCase = GetWeatherByNameUseCase(repository);
  final getCitiesSavedUseCase = GetCitiesSavedUseCase(repository);
  test('get an valid city from a valid name', () async {
    when(repository.getWeatherByName(name: 'Granada'))
        .thenAnswer((_) async => City(id: faker.datatype.uuid()));

    final result = await getWeatherByNameUseCase(name: 'Granada');

    expect(result, isNotNull);
  });

  test('get list cities empty', () async {
    when(repository.getCitiesSaved()).thenAnswer((_) async => []);

    final result = await getCitiesSavedUseCase();

    expect(result, isEmpty);
  });

  test('get list cities not empty', () async {
    when(repository.getCitiesSaved()).thenAnswer(
      (_) async => [
        faker.datatype.uuid(),
        faker.datatype.uuid(),
      ],
    );

    final result = await getCitiesSavedUseCase();

    expect(result, isNotEmpty);
  });
}
