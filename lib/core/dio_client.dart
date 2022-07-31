import 'package:dio/dio.dart';
import 'package:flutter_fetch_api_with_dio/model/user_model.dart';
import 'package:flutter_fetch_api_with_dio/utlis/const.dart';

class DioClient {
  Future<List<UserModel>> getUser() async {
    try {
      final response = await Dio(
        BaseOptions(
          baseUrl: ApiConst.endpoint,
        ),
      ).get(ApiConst.path);
      final List data = response.data["data"];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
