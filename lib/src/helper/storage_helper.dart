import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  StorageHelper._();
  static final StorageHelper instance = StorageHelper._();

  final storage = const FlutterSecureStorage();

  Future<Map<String, String>> readAllValues() async {
    final _result = await storage.readAll();
    return _result;
  }

  Future<String?> read({required String key}) async {
    final _result = await storage.read(key: key);
    return _result;
  }

  Future<void> write({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  Future<void> delete({required String key}) async{
    await storage.delete(key: key);
  }
}
