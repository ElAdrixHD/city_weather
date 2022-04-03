import 'package:built_collection/built_collection.dart';
import 'package:ferry/ferry.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/services/database_service.dart';
import '../../../../common/services/http_service.dart';
import '../../../app/data/graphql/schema.schema.gql.dart';
import '../../../app/domain/enums/error_type.dart';
import '../../../app/domain/exceptions/api_exception.dart';
import '../../domain/interfaces/i_weather_repository.dart';
import '../../domain/models/city/city.dart';
import '../graphql/queries/get_weather_by_id/get_weather_by_id.data.gql.dart';
import '../graphql/queries/get_weather_by_id/get_weather_by_id.req.gql.dart';
import '../graphql/queries/get_weather_by_id/get_weather_by_id.var.gql.dart';
import '../graphql/queries/get_weather_by_name/get_weather_by_name.data.gql.dart';
import '../graphql/queries/get_weather_by_name/get_weather_by_name.req.gql.dart';
import '../graphql/queries/get_weather_by_name/get_weather_by_name.var.gql.dart';

@Injectable(as: IWeatherRepository)
class WeatherRepository implements IWeatherRepository {
  final HttpService _httpService;
  final DatabaseService _database;

  WeatherRepository(this._httpService, this._database);

  @override
  Future<List<City>> getWeatherByID({
    required List<String> id,
    String? lang,
    String? unit,
  }) async {
    final config = GConfigInputBuilder()
      ..units = unit
      ..lang = lang;

    final req = GGetCityByIdReq(
      (b) => b.vars
        ..id = ListBuilder<String>(id)
        ..config = config,
    );

    OperationResponse<GGetCityByIdData, GGetCityByIdVars> response =
        await _httpService.request(req);
    if (response.data?.getCityById?.isNotEmpty ?? false) {
      return response.data!.getCityById!
          .map((city) => City.fromJson(city.toJson()))
          .toList();
    }
    throw ApiException();
  }

  @override
  Future<City> getWeatherByName({
    required String name,
    String? country,
    String? lang,
    String? unit,
  }) async {
    final config = GConfigInputBuilder()
      ..units = unit
      ..lang = 'es';

    final req = GGetCityByNameReq(
      (b) => b.vars
        ..name = name
        ..country = country
        ..config = config,
    );

    OperationResponse<GGetCityByNameData, GGetCityByNameVars> response =
        await _httpService.request(req);
    if (response.data?.getCityByName != null) {
      return City.fromJson(response.data!.getCityByName!.toJson());
    }
    throw ApiException(ErrorType.notExistingCity);
  }

  @override
  Future<List<String>> getCitiesSaved() async {
    return await _database.read<List<String>>('cities') ?? [];
  }

  @override
  Future<void> setCitiesSaved(List<String> id) async {
    return await _database.write('cities', id);
  }
}
