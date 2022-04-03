import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../res/l10n/generated/l10n.dart';
import '../../app.dart';
import '../../components/buttons/custom_fab.dart';
import '../../components/drawer/custom_drawer.dart';
import '../../routers/router_service.dart';
import '../../states/unit_provider.dart';
import 'components/weather_item.dart';
import 'states/list_city_state.dart';

class ListCityPage extends StatelessWidget {
  const ListCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).titleListCity)),
      drawer: const CustomDrawer(),
      floatingActionButton: CustomFAB(
        icon: Icons.add,
        onTap: () => appRouter.navigate(const AddCityRoute()),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final citiesWatcher = ref.watch(listCityProvider);
          final unitsWatcher = ref.watch(unitProvider);
          return citiesWatcher.cities.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () async => citiesWatcher.refreshData(),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(16.0),
                      child: WeatherItem(
                        city: citiesWatcher.cities[index],
                        speedUnit: unitsWatcher.speedUnit,
                        temperatureUnit: unitsWatcher.temperatureUnit,
                        onDismiss: () => citiesWatcher
                            .deleteCity(citiesWatcher.cities[index]),
                      ),
                    ),
                    itemCount: citiesWatcher.cities.length,
                  ),
                )
              : Center(
                  child: Text(S.of(context).emptyList),
                );
        },
      ),
    );
  }
}
