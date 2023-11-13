import 'package:config_manager_core/config_manager_core.dart';

class FakeRemoteConfigStorage implements IRemoteConfigStorage {
  FakeRemoteConfigStorage({
    required RemoteConfigDefaults defaults,
  }) : _defaults = defaults;

  final RemoteConfigDefaults _defaults;

  @override
  T getValue<T extends Object?>(String key) {
    return _defaults[key] as T;
  }
}
