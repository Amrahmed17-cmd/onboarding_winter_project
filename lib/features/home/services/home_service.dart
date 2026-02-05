import 'package:dio/dio.dart';
import 'package:onboarding_winter_project/core/network/api_constants.dart';
import 'package:onboarding_winter_project/core/network/api_exception.dart';
import 'package:onboarding_winter_project/core/network/api_result.dart';
import 'package:onboarding_winter_project/features/home/models/category.dart';

class HomeService {
  final Dio _dio;

  HomeService(this._dio);

  Future<ApiResult<List<Category>>> getCategories() async {
    try {
      Response response = await _dio.get(ApiConstants.categoriesEndPoint);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        List<Category> categories = [];

        for (var json in data) {
          String slug = json['slug'];
          String? imageUrl;

          try {
            Response productResponse = await _dio.get(
              'products/category/$slug',
              queryParameters: {'limit': 1},
            );

            if (productResponse.statusCode == 200 &&
                productResponse.data['products'] != null &&
                (productResponse.data['products'] as List).isNotEmpty) {
              imageUrl = productResponse.data['products'][0]['thumbnail'];
            }
          } catch (e) {
            imageUrl = null;
          }

          categories.add(
            Category(
              slug: json['slug'],
              name: json['name'],
              url: json['url'],
              imageUrl: imageUrl,
            ),
          );
        }

        return Success(categories);
      } else {
        return Failure(
          ApiException(errorMessage: response.statusMessage ?? response.data),
        );
      }
    } on DioException catch (e) {
      return Failure(ApiException.handleError(e));
    } catch (e) {
      return Failure(ApiException(errorMessage: e.toString()));
    }
  }
}
