import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app/domain/use_cases/get_language_preference_use_case.dart';
import '../../core/app/domain/use_cases/set_language_preference_use_case.dart';
import '../../core/app/service_locator.dart';
import 'base_provider.dart';

class LanguageProvider extends BaseProvider {
  final GetLanguagePreferenceUseCase _getLanguagePreferenceUseCase =
      getLocator<GetLanguagePreferenceUseCase>();
  final SetLanguagePreferenceUseCase _setLanguagePreferenceUseCase =
      getLocator<SetLanguagePreferenceUseCase>();

  Locale? locale;

  LanguageProvider() {
    _initData();
  }

  Future<void> changeLocale(Locale locale) async {
    this.locale = locale;
    await _saveData();
    notifyListeners();
  }

  Future<void> _saveData() async {
    await _setLanguagePreferenceUseCase(locale!.languageCode);
  }

  void _initData() async {
    locale = Locale(await _getLanguagePreferenceUseCase());
    notifyListeners();
  }
}

final languageProvider = ChangeNotifierProvider((ref) => LanguageProvider());
