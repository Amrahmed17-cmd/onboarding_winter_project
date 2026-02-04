import 'package:onboarding_winter_project/features/onboarding/data/data_source/local/local_onboarding_data_source.dart';
import 'package:onboarding_winter_project/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final LocalOnboardingDataSource _localDataSource;

  OnboardingRepositoryImpl(this._localDataSource);

  @override
  void setOnboardingVisitBefore(bool isVisited) {
    _localDataSource.setOnboardingVisitBefore(isVisited);
  }
}
