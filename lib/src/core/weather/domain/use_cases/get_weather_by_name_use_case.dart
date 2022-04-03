import 'package:injectable/injectable.dart';

import '../interfaces/i_weather_repository.dart';
import '../models/city/city.dart';

@injectable
class GetWeatherByNameUseCase {
  final IWeatherRepository _weatherRepository;

  GetWeatherByNameUseCase(this._weatherRepository);

  Future<City> call({
    required String name,
    String? lang,
    String? unit,
  }) async {
    return await _weatherRepository.getWeatherByName(
      name: name,
      lang: lang,
      unit: unit,
    );
  }
}
