import 'package:injectable/injectable.dart';
import 'package:load/load.dart';

@singleton
class LoaderService {
  int count = 0;
  bool get isLoading => count > 0;

  void show() {
    if (count == 0) showLoadingDialog(tapDismiss: false);
    count++;
  }

  void hide() {
    count--;
    if (count == 0) hideLoadingDialog();
  }
}
