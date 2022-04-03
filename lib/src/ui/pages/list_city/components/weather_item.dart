import 'package:flutter/material.dart';

import '../../../../../res/l10n/generated/l10n.dart';
import '../../../../core/weather/domain/models/city/city.dart';

class WeatherItem extends StatelessWidget {
  final City city;
  final String temperatureUnit;
  final String speedUnit;
  final VoidCallback onDismiss;
  const WeatherItem({
    Key? key,
    required this.city,
    required this.speedUnit,
    required this.temperatureUnit,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(city.id),
      onDismissed: (_) => onDismiss(),
      background: Container(
        color: Theme.of(context).colorScheme.errorContainer,
        padding: const EdgeInsets.all(40),
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.startToEnd,
      child: Card(
        elevation: 16,
        color: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city.name,
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                city.country,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 16,
              ),
              Table(
                border:
                    TableBorder.all(borderRadius: BorderRadius.circular(16)),
                children: [
                  TableRow(
                    children: [
                      _buildTemperature(context),
                      _buildWind(context),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildTemperature(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).temperature,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Text(
            '${S.of(context).actual}: ${city.weather?.temperature?.actual.toStringAsFixed(1) ?? '0.0'}$temperatureUnit',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${S.of(context).min}: ${city.weather?.temperature?.min.toStringAsFixed(1) ?? '0.0'}$temperatureUnit',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${S.of(context).max}: ${city.weather?.temperature?.max.toStringAsFixed(1) ?? '0.0'}$temperatureUnit',
            style: Theme.of(context).textTheme.bodyText2,
          )
        ],
      ),
    );
  }

  _buildWind(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).wind,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Text(
            '${S.of(context).speed}: ${city.weather?.wind?.speed.toStringAsFixed(2) ?? '0.0'} $speedUnit',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${S.of(context).deg}: ${city.weather?.wind?.deg ?? '0'}º',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
