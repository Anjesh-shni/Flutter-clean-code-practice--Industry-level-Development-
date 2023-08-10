import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constant/app_constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstant.deviceFirstTime) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstant.userTokenKey) == null ? false : true;
  }
}