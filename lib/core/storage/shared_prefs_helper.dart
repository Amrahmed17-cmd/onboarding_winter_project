import 'dart:convert';

import 'package:onboarding_winter_project/features/auth/domain/entities/user_data_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  final SharedPreferences _sharedPreferences;

  SharedPrefsHelper(this._sharedPreferences);

  //constants
  static const String _VISITED_BEFORE = 'visitedBefore';
  static const String _LOGGED_IN = 'loggedIn';
  static const String _USER_DATA = 'user_data';

  void setVisitedBefore(bool value) {
    _sharedPreferences.setBool(_VISITED_BEFORE, value);
  }

  void setLoggedIn(bool value) {
    _sharedPreferences.setBool(_LOGGED_IN, value);
  }

  bool getVisitedBefore() {
    return _sharedPreferences.getBool(_VISITED_BEFORE) ?? false;
  }

  bool getLoggedIn() {
    return _sharedPreferences.getBool(_LOGGED_IN) ?? false;
  }

  Future<void> saveUserData(UserDataEntity userDataEntity) async {
    Map<String, dynamic> userMap = userDataEntity.toMap();
    String userString = json.encode(userMap);
    await _sharedPreferences.setString(_USER_DATA, userString);
  }

  Future<void> clearAll() async {
    await _sharedPreferences.clear();
  }

  Future<void> clearAuthData() async {
    await _sharedPreferences.remove(_LOGGED_IN);
    await _sharedPreferences.remove(_USER_DATA);
  }
}
