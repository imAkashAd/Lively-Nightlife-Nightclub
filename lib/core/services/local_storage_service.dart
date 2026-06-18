import 'package:get_storage/get_storage.dart';
import 'package:lively_nightlife_nightclub_party/core/utils/constants/storage_keys.dart';


class LocalStorageService {
  LocalStorageService._();

  static final LocalStorageService instance =
      LocalStorageService._();

  final GetStorage _box = GetStorage();

  Future<void> saveLoginStatus(
    bool value,
  ) async {
    await _box.write(
      StorageKeys.isLoggedIn,
      value,
    );
  }

  bool get isLoggedIn {
    return _box.read(
          StorageKeys.isLoggedIn,
        ) ??
        false;
  }

  Future<void> saveRole(
    String role,
  ) async {
    await _box.write(
      StorageKeys.userRole,
      role,
    );
  }

  String get role {
    return _box.read(
          StorageKeys.userRole,
        ) ??
        '';
  }

  Future<void> saveOnboardingStatus(
    bool value,
  ) async {
    await _box.write(
      StorageKeys.onboardingCompleted,
      value,
    );
  }

  bool get onboardingCompleted {
    return _box.read(
          StorageKeys.onboardingCompleted,
        ) ??
        false;
  }

  Future<void> clearAll() async {
    await _box.erase();
  }
}