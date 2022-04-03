import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class DatabaseService {
  Future<T?> read<T>(String name) async {
    Box _box = await Hive.openBox('city_weather');
    return _box.get(name);
  }

  Future<void> write(String name, dynamic value) async {
    Box _box = await Hive.openBox('city_weather');
    await _box.put(name, value);
  }
}
