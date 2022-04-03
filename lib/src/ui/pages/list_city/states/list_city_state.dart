import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../res/l10n/generated/l10n.dart';
import '../../../../core/app/service_locator.dart';
import '../../../../core/weather/domain/models/city/city.dart';
import '../../../../core/weather/domain/use_cases/get_cities_saved_use_case.dart';
import '../../../../core/weather/domain/use_cases/get_weather_by_id_use_case.dart';
import '../../../../core/weather/domain/use_cases/remove_city_saved_use_case.dart';
import '../../../../core/weather/domain/use_cases/set_cities_saved_use_case.dart';
import '../../../states/base_provider.dart';
import '../../../states/language_provider.dart';
import '../../../states/unit_provider.dart';

class ListCityState extends BaseProvider {
  final Reader _reader;
  final GetWeatherByIdUseCase _byIdUseCase =
      getLocator<GetWeatherByIdUseCase>();
  final GetCitiesSavedUseCase _getCitiesSavedUseCase =
      getLocator<GetCitiesSavedUseCase>();
  final SetCitiesSavedUseCase _setCitiesSavedUseCase =
      getLocator<SetCitiesSavedUseCase>();
  final RemoveCitySavedUseCase _removeCitySavedUseCase =
      getLocator<RemoveCitySavedUseCase>();

  final List<City> cities = [];

  ListCityState(this._reader) {
    _initData();
  }

  void _initData() async {
    final List<City> result = [];
    final isGood = await tryCatch(
      tryFunction: () async {
        final getCitiesSaved = await _getCitiesSavedUseCase();
        if (getCitiesSaved.isNotEmpty) {
          result.addAll(
            await _byIdUseCase(
              id: getCitiesSaved,
              lang: _reader(languageProvider).locale?.languageCode,
              unit: _reader(unitProvider).unitType?.name,
            ),
          );
        }
      },
      exceptionMessage: S.current.genericError,
    );
    if (isGood) {
      cities.addAll(result);
      notifyListeners();
    }
  }

  void refreshData() {
    cities.clear();
    notifyListeners();
    _initData();
  }

  void addCity(City city) {
    cities.add(city);
    _setCitiesSavedUseCase(city.id);
    notifyListeners();
  }

  void deleteCity(City city) {
    cities.remove(city);
    _removeCitySavedUseCase(city.id);
    notifyListeners();
  }
}

final listCityProvider =
    ChangeNotifierProvider.autoDispose((ref) => ListCityState(ref.read));
