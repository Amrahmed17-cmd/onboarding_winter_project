import 'package:onboarding_winter_project/features/home/models/category.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<Category> categories;

  HomeSuccessState(this.categories);
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState(this.message);
}
