import 'package:dio/dio.dart';
import 'package:flutter_fetch_api_with_dio/utlis/const.dart';
class ApiClient {
  Future getData(String path) async {
    try {
      final resonse =
          await Dio(BaseOptions(baseUrl: ApiConst.baseUrl)).get(path);
      return resonse.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
