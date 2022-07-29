import 'package:dio/dio.dart';
import 'package:flutter_fetch_api_with_dio/model/post_model.dart';

class DioClient {
  final String endpoint = "https://jsonplaceholder.typicode.com/";
  final String path = "posts";
  Future<List<PostModel>> getPost() async {
    try {
      final response = await Dio(BaseOptions(baseUrl: endpoint)).get(path);
      final List data = response.data;
      return data.map((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
