import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config_core.dart';

class PreferencesConfigStorage implements ILocalConfigStorage {
  PreferencesConfigStorage({
    required SharedPreferences prefs,
    Map<String, dynamic> localConfigDefaults = const {},
  }) : _prefs = prefs,
       _defaults = localConfigDefaults;

  final SharedPreferences _prefs;
  final Map<String, dynamic> _defaults;
  late final Subject<Entry> _publisher = BehaviorSubject();

  @override
  Future<void> close() => _publisher.close();

  @override
  T getValue<T extends Object?>(String key) {
    if (!_prefs.containsKey(key)) {
      return _defaults[key];
    }
    return _prefs.get(key) as T;
  }

  @override
  Future setValue<T extends Object>(String key, T value) =>
      _setValue(key, value).then((_) => _prefs.reload());

  Future<bool> _setValue(String key, value) async {
    bool emitNewValue = true;
    try {
      if (value is int) {
        return await _prefs.setInt(key, value);
      }
      if (value is bool) {
        return await _prefs.setBool(key, value);
      }
      if (value is double) {
        return await _prefs.setDouble(key, value);
      }
      if (value is String) {
        return await _prefs.setString(key, value);
      }
      if (value is List<String>) {
        return await _prefs.setStringList(key, value);
      }
      throw UnsupportedError('Value "$value" for key "$key" is unsupported');
    } catch (_) {
      emitNewValue = false;
      rethrow;
    } finally {
      if (emitNewValue) {
        _publisher.add(Entry(key: key, value: value));
      }
    }
  }

  @override
  Stream<T> watchValue<T extends Object>(String key) async* {
    T? initialValue = await getValue(key);
    if (initialValue is T) yield initialValue;

    yield* _publisher
        .where((e) => e.key == key && e.value is T)
        .map((e) => e.value)
        .distinct()
        .whereType<T>();
  }
}

class Entry {
  const Entry({required this.key, required this.value});

  final String key;
  final Object value;
}
