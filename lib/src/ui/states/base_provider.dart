import 'package:flutter/widgets.dart';

import '../../core/app/domain/exceptions/api_exception.dart';
import '../../core/app/service_locator.dart';
import '../services/alert_service.dart';
import '../services/loader_service.dart';

class BaseProvider extends ChangeNotifier {
  final LoaderService loader = getLocator<LoaderService>();

  Future<bool> tryCatch({
    required Future<void> Function() tryFunction,
    required String exceptionMessage,
  }) async {
    try {
      loader.show();
      await tryFunction();
      return true;
    } on ApiException catch (e) {
      debugPrint(e.code.name);
      AlertService.show(
        e.message,
      );
      return false;
    } on Exception catch (e) {
      debugPrint(e.toString());
      AlertService.show(
        exceptionMessage.isNotEmpty ? exceptionMessage : e.toString(),
      );
      return false;
    } finally {
      loader.hide();
    }
  }
}
