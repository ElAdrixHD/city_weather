import 'package:injectable/injectable.dart';

import '../interfaces/i_preference_repository.dart';

@injectable
class SetLanguagePreferenceUseCase {
  final IPreferenceRepository _preferenceRepository;

  SetLanguagePreferenceUseCase(this._preferenceRepository);

  Future<void> call(String lang) async {
    return await _preferenceRepository.setLanguage(lang);
  }
}
