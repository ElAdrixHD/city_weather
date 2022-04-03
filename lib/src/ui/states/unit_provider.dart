import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app/domain/enums/unit_type.dart';
import '../../core/app/domain/use_cases/get_unit_preference_use_case.dart';
import '../../core/app/domain/use_cases/set_unit_preference_use_case.dart';
import '../../core/app/service_locator.dart';
import '../pages/list_city/states/list_city_state.dart';
import 'base_provider.dart';

class UnitProvider extends BaseProvider {
  final Reader _reader;
  final GetUnitPreferenceUseCase _getUnitPreferenceUseCase =
      getLocator<GetUnitPreferenceUseCase>();
  final SetUnitPreferenceUseCase _setUnitPreferenceUseCase =
      getLocator<SetUnitPreferenceUseCase>();

  UnitType? unitType;

  UnitProvider(this._reader) {
    _initData();
  }

  String get temperatureUnit {
    switch (unitType) {
      case UnitType.metric:
        return 'ºC';
      case UnitType.kelvin:
        return 'ºK';
      case UnitType.imperial:
        return 'ºF';
      default:
        return 'ºC';
    }
  }

  String get speedUnit {
    switch (unitType) {
      case UnitType.metric:
        return 'm/s';
      case UnitType.kelvin:
        return 'm/s';
      case UnitType.imperial:
        return 'mi/h';
      default:
        return 'm/s';
    }
  }

  void changeUnit(UnitType unitType) async {
    this.unitType = unitType;
    await _setUnitPreferenceUseCase(unitType);
    _reader(listCityProvider).refreshData();
  }

  Future<void> _initData() async {
    unitType = await _getUnitPreferenceUseCase();
    notifyListeners();
  }
}

final unitProvider = ChangeNotifierProvider((ref) => UnitProvider(ref.read));
