class PostModel {
  final int UserId;
  final int id;
  final String title;
  final String body;

  PostModel(
      {required this.UserId,
      required this.id,
      required this.title,
      required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      UserId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"]);
}
