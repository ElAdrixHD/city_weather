import '../interfaces/env_base.dart';

class MainEnv implements EnvBase {
  @override
  String get apiUrl => 'https://graphql-weather-api.herokuapp.com/';
}
