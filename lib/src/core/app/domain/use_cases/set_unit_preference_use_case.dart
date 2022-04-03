import 'package:injectable/injectable.dart';

import '../enums/unit_type.dart';
import '../interfaces/i_preference_repository.dart';

@injectable
class SetUnitPreferenceUseCase {
  final IPreferenceRepository _preferenceRepository;

  SetUnitPreferenceUseCase(this._preferenceRepository);

  Future<void> call(UnitType unit) async {
    return await _preferenceRepository.setUnit(unit);
  }
}
