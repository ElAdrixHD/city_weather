import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../interfaces/i_preference_repository.dart';

@injectable
class GetThemePreferenceUseCase {
  final IPreferenceRepository _preferenceRepository;

  GetThemePreferenceUseCase(this._preferenceRepository);

  Future<ThemeMode> call() async {
    return await _preferenceRepository.getThemeSaved();
  }
}
