import 'package:flutter/material.dart';
import 'package:flutter_fetch_api_with_dio/model/user_model.dart';
import '../core/dio_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fetch API with Dio")),
      body: FutureBuilder<List<UserModel>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final value = snapshot.data![index];

                  return ListTile(
                    leading: Image.network(value.avatar),
                    title: Text(value.firstname + value.lastname),
                    subtitle: Text(value.firstname),
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
        future: DioClient().getUser(),
      ),
    );
  }
}
