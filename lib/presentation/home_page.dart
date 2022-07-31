import 'package:flutter/material.dart';
import 'package:flutter_fetch_api_with_dio/model/user_model.dart';

import '../service/dio_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("data")),
      body: FutureBuilder<List<PostModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data![1].body);
          } else {
            return const CircularProgressIndicator();
          }
        },
        future: DioClient().getPost(),
      ),
    );
  }
}
