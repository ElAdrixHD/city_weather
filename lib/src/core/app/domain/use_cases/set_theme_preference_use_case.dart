import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../interfaces/i_preference_repository.dart';

@injectable
class SetThemePreferenceUseCase {
  final IPreferenceRepository _preferenceRepository;

  SetThemePreferenceUseCase(this._preferenceRepository);

  Future<void> call(ThemeMode themeMode) async {
    return await _preferenceRepository.setTheme(themeMode);
  }
}
