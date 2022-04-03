import 'package:injectable/injectable.dart';

import '../interfaces/i_weather_repository.dart';

@injectable
class GetCitiesSavedUseCase {
  final IWeatherRepository _weatherRepository;

  GetCitiesSavedUseCase(this._weatherRepository);

  Future<List<String>> call() async {
    return await _weatherRepository.getCitiesSaved();
  }
}
