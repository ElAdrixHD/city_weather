import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/core/app/domain/interfaces/env_base.dart';
import 'src/core/app/domain/models/env.main.dart';
import 'src/core/app/service_locator.dart';
import 'src/ui/app.dart';

void main() async {
  await Hive.initFlutter();
  GetIt.I.registerSingleton<EnvBase>(MainEnv());
  configureDependencies();
  runApp(const App());
}
