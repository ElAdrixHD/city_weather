import 'package:injectable/injectable.dart';

import '../interfaces/i_weather_repository.dart';

@injectable
class SetCitiesSavedUseCase {
  final IWeatherRepository _weatherRepository;

  SetCitiesSavedUseCase(this._weatherRepository);

  Future<void> call(String id) async {
    final citySaved = await _weatherRepository.getCitiesSaved();
    citySaved.add(id);
    return await _weatherRepository.setCitiesSaved(citySaved);
  }
}
