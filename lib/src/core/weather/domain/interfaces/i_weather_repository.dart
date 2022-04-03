import '../models/city/city.dart';

abstract class IWeatherRepository {
  Future<List<City>> getWeatherByID({
    required List<String> id,
    String? lang,
    String? unit,
  });
  Future<City> getWeatherByName({
    required String name,
    String? country,
    String? lang,
    String? unit,
  });

  Future<List<String>> getCitiesSaved();

  Future<void> setCitiesSaved(List<String> id);
}
