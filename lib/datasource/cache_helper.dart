import 'dart:convert' hide utf8;

import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  Future get(String key);

  Future<bool> has(String key);

  Future<bool> put(String key, dynamic value);

  Future<bool> clear(String key);
}

class CacheImplementation extends CacheHelper {
  static CacheImplementation _instance;
  static CacheImplementation initCacheInstance(sp) {
    if (_instance == null) {
      _instance = CacheImplementation(sp);
    }
    return _instance;
  }

  static CacheImplementation get getCacheInstance => _instance;

  final SharedPreferences _sharedPreferences;

  CacheImplementation(this._sharedPreferences);

  @override
  Future<bool> has(String key) async {
    final bool f = await _basicErrorHandling(() async {
      return _sharedPreferences.containsKey(key) &&
          _sharedPreferences.getString(key).isNotEmpty;
    });
    return f;
  }

  @override
  Future<bool> clear(String key) async {
    final bool f = await _basicErrorHandling(() async {
      return await _sharedPreferences.remove(key);
    });
    return f;
  }

  @override
  Future get(String key) async {
    final f = await _basicErrorHandling(() async {
      if (await has(key)) {
        return await jsonDecode(_sharedPreferences.getString(key));
      }
      return null;
    });
    return f;
  }

  @override
  Future<bool> put(String key, dynamic value) async {
    final bool f = await _basicErrorHandling(() async {
      return await _sharedPreferences.setString(key, jsonEncode(value));
    });
    return f;
  }
}

extension on CacheHelper {
  _basicErrorHandling<T>(Future<T> onSuccess()) async {
    try {
      final f = await onSuccess();
      return f;
    } catch (e) {
      print(e);
    }
  }
}
