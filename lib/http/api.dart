import 'package:dio/dio.dart';
import 'package:zjsb_app/http/api_response.dart';
import 'package:zjsb_app/http/http_utils.dart';
import 'package:zjsb_app/models/category_entity.dart';

class GanRepository {
  static final String categories = "/product/list?groupId=1&langId=1";

  static Future<ApiResponse<CategoryEntity>> getCategories() async {
    try {
      print('getCategories');
      final response = await HttpUtils.get(categories);
      var data = CategoryEntity.fromJson(response);
      print(data);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
