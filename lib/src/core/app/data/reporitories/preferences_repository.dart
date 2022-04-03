import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/services/database_service.dart';
import '../../domain/enums/unit_type.dart';
import '../../domain/interfaces/i_preference_repository.dart';

@Injectable(as: IPreferenceRepository)
class PreferencesRepository implements IPreferenceRepository {
  final DatabaseService _service;
  PreferencesRepository(this._service);

  @override
  Future<String> getLanguageSaved() async {
    return await _service.read<String>('language') ?? '';
  }

  @override
  Future<ThemeMode> getThemeSaved() async {
    return EnumToString.fromString(
          ThemeMode.values,
          await _service.read<String>('theme') ?? '',
        ) ??
        ThemeMode.light;
  }

  @override
  Future<UnitType> getUnitTypeSaved() async {
    return EnumToString.fromString(
          UnitType.values,
          await _service.read<String>('unit') ?? '',
        ) ??
        UnitType.metric;
  }

  @override
  Future<void> setLanguage(String lang) async {
    await _service.write('language', lang);
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    await _service.write('theme', theme.name);
  }

  @override
  Future<void> setUnit(UnitType unitType) async {
    await _service.write('unit', unitType.name);
  }
}
