class ListUserModel {
  int id;
  String login;
  String avatarUrl;

  ListUserModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  factory ListUserModel.fromJson(Map<String, dynamic> json) => ListUserModel(
        id: json["id"],
        login: json["login"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "avatar_url": avatarUrl,
      };
}
