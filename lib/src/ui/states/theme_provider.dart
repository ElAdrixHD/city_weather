import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app/domain/use_cases/get_theme_preference_use_case.dart';
import '../../core/app/domain/use_cases/set_theme_preference_use_case.dart';
import '../../core/app/service_locator.dart';
import 'base_provider.dart';

class ThemeProvider extends BaseProvider {
  final GetThemePreferenceUseCase _getThemePreferenceUseCase =
      getLocator<GetThemePreferenceUseCase>();
  final SetThemePreferenceUseCase _setThemePreferenceUseCase =
      getLocator<SetThemePreferenceUseCase>();
  ThemeMode? themeMode;

  ThemeProvider() {
    _initData();
  }

  void changeMode() async {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    await _saveData();
    notifyListeners();
  }

  Future<void> _saveData() async {
    await _setThemePreferenceUseCase(themeMode!);
  }

  void _initData() async {
    themeMode = await _getThemePreferenceUseCase();
    notifyListeners();
  }
}

final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());
