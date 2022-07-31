import 'package:flutter_fetch_api_with_dio/core/dio_client.dart';
import 'package:flutter_fetch_api_with_dio/model/user_model.dart';
import 'package:flutter_fetch_api_with_dio/utlis/const.dart';

class UserRepository {
  Future<List<UserModel>> getUser() async {
    try {
      final result = await ApiClient().getData(ApiConst.path);
      final List data = result["data"];
      return data.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
