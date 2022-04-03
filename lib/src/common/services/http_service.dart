import 'package:dio/dio.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/foundation.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:injectable/injectable.dart';

import '../../core/app/domain/exceptions/api_exception.dart';
import '../../core/app/domain/interfaces/env_base.dart';

class HttpService {
  late Client _instance;
  late final Dio _dio = Dio();

  HttpService(String url) {
    Link link = Link.from([
      DioLink(
        url,
        client: _dio,
      ),
    ]);

    _instance = Client(
      link: link,
      defaultFetchPolicies: {
        OperationType.query: FetchPolicy.NoCache,
        OperationType.mutation: FetchPolicy.NoCache
      },
    );
  }

  Future<OperationResponse<TData, TVars>> request<TData, TVars>(
    OperationRequest<TData, TVars> operation,
  ) async {
    var response = await _instance.request(operation).first;
    if (kDebugMode) {
      if (response.linkException != null) {
        throw response.linkException!.originalException;
      } else if (response.graphqlErrors != null &&
          response.graphqlErrors!.isNotEmpty) {
        throw response.graphqlErrors!.first;
      }
    } else {
      throw ApiException();
    }
    return response;
  }
}

@module
abstract class HttpClientModule {
  @lazySingleton
  HttpService httpClient(EnvBase env) => HttpService(env.apiUrl);
}
