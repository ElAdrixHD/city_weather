import 'package:injectable/injectable.dart';

import '../interfaces/i_weather_repository.dart';

@injectable
class RemoveCitySavedUseCase {
  final IWeatherRepository _weatherRepository;

  RemoveCitySavedUseCase(this._weatherRepository);

  Future<void> call(String id) async {
    final citySaved = await _weatherRepository.getCitiesSaved();
    citySaved.remove(id);
    return await _weatherRepository.setCitiesSaved(citySaved);
  }
}
