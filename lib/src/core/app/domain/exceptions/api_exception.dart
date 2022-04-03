import '../../../../../res/l10n/generated/l10n.dart';
import '../enums/error_type.dart';

class ApiException implements Exception {
  final ErrorType code;

  ApiException([this.code = ErrorType.genericError]);

  String get message => _getMessage();

  String _getMessage() {
    switch (code) {
      case ErrorType.genericError:
        return S.current.genericError;
      case ErrorType.notExistingCity:
        return S.current.notExistingCity;
    }
  }
}
