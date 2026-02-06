import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding_winter_project/core/common_widgets/all_featured_section.dart';
import 'package:onboarding_winter_project/core/resources/app_colors.dart';
import 'package:onboarding_winter_project/features/home/models/category.dart';
import 'package:onboarding_winter_project/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:onboarding_winter_project/features/home/presentation/home_cubit/home_state.dart';
import 'package:onboarding_winter_project/features/home/presentation/widgets/category_chip.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(),
              _buildSearchBar(),
              AllFeaturedSection(onSortPressed: () {}, onFilterPressed: () {}),
              _buildCategoriesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: AppColors.blackColor),
            onPressed: () {},
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/logo2.png',
                height: 45,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/avatar.png'),
            backgroundColor: AppColors.greyC4Color,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteF3Color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search any Product..',
            hintStyle: TextStyle(color: AppColors.greyA8Color, fontSize: 14),
            prefixIcon: Icon(Icons.search, color: AppColors.greyA8Color),
            suffixIcon: Icon(Icons.mic_outlined, color: AppColors.greyA8Color),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(color: Color(0xFF4169E1)),
            ),
          );
        } else if (state is HomeSuccessState) {
          return _buildCategoriesList(state.categories);
        } else if (state is HomeErrorState) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                state.message,
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildCategoriesList(List<Category> categories) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CategoryChip(
              name: categories[index].name,
              imageUrl: categories[index].imageUrl,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
