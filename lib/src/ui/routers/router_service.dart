import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

import '../pages/add_city/add_city_page.dart';
import '../pages/list_city/list_city_page.dart';

part 'router_service.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  preferRelativeImports: true,
  routes: <AutoRoute>[
    AutoRoute(page: ListCityPage, initial: true),
    AutoRoute(page: AddCityPage),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
  }) : super(navigatorKey);
}
