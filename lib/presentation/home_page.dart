import 'package:flutter/material.dart';
import 'package:flutter_fetch_api_with_dio/model/user_model.dart';
import 'package:shimmer/shimmer.dart';
import '../core/user_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fetch API with Dio")),
      body: FutureBuilder<List<UserModel>>(
        future: UserRepository().getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final value = snapshot.data![index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(value.avatar),
                    ),
                    title: Text(value.firstname + value.lastname),
                    subtitle: Text(value.firstname),
                  );
                });
          } else {
            return Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[300]!,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 100,
                    width: 200,
                  ),
                ));
          }
        },
      ),
    );
  }
}
