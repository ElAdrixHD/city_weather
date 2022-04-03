import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../res/l10n/generated/l10n.dart';
import '../../../../core/app/service_locator.dart';
import '../../../../core/weather/domain/use_cases/get_weather_by_name_use_case.dart';
import '../../../app.dart';
import '../../../states/base_provider.dart';
import '../../../states/language_provider.dart';
import '../../../states/unit_provider.dart';
import '../../list_city/states/list_city_state.dart';

class AddCityState extends BaseProvider {
  final Reader _reader;
  final formKey = GlobalKey<FormBuilderState>();
  final GetWeatherByNameUseCase _byNameUseCase =
      getLocator<GetWeatherByNameUseCase>();

  AddCityState(this._reader);

  saveForm() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final res = await tryCatch(
        tryFunction: () async {
          final city = await _byNameUseCase(
            name: formKey.currentState?.value['city'],
            lang: _reader(languageProvider).locale?.languageCode,
            unit: _reader(unitProvider).unitType?.name,
          );
          _reader(listCityProvider).addCity(city);
        },
        exceptionMessage: S.current.notValidCity,
      );
      if (res) {
        appRouter.pop();
      }
    }
  }
}

final addCityState =
    ChangeNotifierProvider.autoDispose((ref) => AddCityState(ref.read));
