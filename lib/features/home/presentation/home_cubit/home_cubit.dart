import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/home/models/category.dart';
import 'package:onboarding_winter_project/features/home/services/home_service.dart';
import 'package:onboarding_winter_project/features/home/presentation/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;

  HomeCubit(this._homeService) : super(HomeInitialState());

  Future<void> getCategories() async {
    emit(HomeLoadingState());

    ApiResult<List<Category>> result = await _homeService.getCategories();

    if (result is Success<List<Category>>) {
      emit(HomeSuccessState(result.data ?? []));
    } else {
      emit(
        HomeErrorState(
          (result as Failure).exception.errorMessage ??
              'Failed to load categories',
        ),
      );
    }
  }
}
