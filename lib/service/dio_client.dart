import 'package:dio/dio.dart';
import 'package:flutter_fetch_api_with_dio/model/user_model.dart';

class DioClient {
  final String endpoint = "https://reqres.in/api/";
  final String path = "users?page=2";
  Future<List<UserModel>> getPost() async {
    try {
      final response = await Dio(BaseOptions(baseUrl: endpoint)).get(path);
      final List data = response.data["data"];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
