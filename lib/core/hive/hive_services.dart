import 'package:hive/hive.dart';

class HiveCrudService<T> {
  final String boxName;
  Box<T>? _box;

  HiveCrudService(this.boxName);

  Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      _box = await Hive.openBox<T>(boxName);
    } else {
      _box = Hive.box<T>(boxName);
    }
  }

  Future<Box<T>> _getBox() async {
    if (_box == null || !_box!.isOpen) {
      await init();
    }
    return _box!;
  }

  Future<void> put(String key, T value) async {
    final box = await _getBox();
    await box.put(key, value);
  }

  Future<void> addAll(List<T> values) async {
    final box = await _getBox();
    for (var value in values) {
      await box.add(value);
    }
  }

  Future<T?> get(String key) async {
    final box = await _getBox();
    return box.get(key);
  }

  Future<List<T>> getAll() async {
    final box = await _getBox();
    return box.values.toList();
  }

  Future<void> delete(String key) async {
    final box = await _getBox();
    await box.delete(key);
  }

  Future<void> clear() async {
    final box = await _getBox();
    await box.clear();
  }

  Future<bool> containsKey(String key) async {
    final box = await _getBox();
    return box.containsKey(key);
  }

  Future<void> closeBox() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
    }
  }
}
