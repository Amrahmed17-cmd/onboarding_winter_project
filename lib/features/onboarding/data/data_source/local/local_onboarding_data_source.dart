import 'package:onboarding_winter_project/core/storage/shared_prefs_helper.dart';

class LocalOnboardingDataSource {
  final SharedPrefsHelper _sharedPrefsHelper;

  LocalOnboardingDataSource(this._sharedPrefsHelper);

  void setOnboardingVisitBefore(bool isVisited) {
    _sharedPrefsHelper.setVisitedBefore(isVisited);
  }
}
