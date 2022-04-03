import 'package:injectable/injectable.dart';

import '../interfaces/i_preference_repository.dart';

@injectable
class GetLanguagePreferenceUseCase {
  final IPreferenceRepository _preferenceRepository;

  GetLanguagePreferenceUseCase(this._preferenceRepository);

  Future<String> call() async {
    return await _preferenceRepository.getLanguageSaved();
  }
}
