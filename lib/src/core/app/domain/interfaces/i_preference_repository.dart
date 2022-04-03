import 'package:flutter/material.dart';

import '../enums/unit_type.dart';

abstract class IPreferenceRepository {
  Future<ThemeMode> getThemeSaved();
  Future<String> getLanguageSaved();
  Future<UnitType> getUnitTypeSaved();

  Future<void> setTheme(ThemeMode theme);
  Future<void> setLanguage(String lang);
  Future<void> setUnit(UnitType unitType);
}
