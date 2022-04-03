import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:load/load.dart';

import '../../res/l10n/generated/l10n.dart';
import 'routers/router_service.dart';
import 'services/alert_service.dart';
import 'states/language_provider.dart';
import 'states/theme_provider.dart';

final appRouter = AppRouter(navigatorKey: navigatorKey);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          final theme =
              ref.watch(themeProvider.select((value) => value.themeMode));
          final locale =
              ref.watch(languageProvider.select((value) => value.locale));
          return MaterialApp.router(
            title: 'City Weather',
            theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue),
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.vesuviusBurn),
            themeMode: theme,
            debugShowCheckedModeBanner: false,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            supportedLocales: const [
              Locale('es'),
              Locale('en'),
            ],
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) => LoadingProvider(
              child: child ?? Container(),
              themeData: LoadingThemeData(),
            ),
          );
        },
      ),
    );
  }
}
