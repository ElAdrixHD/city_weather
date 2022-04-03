import 'package:flutter/material.dart';

import '../components/dialogs/generic_dialog.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AlertService {
  static Future<T?> show<T>(String desc) => showDialog<T>(
        context: navigatorKey.currentState!.overlay!.context,
        useRootNavigator: false,
        builder: (BuildContext context) {
          return GenericDialog(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
