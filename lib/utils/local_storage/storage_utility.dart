import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  // Singleton instance
  static final TLocalStorage _instance = TLocalStorage._internal();

  // Factory constructor to return the singleton instance
  factory TLocalStorage() {
    return _instance;
  }

  // Private named constructor
  TLocalStorage._internal();

  final _storage = GetStorage();

  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Method to clear all stored data
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
