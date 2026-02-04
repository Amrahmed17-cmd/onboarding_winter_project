import 'package:onboarding_winter_project/core/storage/shared_prefs_helper.dart';

class LocalDataSource {
  final SharedPrefsHelper _prefsHelper;

  LocalDataSource(this._prefsHelper);

  bool isVisitedBefore() {
    return _prefsHelper.getVisitedBefore();
  }

  bool isLoggedIn() {
    return _prefsHelper.getLoggedIn();
  }
}
