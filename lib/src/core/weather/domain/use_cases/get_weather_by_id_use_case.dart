import 'package:injectable/injectable.dart';

import '../interfaces/i_weather_repository.dart';
import '../models/city/city.dart';

@injectable
class GetWeatherByIdUseCase {
  final IWeatherRepository _weatherRepository;

  GetWeatherByIdUseCase(this._weatherRepository);

  Future<List<City>> call({
    List<String> id = const [],
    String? lang,
    String? unit,
  }) async {
    return await _weatherRepository.getWeatherByID(
      id: id,
      lang: lang,
      unit: unit,
    );
  }
}
