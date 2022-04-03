import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../res/l10n/generated/l10n.dart';
import '../../../core/app/domain/enums/unit_type.dart';
import '../../states/language_provider.dart';
import '../../states/theme_provider.dart';
import '../../states/unit_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).wantDarkMode,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final themeWatcher = ref.watch(themeProvider);
                      return Switch(
                        value: themeWatcher.themeMode != ThemeMode.light,
                        onChanged: (_) => themeWatcher.changeMode(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final languageWatcher = ref.watch(languageProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            languageWatcher.changeLocale(const Locale('en')),
                        child: Text(S.of(context).english),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            languageWatcher.changeLocale(const Locale('es')),
                        child: Text(S.of(context).spanish),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final unitWatcher = ref.watch(unitProvider);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            unitWatcher.changeUnit(UnitType.metric),
                        child: Text(S.of(context).metric),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            unitWatcher.changeUnit(UnitType.imperial),
                        child: Text(S.of(context).imperial),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            unitWatcher.changeUnit(UnitType.kelvin),
                        child: Text(S.of(context).kelvin),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
