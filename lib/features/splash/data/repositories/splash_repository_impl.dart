import 'package:onboarding_winter_project/features/splash/data/data_source/local/local_data_source.dart';
import 'package:onboarding_winter_project/features/splash/domain/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final LocalDataSource _localDataSource;

  SplashRepositoryImpl(this._localDataSource);

  @override
  bool isLoggedIn() {
    return _localDataSource.isLoggedIn();
  }

  @override
  bool isVisitedBefore() {
    return _localDataSource.isVisitedBefore();
  }
}
