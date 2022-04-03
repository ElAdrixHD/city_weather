import 'package:injectable/injectable.dart';

import '../enums/unit_type.dart';
import '../interfaces/i_preference_repository.dart';

@injectable
class GetUnitPreferenceUseCase {
  final IPreferenceRepository _preferenceRepository;

  GetUnitPreferenceUseCase(this._preferenceRepository);

  Future<UnitType> call() async {
    return await _preferenceRepository.getUnitTypeSaved();
  }
}
